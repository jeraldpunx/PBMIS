#!/bin/bash

# git clone all repo
# git@gitlab.com:1722-iXBASE/pbmis.latest-erp-web-app.git.
# "latest-erp-web-app" 
array=( "system" "latest-erp-web-app" "mobile" "production" "transaction" "accounting" "company" "messenger" "broker" "inventory")
for i in "${array[@]}"
do
	# echo $i
	#git clone git@gitlab.com:1722-iXBASE/pbmis."$i".git
	cd pbmis."$i"
	pwd
	git checkout develop
	git pull
	npm install
	cd ..
	npm rebuild
done