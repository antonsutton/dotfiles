# My dotfiles

## dotfiles

These dotfiles are for z-shell. This comes with Mac OSX and you can install the latest version using - `brew install zsh`

I use Mac OSX terminal or iTerm2 and have [Ethan Schoonover](http://ethanschoonover.com/solarized)'s 
solarized color theme configured plus

Basic steps to install all the dependencies I use to make terminal look and function how I like:

1 - Download and install SIMBL
2 - Download @timmfin's TerminalColors SIMBL bundle and install it to ~Library/Application Support/SIMBL/Plugins/ (create the directory if it doesn't exist)

To theme OSX terminal you'll need to install:

http://www.culater.net/software/SIMBL/SIMBL.php

and then 

A SIMBL plug-in for Terminal in Leopard which allows customisation of the text colours: https://github.com/timmfin/terminalcolours

- `brew install coreutils`
- `brew install grc`

Move word by word left and right in terminal change terminal settings to:

x /y z


## How to install the dotfiles

- `git clone git://github.com/damien7579/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## thanks

I forked [Zack Holman](http://github.com/holman)'s excellent [dotfiles](http://github.com/holman/dotfiles) 

I have also borrowed some tweaks and ideas from [Robby Russell](https://github.com/robbyrussell)'s 
community-driven framework for managing your zsh configuration "[OH-MY-ZSH](https://github.com/robbyrussell/oh-my-zsh)"