local function is_macos()
  local config = require("meta.config")
  local config_exts = config.options.lsp.vscode_extensions
  return vim.fn.isdirectory(config_exts.macos_app_dir) ~= 0
end

local function is_fedora()
  local config = require("meta.config")
  local config_exts = config.options.lsp.vscode_extensions
  return vim.fn.isdirectory(config_exts.fedora_app_dir) ~= 0
end

local function needs_proxy()
  return not (is_macos() or is_fedora())
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      languages = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "comment",
        "cpp",
        "css",
        "cuda",
        "diff",
        "elixir",
        "erlang",
        "fish",
        "gitattributes",
        "go",
        "gomod",
        "graphql",
        "hack",
        "haskell",
        "hcl",
        "heex",
        "hjson",
        "html",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        --"jsonc",
        "kotlin",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "ocaml",
        "ocaml_interface",
        "perl",
        "php",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "sql",
        "tlaplus",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "hgcommit",
      },
    },
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
    end,
    config = function(_, opts)
      local install = require("nvim-treesitter.install")
      install.prefer_git = false
      install.command_extra_args = {}
      if needs_proxy() then
        install.command_extra_args =
          { curl = { "--proxy", "http://fwdproxy:8080" } }
      end

      local parsers = require("nvim-treesitter.parsers")
      parsers.hgcommit = {
        install_info = {
          url = "https://github.com/fabiomcosta/tree-sitter-hg-commit",
          files = { "src/parser.c" },
          branch = "master",
        },
      }

      -- Install parsers
      local ts = require("nvim-treesitter")
      ts.install(opts.languages)

      -- -- Start treesitter for buffers that have a supported parser
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("LazyVimTSMain", { clear = true }),
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
          if lang and vim.treesitter.query.get(lang, "highlights") then
            -- Start Highlighting
            vim.treesitter.start(ev.buf, lang)
          end
          if lang and vim.treesitter.query.get(lang, "indents") then
            -- Enable TS Indent
            vim.bo[ev.buf].indentexpr =
              "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    opts = {
      move = {
        -- Lets you C-o to jump back after using a move
        set_jumps = true,
      },
    },
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      -- keymaps
      -- You can use the capture groups defined in `textobjects.scm`
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          "@function.outer",
          "textobjects"
        )
      end, { desc = "Goto next function start" })
      vim.keymap.set({ "n", "x", "o" }, "]c", function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          "@class.outer",
          "textobjects"
        )
      end, { desc = "Goto next class start" })
      -- You can also pass a list to group multiple queries.
      vim.keymap.set({ "n", "x", "o" }, "]o", function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          { "@loop.inner", "@loop.outer" },
          "textobjects"
        )
      end, { desc = "Goto next loop start" })
      -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
      vim.keymap.set({ "n", "x", "o" }, "]s", function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          "@local.scope",
          "locals"
        )
      end, { desc = "Goto next local scope start" })
      vim.keymap.set({ "n", "x", "o" }, "]z", function()
        require("nvim-treesitter-textobjects.move").goto_next_start(
          "@fold",
          "folds"
        )
      end, { desc = "Goto next fold start" })

      vim.keymap.set({ "n", "x", "o" }, "]F", function()
        require("nvim-treesitter-textobjects.move").goto_next_end(
          "@function.outer",
          "textobjects"
        )
      end, { desc = "Goto next function end" })
      vim.keymap.set({ "n", "x", "o" }, "]C", function()
        require("nvim-treesitter-textobjects.move").goto_next_end(
          "@class.outer",
          "textobjects"
        )
      end, { desc = "Goto next class end" })

      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start(
          "@function.outer",
          "textobjects"
        )
      end, { desc = "Goto previous function start" })
      vim.keymap.set({ "n", "x", "o" }, "[c", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start(
          "@class.outer",
          "textobjects"
        )
      end, { desc = "Goto previous class start" })

      vim.keymap.set({ "n", "x", "o" }, "[F", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end(
          "@function.outer",
          "textobjects"
        )
      end, { desc = "Goto previous function end" })
      vim.keymap.set({ "n", "x", "o" }, "[C", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end(
          "@class.outer",
          "textobjects"
        )
      end, { desc = "Goto previous class end" })

      -- Go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      vim.keymap.set({ "n", "x", "o" }, "]d", function()
        require("nvim-treesitter-textobjects.move").goto_next(
          "@conditional.outer",
          "textobjects"
        )
      end, { desc = "" })
      vim.keymap.set({ "n", "x", "o" }, "[d", function()
        require("nvim-treesitter-textobjects.move").goto_previous(
          "@conditional.outer",
          "textobjects"
        )
      end, { desc = "" })
      local ts_repeat_move =
        require("nvim-treesitter-textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set(
        { "n", "x", "o" },
        ",",
        ts_repeat_move.repeat_last_move_opposite
      )

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set(
        { "n", "x", "o" },
        "f",
        ts_repeat_move.builtin_f_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "F",
        ts_repeat_move.builtin_F_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "t",
        ts_repeat_move.builtin_t_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "T",
        ts_repeat_move.builtin_T_expr,
        { expr = true }
      )
    end,
  },
}
