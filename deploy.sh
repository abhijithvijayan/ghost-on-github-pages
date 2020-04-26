#!/usr/bin/env bash

GHOST_URL="localhost:2368/"
OUTDIR=static

setup() {
		echo ' -------------------- INFORMATION NEEDED -------------------- '
		echo ''
		echo "Following you'll be asked to enter a Github Username and Git Remote URL in which you would like to deploy Ghost."
		echo "Example:"
		echo "       https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git"
		echo ''
		read -p "Github username: "  gh_username
		read -p "Remote URL: "  remote_url
		echo "Leave blank if repo name is username.github.io"
		read -p "Repo name: " gh_repo

		wget -r -nH -P $OUTDIR -E -T 2 -np -k $GHOST_URL

		find $OUTDIR -name *.html -type f -exec sed -i '''s#http://localhost:2368#'$gh_username'.github.io/'$gh_repo'#g' {} \;

		cd $OUTDIR
		git init
		git remote add origin "$remote_url"

		git add .
		git commit -m "Initial commit"
		git push origin master:master master:gh-pages -f
}

update() {
		rm -rf $OUTDIR/*

		wget -r -nH -P $OUTDIR -E -T 2 -np -k $GHOST_URL

		echo ''
		echo ' -------------------- FIXING LINKS  -------------------- '
		echo ''
		read -p "Github username: "  gh_username
		echo "Leave blank if repo name is username.github.io"
		read -p "Repo name(eg: ghost-blog-demo): " gh_repo

		# Fix links
		find $OUTDIR -name *.html -type f -exec sed -i '''s#http://localhost:2368#'$gh_username'.github.io/'$gh_repo'#g' {} \;

		echo ''
		echo ' ------------------- FIXING IMAGES  -------------------- '
		echo ''
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.jpgg 600w#''.jpg 600w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.jpgpg 1000w#''.jpg 1000w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.jpgjpg 2000w#''.jpg 2000w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.jpegg 600w#''.jpg 600w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.jpegeg 1000w#''.jpg 1000w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.jpegpeg 2000w#''.jpg 2000w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.pngg 600w#''.png 600w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.pngng 1000w#''.png 1000w''#g' {} \;
		find $OUTDIR -name *.html -type f -exec sed -i '''s#.pngpng 2000w#''.png 2000w''#g' {} \;

		echo '[INFO] Deploying to your Github repository...'

		# Commiting changes
		cd $OUTDIR
		git add .
		git commit -m "Update on the website at $(date)"
		git push origin master:master master:gh-pages -f
}

# entry point
build() {
		mkdir $OUTDIR # this might fail when folder exist
		cd $OUTDIR
		repo_status="$(git status)"
		case "fatal" in
  			*"$repo_status"*)
				echo '[INFO] Configuring git repository...'
				echo '[INFO] Generating static files from Ghost server...'
				cd ..
				setup
    			exit
    		;;
		esac
		cd ..
		update
}

build

