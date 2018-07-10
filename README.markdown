# My dotfiles

## dotfiles

These dotfiles are for z-shell. This comes with Mac OSX and you can install the
latest version using - `brew install zsh`

## Top tips

- Use iTerm2
- See above.
- This setup uses oh-my-zsh via antigen
- Use something like solarized colour theme in iTerm2 e.g.: [Ethan Schoonover](http://ethanschoonover.com/solarized)'s (bootstrap script will install this for you)
- I use my dotfiles with machup and dropbox. I actually have my .dotfiles in a dropbox folder symlinked to my home folder. This way changes made are quickly sync'd and I can make releases to github when I can be arsed.

## How to install the dotfiles

- Dear lord, fork them first! Fork them like it's 1992.
- Clone your fork to ~/.dotfiles You can not call your clone 'Dolly'.
- Make changes to `zsh/zshrc.symlink` (and other files as you see fit)
- For first time setup on a clean machine you can do:
- `cd ~/.dotfiles/script`
- `./bootstrap` <- install all required dependencies including brew, apps and more. Sit back and watch the show as it will take some time.
- `./install` <- run any topical installers to install, say, pythony things
- `./osx` <- Restores some sensible base OSX settings. CAUTION: REVIEW THESE BEFORE BLINDLY .. oh what's the point; you've already moved on... well fuck you. I tried.
- (you may have to chmod +x the bash scripts in the above folder)

The bootstrap script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `bootstrap`.

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