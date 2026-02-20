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
    "saghen/blink.cmp",
    dependencies = { "meta.nvim" },
    version = '1.*',
    opts = {
      fuzzy = {
        prebuilt_binaries = {
          extra_curl_args = needs_proxy() and { "--proxy", "http://fwdproxy:8080" } or { },
        },
      },
      sources = {
        default = {
          'meta_title',
          'meta_tags',
          'meta_tasks',
          'meta_revsub',
        },
        providers = {
          meta_title = {
            name = 'MetaTitle',
            module = 'meta.cmp.title',
          },
          meta_tags = {
            name = 'MetaTags',
            module = 'meta.cmp.tags',
          },
          meta_tasks = {
            name = 'MetaTasks',
            module = 'meta.cmp.tasks',
          },
          meta_revsub = {
            name = 'MetaRevSub',
            module = 'meta.cmp.revsub',
          },
        },
      },
    },
    -- magic lazy.nvim option that extends the default sources.default
    -- option instead of overwritting it.
    opts_extend = { "sources.default" }
  },
}
