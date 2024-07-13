<p align="center"><img src="https://github.com/user-attachments/assets/244c4bfb-4dc5-4d22-a9c3-d45f12ab9a12"></p>

## Introduction

This repository is a resource to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed here.

## Setup

These instructions are for setting up new Mac devices. Instead, if you want to get started building your own dotfiles, you can [find those instructions below](#your-own-dotfiles).

### Create a separate volume to test install (optional)

After you've set up your new Mac you may want to wipe and clean install your old Mac. Follow [Installing macOS on a separate APFS volume - Apple Support](https://support.apple.com/en-us/HT208891) to do that. Don't forget to backup before messing with Disk Utility.

### Backup your data

If you choose to not do a separate volume definitely create a backup before completing the install.

## What's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/frankievalentine/dotfiles/fork), remove what you don't
use, and build on what you do use.

## Components

There's a few special files in the hierarchy.

- **config/**: Anything in `config/` will get added to your `$PATH` and be made
  available everywhere. This houses only our starship config at install. There will be more added here as more apps are installed.
- **.ssh/**: Houses our ssh config as well as our 1Password Agent for logging in with 1Password created ssh keys.
- **docs/**: Any defaults not able to be configured with our dotfiles is listed in this folder as well as other Mac apps.
- **scripts/start.sh**: `start.sh` is where the install begins. Installing CLI tools, Node, Yarn, plugins, some themes, etc.
- **scripts/cli.sh**: Important software necessary to run our dots first. This step also executes our Brewfile. To note Corepack is enabled by default. If you aren't familiar with Corepack see the Node.js documentation. Also includes global packages, but not using those in favor of run scripts.
- **scripts/dots.sh**: The dotfile run script. This is where we install and configure all the apps we use.
- **scripts/gfonts.sh**: Installs and configures all Google fonts. I would consider this highly optional. It is a large install, but helpful for designing.
- **scripts/mac.sh**: `mac.sh` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Some of the settings aren't able to be set through this method, look to the `macos-defaults.md` file for more settings. Tweak this script, and occasionally run `./scripts/mac.sh` from the dotfiles source directory from
time to time to keep your environment fresh and up-to-date.
- **scripts/ssh.sh**: Creates our ssh key and outputs the public key to be added to Github manually.

## Make it your own!

If you want to start with your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.mac.sh) file and adjust the settings to your liking.

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://formulae.brew.sh/cask/) to check if the app you want to install is available.

## Install

After backing up your Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences

2. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone --recursive git@github.com:frankievalentine/dotfiles.git ~/.dotfiles
   ```

3. Run the installation with:

   ```zsh
   cd ~/.dotfiles && ./scripts/dots.sh
   ```

4. Restart your computer to finalize the process

Your Mac is now ready to use!

> 💡 You can use a different location than `~/.dotfiles` if you want. Make sure you also update the reference in the [`.zshrc`](./.zshrc) file.

## Bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as _my_ dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/frankievalentine/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

---

**Enjoy!**

<p align="center"><img src="https://github.com/user-attachments/assets/6174b7fc-086e-46bc-8917-f78b8745b785"></p>
