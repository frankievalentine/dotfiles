#!/bin/sh
# Setup a machine for VSCode
set -x

vscode_dir=~/Library/Application\ Support/Code
ln -s "$PWD/User" "$vscode_dir/User"

code --install-extension adpyke.codesnap
code --install-extension Atishay-Jain.All-Autocomplete
code --install-extension bradlc.vscode-tailwindcss
code --install-extension christian-kohler.npm-intellisense
code --install-extension cnakazawa.dunkel-theme
code --install-extension cnakazawa.licht-theme
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension GitHub.copilot
code --install-extension GraphQL.vscode-graphql
code --install-extension GraphQL.vscode-graphql-syntax
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode.live-server
code --install-extension nhoizey.gremlins
code --install-extension Prisma.prisma
code --install-extension rust-lang.rust-analyzer
code --install-extension silvenon.mdx
code --install-extension svelte.svelte-vscode
code --install-extension usernamehw.errorlens
code --install-extension ziyasal.vscode-open-in-github
code --install-extension znck.grammarly