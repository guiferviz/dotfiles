# Guiferviz's dotfiles


## What does this dotfiles includes?

* Oh My Zsh configuration.
* NeoVim configuration with UltiSnips.
* This README :)

These configurations are built to work interchangeably on both Linux and Mac.


## Set-up on a new computer

Clone this repository in a directory called `.dotfiles` in your home directory.
We clone the repo in bare mode, so we are not going to clone the content of the
repo, just the git files (i.e. we will clone only the files that we usually
have in the `.git` directory in a normal repository).

```sh
$ git clone --bare git@github.com:guiferviz/dotfiles.git $HOME/.dotfiles
```

Create an alias to access git commands from everywhere in our PC.

```sh
$ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Checkout the files with:

```sh
$ dotfiles checkout
```

You can see an error if you already have some of the files in this repo. For
example, you can already have a different `.zshrc` file in your HOME directory.
To solve this problem, remove (or backup if it's important) the existing one
and run `dotfiles checkout` again.

More information in: https://www.atlassian.com/git/tutorials/dotfiles


## Usage

`dotfiles` is an alias for a git command in our `$HOME/.dotfiles` repo.
From any directory of your computer you can add files, commit and push like you
usually do in any other git repo.

For example, once I finish editing this README I will run the following
commands to add it to the dotfiles repo:

```sh
~ ⌚ 16:59:08
$ vim README.md

~ ⌚ 17:23:00
$ dotfiles add README.md   

~ ⌚ 17:23:07
$ dotfiles status       
On branch main
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	new file:   README.md

Untracked files not listed (use -u option to show untracked files)

~ ⌚ 17:23:10
$ dotfiles commit -m "adding readme"
[main 6fb7674] adding readme
 1 file changed, 58 insertions(+)
 create mode 100644 README.md

~ ⌚ 17:23:24
$ dotfiles push origin main         
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.70 KiB | 1.71 MiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:guiferviz/dotfiles.git
   a20be96..6fb7674  main -> main
```

This README is now in Github and can be fetched from any other PC.
