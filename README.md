# My Personal Blog

## Ghost Blog Platform on Github Pages

### Hosted on [https://blog.abhijithvijayan.me](https://abhijithvijayan.github.io/ghost-on-github-pages/)


Major dependencies should be installed in your computer. This is only step currently done by your own.

- [Python 2](https://www.python.org/download/releases/2.7.2/): install some of Python 2.X, because buster package doesn't support Python 3.

- [NodeJS](https://docs.ghost.org/docs/supported-node-versions): install a version that is officially supported by Ghost, just like Node v6.9 or Node v8.9.

- [npm](https://nodejs.org/en/): NodeJS package manager.

Besides that, there's some minor dependencies too, but they should be automatically installed for you.

To build your own static [GitHub Pages](https://pages.github.com) with [Ghost](https://ghost.org), just follow these steps.

## Install Brew
```
sudo apt-get update
sudo apt install linuxbrew-wrapper
```

## Install Node.js and npm
Ghost is written in Node.js, so you will need the Node.js runtime.

```
brew install node
brew install wget
sudo apt install npm
npm init
npm install --production
```

## Download and Install Ghost
```
mkdir ghost
cd ghost
sudo npm install -g ghost-cli@latest
ghost install local --no-start --enable --port 2368
```
## Start Ghost
```
ghost start
```

## Login to Ghost
```
http://localhost:3268/ghost/
```
Go to the above link in your browser

Create an account, read the intial blog post how to edit with Markdown etc.

## Change folder permissions in your local computer with your Ubuntu username
```
sudo chown username:username /home/username/ghost
```

## Install Buster
With the tool [Buster](https://github.com/axitkhurana/buster) you can export the Ghost blogs into static pages. 

First we install Buster with:
```
brew install python
sudo apt install python-pip
sudo -H pip install buster
```
## Create your GitHub Pages repo
See the [GitHub Pages Basics Documentation](https://help.github.com/categories/20/articles) for details.

You must use the `username/username.github.io` naming scheme. The repo name must be **lower case** even if your username has upper case letters.

I have placed the `static` folder for Buster inside my Ghost installation. 
```
mdkir static
```
So I just cloned my `username/username.github.io` repo with a target directory name like this:
```
git clone https://github.com/username/username.github.io.git static
```
This will clone the empty repo to the 'static' folder inside ghost directory.

## Deploy to GitHub Pages
```
sudo buster generate --domain=http://localhost:2368

sudo buster deploy
```
Enter your github username and password.

This will add, commit and push all files in the `static` folder to your GitHub repo.

For the initial push, please wait up to 10 minutes until GitHub deploys your subdomain.

All upcoming pushes are much faster and you can see your static Ghost blog posts on https://username.github.io

### Voila! Visit the github pages [link](https://abhijithvijayan.github.io/ghost-on-github-pages)

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

```
cd static
sudo rm -r *
cd ..
sudo buster generate --domain=http://localhost:2368
sudo buster deploy
```

Done!

#### N.B. I made a script [deploy.sh](https://raw.githubusercontent.com/abhijithvijayan/ghost-on-github-pages/master/deploy.sh) for easiness.

My Blog also has a **Progressive Web App** and so I had to modify the deploy.sh script, themes, header, footer for PWA.

For comments I use [Gitment](https://github.com/imsun/gitment)
