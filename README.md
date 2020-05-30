# Ghost Blog Platform on Github Pages

[![](https://img.shields.io/badge/last--update-Apr--2020-red.svg)](https://github.com/abhijithvijayan/ghost-on-github-pages/commits/master)
[![Visit blog!](https://img.shields.io/badge/visit-blog-blue.svg)](https://abhijithvijayan.github.io/ghost-blog-demo/)

> https://abhijithvijayan.github.io/ghost-blog-demo/

<h3>🙋‍♂️ Made by <a href="https://twitter.com/_abhijithv">@abhijithvijayan</a></h3>
<p>
  Donate:
  <a href="https://www.paypal.me/iamabhijithvijayan" target='_blank'><i><b>PayPal</b></i></a>,
  <a href="https://www.patreon.com/abhijithvijayan" target='_blank'><i><b>Patreon</b></i></a>
</p>
<p>
  <a href='https://www.buymeacoffee.com/abhijithvijayan' target='_blank'>
    <img height='36' style='border:0px;height:36px;' src='https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png' border='0' alt='Buy Me a Coffee' />
  </a>
</p>
<hr />

Update: The flexibility of this project allows you to push the static site to any github repo and deploy it with any service like [Netlify](https://netlify.app). I'd recommend connecting the repo to Netlify service and deploy it there. Also, Netlify provides features like Custom Domain free of charges.

## Table of Contents

- [Requirements](#requirements)
  - [1) Install Major Dependencies](#1-Install-Major-Dependencies)
  - [2) Install Other Packages](#2-Install-Other-Packages)
- [Setup](#setup)
  - [1) Install Ghost](#1-Download-and-Install-Ghost)
  - [2) Create a new Github repository](#2-Create-your-GitHub-Pages-repo)
  - [3) Deploying to Github Pages](#3-Deploy-to-GitHub-Pages)
- [How to update your blog?](#Write-new-Blog-posts)

<hr />

## Requirements

## 1) Install Major Dependencies

### Install [NodeJS](https://nodejs.org/en/download/package-manager/)

Install a version that is officially [supported]((https://docs.ghost.org/docs/supported-node-versions)) by Ghost, preferably latest LTS

```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## 2) Install Other Packages

### Install [Homebrew](https://brew.sh/)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Install Node.js runtime

Ghost is written in Node.js, so you will need the Node.js runtime.

```
brew install node
brew install wget
sudo apt-get install build-essential
```

Initialize npm

```
npm init
```

Enter the credentials when asked

- github username in the name field\*
- repository name(eg: username.github.io)
- a description\*

Leave the other less important fields empty.

### Install [yarn](https://classic.yarnpkg.com/en/docs/install/#debian-stable)

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```

<hr />

## Setup

## 1) Download and Install Ghost

```
npm install ghost-cli@latest -g
```

Change the present working directory

```
mkdir ghost && cd ghost
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
http://localhost:2368/
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

![](https://i.imgur.com/OeAsLDw.png)

Create an account, read the intial blog post how to edit with Markdown etc.

## 2) Create your GitHub Pages repo

Create a repo with [`create-remote-repo`](https://github.com/abhijithvijayan/create-remote-repo-cli) CLI

You must use the `username/username.github.io` naming scheme. The repo name must be **lower case** even if your username has upper case letters.

```js
npx create-remote-repo username.github.io

# Replace with your username
```

## 3) Deploy to GitHub Pages

Create a file named `deploy.sh` with contents from [deploy.sh](deploy.sh)

Give execute permission

```
chmod u+x deploy.sh
```

Deploy with

```
./deploy.sh
```

For the initial push, please wait up to 10 minutes until GitHub deploys your subdomain.

All upcoming pushes are much faster and you can see your static ghost blog posts at <https://username.github.io>

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

## Deploy with `wget`

After writing new posts, deploy with `wget`.
Run the [deploy.sh](deploy.sh) script/.

```
./deploy.sh
```

Enter the credentials when asked!

<hr />

### Voila! You got yourself a ghost blog on github pages

- Live Version: <https://abhijithvijayan.github.io/ghost-blog-demo/>
- Demo Repo: <https://github.com/abhijithvijayan/ghost-blog-demo>
- Custom Theme Repo: <https://github.com/abhijithvijayan/Casper-XYZ>

<!-- #### N.B. I made a script [deploy.sh](https://raw.githubusercontent.com/abhijithvijayan/ghost-on-github-pages/master/deploy.sh) for easiness. -->

<!--
My Blog also has a **Progressive Web App** and so I had to modify the `deploy.sh` script, `themes`, `header`, `footer` for PWA.
For comments I used [Gitment](https://github.com/imsun/gitment)
-->
