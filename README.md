<p align="center"><img src="https://github.com/user-attachments/assets/244c4bfb-4dc5-4d22-a9c3-d45f12ab9a12"></p>

## Introduction

This repository is a resource to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed here. Please see the [Before Installing](#before-installing) section before moving forward with these dotfiles. The entire process will take up to an hour or more if you choose to download all the Google fonts.

> [!NOTE]
> The default setup of these dotfiles are highly focused on web development, but can be customized otherwise for your specific stacks.

## Setup

These instructions are for setting up new Mac devices. It is a highly optimized and configured setup specifically tailored to myself. It works through 5 main scripts that generate a system that is configured to the highest possibility without manual intervention. However, a lot of manual setup is required to get to a working state.

Post setup will mainly involve doing necessary setup including starting all the new applications, allowing applications to be run through MacOS security, signing in, and moving some things around to your liking. This will mainly be documented in the [./docs/app-specific-setup](./docs/app-specific-setup.md) and the [./docs/macos-defaults.md](./docs/macos-defaults.md).

The install will also require you to type in your system password at different points in the install to move forward with the necessary installation.

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

- **.config/**: Anything in `.config/` will get added to your `$PATH` and be made
  available everywhere. This contains specific tooling configuration that will also be available once the Brewfile has completed bundling.
- **.ssh/**: Houses our SSH config as well as our 1Password Agent for logging in with 1Password for created SSH keys.
- **docs/**: Any defaults not able to be configured with our dotfiles is listed in this folder as well as other Mac apps.
- **docker/compose**: Contains collection compose files over some time that I keep as a reference and to run compose files out of using Orbstack.
- **icons/**: This contains icons that are used for the main applications that are added to the Dock array.
- **scripts/cli.sh**: Important software necessary to run our dots first. This step also executes our Brewfile. To note Corepack is enabled by default. If you aren't familiar with Corepack see the Node.js documentation. It includes optional global packages, but we are not using those in favor of run scripts.
- **scripts/dots.sh**: The dotfile run script. This is where we install and configure all the apps we use.
- **scripts/mac.sh**: `mac.sh` is a simple script that installs some sane macOS
defaults, and so on. Some of the settings aren't able to be set through this method, look to the `macos-defaults.md` file for more settings to be set manually. Tweak this script, and occasionally run `./scripts/mac.sh` from the dotfiles source directory from
time to time to keep your environment fresh and up-to-date. A great resource to look at for considering some defaults for your own dotfiles is [MacOS Defaults](https://macos-defaults.com/).
- **scripts/ssh.sh**: Creates an SSH key for the new machine. Otherwise login through the Github CLI to begin using git.

- *Optional script* - **scripts/fonts.sh**: Installs and configures all Google fonts. It is a large install, but helpful for designing.
- *Optional script* - **scripts/apps.sh**: This adds the necessary applications to be persistent in the Dock. Intentionally not included in the dots script because not all persistent apps are included in the Homebrew bundle installation. You can edit this to add your persistent apps and run post installation of all necessary apps.

## Before Installing

If you want to start with your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

1. Go to the [`.mac`](./scripts/mac.sh) file and adjust the system and network name to your preferred system name.

2. Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://formulae.brew.sh/cask/) to check if the app you want to install is available. There is also some Mac App Store specific apps included in this Brewfile which require you to be signed in to an Apple Account.

3. Go to [`.config/git/.gitconfig`](./.config/git/.gitconfig) and update your preferred git configuration.

## Install

After backing up your Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences (if not updated already)

2. Clone this repo to `~/.dotfiles` with:

   ```bash
   git clone --recursive git@github.com:frankievalentine/dotfiles.git ~/.dotfiles
   ```

   > 💡 PLEASE GO THROUGH 'BEFORE INSTALLING' SECTION ABOVE AFTER CLONING. You could choose a different location than `~/.dotfiles` (not recommended). If you do change the location please be sure to update the `dots.sh` script to the correct folder location.

3. Remove the .git folder from the dotfiles `~/.dotfiles` clone to begin your own version control repository.

   ```bash
      rm -rf ~/.dotfiles/.git
   ```

4. Create a new .git repository

   ```bash
      git init ~/.dotfiles
   ```

5. Install Homebrew & Command Line Tools. We want to download the Command Line Tools directly from Apple Developer.

   ```bash
      # Homebrew
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

   > 💡 Make sure to run the commands Homebrew provides after install.

6. Install GNU stow using Homebrew.

   ```bash
      brew install stow
   ```

7. Symlink the .dotfiles repo to your home folder using GNU stow.

   ```bash
      cd ~/.dotfiles
      stow --adopt .
   ```

8. Run the installation with:

   ```bash
      sh ./scripts/dots.sh
   ```

9. Add headline oh my zsh theme, remove oh my zsh generated .zshrc

   ```bash
      mv ~/.dotfiles/.oh-my-zsh/themes/headline.zsh-theme ~/.oh-my-zsh/themes
      rm .zshrc
      mv .zshrc-pre-oh-my-zsh .zshrc
      source .zshrc
   ```


Your Mac is now ready to use!

## Bugs

I want this to work for everyone. That
said, I do use this as _my_ dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/frankievalentine/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

---

**Enjoy!**

<p align="center"><img src="https://github.com/user-attachments/assets/6174b7fc-086e-46bc-8917-f78b8745b785"></p>
