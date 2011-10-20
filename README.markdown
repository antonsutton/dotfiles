# My dotfiles

## dotfiles

These dotfiles are for z-shell. This comes with Mac OSX and you can install the 
latest version using - `brew install zsh`

I use Mac OSX terminal and have [Ethan Schoonover](http://ethanschoonover.com/solarized)'s 
solarized color theme configured.

Useful extensions to install:

- `brew install coreutils`
- `brew install grc`

## How to install the dotfiles

- `git clone git://github.com/antonsutton/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

For a fresh install of OS X Snow Leopard or Lion you can setup some nice defaults:

- cd osx
- ./osdefaults.sh

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## thanks

I forked [Zack Holman](http://github.com/holman)'s excellent [dotfiles](http://github.com/holman/dotfiles) 

I used [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)'s OS X defaults for my own osxdefaults.sh file in the osx folder.

I have also borrowed some tweaks and ideas from [Robby Russell](https://github.com/robbyrussell)'s 
community-driven framework for managing your zsh configuration "[OH-MY-ZSH](https://github.com/robbyrussell/oh-my-zsh)"

# Roger Buck

Oh, and for the love of all that is simple, install [Brew](https://github.com/mxcl/homebrew). 
Take ol' MacPorts and scruffy mangy Fink to the back of the old shed and send 
them to digital heaven. Please.

That is all. [Bidi Bidi](http://www.youtube.com/watch?feature=player_detailpage&v=FfzGayknSn4#t=76s)