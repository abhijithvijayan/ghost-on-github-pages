# Ghost Blog Platform on Github Pages

[![Visit blog!](https://img.shields.io/badge/visit-blog-blue.svg)](https://github.com/abhijithvijayan/ghost-blog-demo/)
[![Twitter Follow](https://img.shields.io/twitter/follow/espadrine.svg?style=social&label=Follow)](https://twitter.com/_abhijithv)

## Table of Contents

  * [Requirements](#requirements)
      + [1) Install Major Dependencies](#1-Install-Major-Dependencies)
      + [2) Install Other Packages](#2-Install-Other-Packages)
  * [Setup](#setup)
    + [1) Install Ghost](#1-Download-and-Install-Ghost)
    + [2) Create a new Github repository](#2-Create-your-GitHub-Pages-repo)
    + [3) Deploying to Github Pages](#3-Deploy-to-GitHub-Pages)
  * [How to update your blog?](#Write-new-Blog-posts)

<hr />

## Requirements

## 1) Install Major Dependencies

### Install [Python 2](https://www.python.org/download/releases/2.7.2/)
Install Python 2.X, because buster package doesn't support Python 3.
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python2.7
```

### Install [NodeJS](https://docs.ghost.org/docs/supported-node-versions)
Install a version that is officially supported by Ghost, just like Node v6.9 or Node v8.9.
```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Install [npm](https://nodejs.org/en/)
NodeJS package manager from `https://nodejs.org/en/`
```
sudo apt install npm
```

## 2) Install Other Packages

### Install Brew
```
sudo apt-get update
sudo apt install linuxbrew-wrapper
```

### Install Node.js runtime and npm
Ghost is written in Node.js, so you will need the Node.js runtime.

```
brew install node
brew install wget
sudo apt-get install build-essential
```
Update brew with the command
```
brew update
```
Once again run the update command. Refer [here](https://github.com/Linuxbrew/brew/blob/master/docs/Troubleshooting.md) for details.
```
brew update
```

Initialize npm 
```
npm init
```
Enter the credentials when asked
- github username in the name field, 
- repository name(username.github.io) for repository name, 
- a description. 

Leave the other less important fields empty.

Then run
```
npm install --production
```

### Install yarn
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn
```

### Install Buster
With the tool [Buster](https://github.com/axitkhurana/buster) you can export the Ghost blogs into static pages. 

First we install Buster with:
```
brew install python
sudo apt install python-pip
pip install --upgrade pip
sudo -H pip install buster
```
<hr />

## Setup

## 1) Download and Install Ghost
```
mkdir ghost
cd ghost
sudo npm install -g ghost-cli@latest
```
Empty the pwd
```
sudo rm -r *
```
Install Ghost
```
ghost install local --no-start --enable --port 2368
```
## Start Ghost
```
ghost start
```
Open browser and navigate to
```

```
![image](https://preview.ibb.co/no4n5U/desktop.jpg)

## Login to Ghost
```
http://localhost:2368/ghost/
```
Go to the above link in your browser ans if it doesn't show anything, check the status of the blog with
```
ghost status
```

Create an account, read the intial blog post how to edit with Markdown etc.

## 2) Create your GitHub Pages repo
See the [GitHub Pages Basics Documentation](https://help.github.com/categories/20/articles) for details.

You must use the `username/username.github.io` naming scheme. The repo name must be **lower case** even if your username has upper case letters.

## 3) Deploy to GitHub Pages
Create a file named `deploy.sh` with contents from [deploy.sh](deploy.sh)

Give permission 
```
chmod u+x deploy.sh
```
Deploy with
```
./deploy.sh
```

For the initial push, please wait up to 10 minutes until GitHub deploys your subdomain.

All upcoming pushes are much faster and you can see your static Ghost blog posts on https://username.github.io

<hr />

## Write new Blog posts
To write new Blog posts or update the existing ones, just start Ghost, edit, then generate and deploy the static pages.
```
cd ghost
ghost start
```
Visit 
```
http://localhost:2368/ghost/
```
Login and write new posts

## Deploy with Buster
After writing new posts, deploy with buster.
Run the [deploy.sh](deploy.sh) script/.
```
./deploy.sh
```
Enter the credentials when asked!

<hr />

### Voila! You got yourself a ghost blog on github pages.

https://github.com/abhijithvijayan/ghost-blog-demo

<!-- #### N.B. I made a script [deploy.sh](https://raw.githubusercontent.com/abhijithvijayan/ghost-on-github-pages/master/deploy.sh) for easiness. -->

<!--
My Blog also has a **Progressive Web App** and so I had to modify the `deploy.sh` script, `themes`, `header`, `footer` for PWA.
For comments I used [Gitment](https://github.com/imsun/gitment)
The theme I use is [Casper-beta](https://github.com/abhijithvijayan/__casper-beta)
-->
