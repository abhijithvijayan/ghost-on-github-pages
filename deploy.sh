#!/bin/bash
cd static
sudo rm -r *
cd ..
sudo buster generate --domain=http://localhost:2368
sudo cp CNAME static/
sudo cp README.md static/
sudo cp deploy.sh static/
sudo cp manifest.json static/
sudo cp -r images static/
sudo cp serviceworker-v1.js static/
cd static/assets/
sudo mkdir dist
cd ..
cd ..
sudo cp sw-toolbox.js static/assets/dist/
sudo find static -name *.html -type f -exec sed -i '''s#http://localhost:2368#https://blog.abhijithvijayan.me#g' {} \;
sudo find static -name *.html -type f -exec sed -i '''s#<!-- To be replaced for manifest.json -->#<link rel="manifest" href="../../../../manifest.json" />#g' {} \;
sudo buster deploy

