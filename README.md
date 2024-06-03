# cpr-dev
Codespace for development of MusicCPR (unless it ends up too expensive or too slow)

## Setup
1. ensure that you have a fork of both the frontend repository and the backend repositories in **your github account**:
    1. [frontend](https://github.com/Lab-Lab-Lab/CPR-Music)
        1. so you should have a repo at _almost_**EXACTLY** this url`https://github.com/YOUR_GITHUB_USER_NAME/CPR-Music`
    1. [backend](https://github.com/Lab-Lab-Lab/CPR-Music-Backend)
        1. so you should have a repo at _almost_**EXACTLY** this url`https://github.com/YOUR_GITHUB_USER_NAME/CPR-Music-Backend`
1. click the green "Use this template" button on this repository to create a new repository for your own development on this project, but create it also in this organization (`Lab-Lab-Lab`, so that you'll have $free access to the codespace)
1. on the resulting 

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
