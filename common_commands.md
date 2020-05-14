# Common commands

## General shell commands

```console
pwd   # get current path
cd -  # go back to previous location
cat filename  # show the contents of the file filename
du -sh .
du -sh *
du -sh . | tail -1
stat chmod
htop
tree
```

## SSH

### SSH Tunelling

```console
ssh -NL 8888:localhost:8888 username@ip
```

### Other ssh commands

**Generate ssh key:**

```console
ssh-keygen -t rsa
```

**Save ssh password so that no need to re-enter everytime**

```console
 ssh-copy-id extract@10.0.2.29
~/.ssh/config : save host info
```

## tmux

```console
tmux
tmux new -s name
tmux ls
tmux attach -t name
<prefix>=Ctrl+B (default), can be changed to Ctrl+A
<prefix> % "  (Splitting panes)
Ctrl+D (exit)
<prefix> D (get out )
<prefix> c: Create a new window (appears in status bar)
<prefix> 0: Switch to window 0
<prefix> 1: Switch to window 1
<prefix> x: Kill current window
<prefix> d: Detach tmux (exit back to normal terminal)
<prefix> z, the active pane is toggled between zoomed and unzoomed 
```

## Vim

```console
d starts the delete operation.
dw will delete a word.

p paste text after the current line.
P paste text on the current line.

y yank text into the copy buffer.
d -> cut

"+p paste from system
"+y copy into system
: % y + copy all into system

v highlight one character at a time.
V highlight one line at a time.
Ctrl-v highlight by columns.

u -> undo
Ctrl-r will redo the last undo.

/text search for text
:%s/text/replacement text/g search through the entire document for text and replace it with replacement text.
:%s/text/replacement text/gc search through the entire document and confirm before replacing text.

0 moves the cursor to the beginning of the line.
$ moves the cursor to the end of the line.
G move to the end of the file.
gg move to the beginning of the file.
`. move to the last edit.

:q
:q!
:wq
```

### nvim plugin commands:

```console
:bd -> remove buffer
:CtrlP -> find file
<C-e> -> Sidebar
<C-o> -> Toggle between buffers
space+d -> goto definitions
space+g -> goto ASSIGNMENTS
<C-w>w -> Switch cursors between sidebar and code
<C-n><C-n><C-n> -> multiple cursors:
    c -> change
    I -> Insert at first 
    A -> Insert at end 
```

**Open server in nautilus / file explorer**

```markdown
File explorer: Other locations > Connect to server > sftp://username@ip/
```

## i3 wm

- pavucontrol
- alsamixer

```console
mod + r - resize mode , then arrow keys or vim keys
mod + Shift + e - exit
mod + d - dmenu
mod+Shift+c reload
mod+Shift+r restart
```

Alt+Shift- Change keyboard language

## Git

```console
git commit --amend -> add to previous commits
git push origin -f branchname -> forced push
git rebase master -> merge changes of master onto the current branch (first pull from master before rebase)
git log
git diff
git remote -v -> show repo information
git reset --hard <SOME-COMMIT> eg git reset --hard HEAD@1
git show
git config --global user.name
git config --global user.email
git reset <file> -> remove file from the current index (the "about to be committed" list) without changing anything else.
git checkout filename -> Undo local changes to latest commit
```

### Hard delete unpublished commits

```console
git reset --hard commit_id (reset to the particular commit. It will destroy any local modifications.)
```

### Alternatively, if there's work to keep:

```console
git stash
git reset --hard commit_id
git stash pop
```
> This saves the modifications, then reapplies that patch after resetting. You could get merge conflicts, if you've modified things which were changed since the commit you reset to.

### Undo published commits with new commits

> This will create three separate revert commits:

```console
git revert a867b4af 25eee4ca 0766c053
```

> It also takes ranges. This will revert the last two commits:

```console
git revert HEAD~2..HEAD
```

> Similarly, you can revert a range of commits using commit hashes:

```console
git revert a867b4af..0766c053 
```

> Reverting a merge commit

```console
git revert -m 1 <merge_commit_sha>
```

> To get just one, you could use `rebase -i` to squash them afterwards Or, you
> could do it manually (be sure to do this at top level of the repo) 

> get your index and work tree into the desired state, without changing HEAD:

```console
git checkout 0d1d7fc32 .
```

> Then commit. Be sure and write a good message describing what you just did

```console
git commit
```

### Git reset

git reset does know five "modes": soft, mixed, hard, merge and keep. I will start with the first three, since these are the modes you'll usually encounter. After that you'll find a nice little a bonus, so stay tuned.

- soft

    When using

    ```console
    git reset --soft HEAD~1
    ```

     you will remove the last commit from the current branch, but the file changes 
    will stay in your working tree. Also the changes will stay on your index, so following with a git commit will create a commit with the exact same changes as the commit you "removed" before.

- mixed

    This is the default mode and quite similar to soft. When "removing" a commit
    with

    ```console
    git reset HEAD~1
    ```

     you will still keep the changes in your working tree but not on the index; so if you want to "redo" the commit, you will have to add the changes (git add) before commiting.

- hard

    When using

    ```console
    git reset --hard HEAD~1
    ```

    you will lose all uncommited changes in addition to the changes introduced in the last commit. The changes won't stay in your working tree so doing a git status command will tell you that you don't have any changes in your repository.

    > Tread carefully with this one. If you accidentally remove uncommited changes which were never tracked by git (speak: committed or at least added to the index), you have no way of getting them back using git.

- Bonus (keep)


    ```console
    git reset --keep HEAD~1
    ```

    is an interesting and useful one. It only resets the files which are different between the current HEAD and the given commit. It aborts the reset if anyone of these files has uncommited changes. It's basically acts as a safer version of hard.

    > This mode is particularly useful when you have a bunch of changes and want to switch to a different branch without losing these changes - for example when you started to work on the wrong branch.

### Other git commands

```console
git rm -> rm plus git add combined
git rm --cached -> file removed from the index (staging it for deletion on the next commit), but keep your  copy in the local file system.
```