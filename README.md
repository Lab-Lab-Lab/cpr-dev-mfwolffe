# cpr-dev
Dev Container config for development of MusicCPR to support simpler onboarding either via (remote)  GitHub Codespaces or (local) docker container (unless it ends up too expensive or too slow).

## Setup
1. ensure that you have a fork of both the frontend repository and the backend repositories in **THIS github organization (`Lab-Lab-Lab`)**:
    1. [frontend](https://github.com/Lab-Lab-Lab/CPR-Music)
        1. so you should have a repo at _almost_ **EXACTLY** this url `https://github.com/Lab-Lab-Lab/CPR-Music-YOURUSERNAME`
            * for example mine is `https://github.com/Lab-Lab-Lab/CPR-Music-hcientist`
    1. [backend](https://github.com/Lab-Lab-Lab/CPR-Music-Backend)
        1. so you should have a repo at _almost_ **EXACTLY** this url`https://github.com/Lab-Lab-Lab/CPR-Music-Backend-YOURUSERNAME`
            * for example mine is `https://github.com/Lab-Lab-Lab/CPR-Music-Backend-hcientist`
1. click the green "Use this template" button on this repository to create a new repository for your own development on this project, but **create it also in _this_ organization (`Lab-Lab-Lab`) so that you'll have $free access to the codespace**
    1. in the dropdown for the `Owner`, choose `Lab-Lab-Lab`
    1. you will need to name it something different than just `cpr-dev`, i suggest just adding a suffix to the repo name, e.g. `cpr-dev-hcientist`.
    1. probably make the repository `public`
1. in the resulting repo, you need to replace `Lab-Lab-Lab/CPR-Music` `Lab-Lab-Lab/CPR-Music-Backend` and  with your github repo names in the following files:
    1. `.devcontainer/devcontainer.json`
        * [here's mine if you want to check your work](https://github.com/Lab-Lab-Lab/cpr-dev-hcientist/blob/main/.devcontainer/devcontainer.json#L47,L53)
    1. `scripts/setup.sh`
        * [here's mine if you want to check your work](https://github.com/Lab-Lab-Lab/cpr-dev-hcientist/blob/main/scripts/setup.sh#L2-L3)
1. commit those changes to your `cpr-dev-YOURUSERNAME` reopsitory.
1. On your computer, [install the GitHub CLI](https://github.com/cli/cli#installation) if you haven't already.
1. On your computer, [install Docker](https://docs.docker.com/get-docker/) if you haven't already.

## Usage

### In-browser Codespace
1. click the green `Code` button on your `cpr-dev` repository
1. select the `Codespaces` tab in the resulting popover
1. If you already have a codespace, click on it to launch it. 
1. Else, if you have no codespace for this repo, click the green `Create codespace on main` button

### Local Container
1. **using its HTTPS url** clone your `cpr-dev-USERNAME` repository to your local machine 
1. press the do everything hotkey <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> (or on macOS <kbd>command</kbd>+<kbd>shift</kbd>+<kbd>P</kbd>), type `reopen`, and then select `Dev Containers: Reopen in Container`


## Resources

I'm unsure what info will help do this well, but here's where i'm looking first:
1. [CS 159 S24 Codespace demo I threw together](https://github.com/159S24/codespace)
2. [vscode's doc about "remote python development" (they made it for flask, which isn't what we're doing, but it shows port forwarding which we will probably need)](https://github.com/microsoft/vscode-remote-try-python/blob/main/.devcontainer/devcontainer.json)
3. [some person's django dev codespace](https://github.com/github/codespaces-django/tree/main)
4. [someone's codespace for django with postgres](https://til.simonwillison.net/github/django-postgresql-codespaces)
5. [possible example?](https://github.com/codespaces-contrib/codespaces-multi-repo/tree/main)

## Questions
1. should we setup backend that's deployed somewhere (e.g. dev.musiccpr.org or similar) to accept requests from frontend running locally and/or in codespace?
    1. in which case should we start by creating only a codespace/devcontainer for frontend?
2. it seems like maybe sqlite supports everything we need for local, so should we revert to suggesting student devs/newbs/everyone use sqlite in local?

## Notes

### Tradeoffs
1. to do in-browser development in a codespace, we need to have the cpr-dev, frontend, and backend repos all forked (well, i guess cpr-dev isn't exactly a "fork") within Lab-Lab-Lab, for EACH developer...
1. in-browser sucks on a bad connection...