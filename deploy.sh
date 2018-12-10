#!/usr/bin/env bash

GHOST_URL="localhost:2368/"

# References:
# https://github.com/paladini/ghost-on-github-pages/blob/master/includes/deploy.sh
# https://stefanscherer.github.io/setup-ghost-for-github-pages/

initial() {

		echo ' -------------------- INFORMATION NEEDED -------------------- '
		echo ''
		echo "Following you'll be asked to enter a Github Username and Git Remote URL in which you would like to deploy Ghost."
		echo "Example:"
		echo "       https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git"
		echo ''
		read -p "Github username: "  gh_username
		read -p "Remote URL: "  remote_url
		echo ''
		echo "Leave blank if repo name is username.github.io"
		echo ''
		read -p "Repo name: " gh_repo

		mkdir static
		buster setup --gh-repo="$remote_url"
		buster generate --domain="$GHOST_URL"

		find static -name *.html -type f -exec sed -i '''s#http://localhost:2368#'$gh_username'.github.io/'$gh_repo'#g' {} \;
		
		cd static/
		git init
		git remote add origin "$remote_url"

		cd ..
		buster deploy
}

deploy_gh() {

		cd static
		rm -r *
		cd ..

		buster generate --domain="$GHOST_URL"
		
		echo ' -------------------- FIXING LINKS  -------------------- '
		echo ''
		read -p "Github username: "  gh_username
		echo "Leave blank if repo name is username.github.io"
		echo ''
		read -p "Repo name: " gh_repo

		find static -name *.html -type f -exec sed -i '''s#http://localhost:2373#'$gh_username'.github.io/'$gh_repo'#g' {} \;

		echo '[INFO] Deploying to your Github repository...'

		buster deploy
}
		
deploy_main() {

		repo_status="$(git status)"
		case "fatal" in 
  			*"$repo_status"*)
				echo '[INFO] Configuring git repository...'
				echo '[INFO] Generating static files from Ghost server...'
				initial
    			exit
    		;;
		esac
		deploy_gh
}
deploy_main