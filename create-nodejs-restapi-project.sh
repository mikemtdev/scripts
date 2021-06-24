#!/usr/bin/sh 



FOLDERNAME=$1
INSTALL=$2


MVCFILESTRUCTURE=('Route' 'Controller' 'Model')
FILES=('readme.md' 'index.js' 'home-route.js' 'home-controller.js' 'model.js')
DEPS=(
    'body-parser'
    'config'
    'debug'
    'express'
    'mongoose')
DEVDEP=('@innocells/branch-naming-check'
    'dotenv'
    'eslint'
    'husky'
    'jest'
    'morgan')


mkdir $FOLDERNAME
cd $FOLDERNAME || return

# Make Files
for FILE in "${FILES[@]}"
do
   touch "$FILE"
done

# Make Folders
for FOLDER in "${MVCFILESTRUCTURE[@]}"
do
    mkdir "$FOLDER"
done
mv home-route.js Route/
mv home-controller.js Controller/
mv model.js Model/
echo " # RestApi Templete" > readme.md
yarn init -y 




# for PACKAGE in "${DEPS[@]}"
# do
#     sudo yarn add "$PACKAGE" 
    
# done

# if [ "$INSTALL" == "dev" ] 
# then 
# for PACKAGE in "${DEVDEP[@]}"
# do
#     sudo yarn add "$PACKAGE" --dev
    
# done
# fi
if     [ -n "$(tail -c1 package.json )" ]    # if the file has not a trailing new line.
then
       truncate -s-1 package.json            # remove one char as the question request.
else
       truncate -s-2 package.json            # remove the last two characters
       echo "" >> package.json               # add the trailing new line back
fi

# cat ../husky.txt >> package.json 



