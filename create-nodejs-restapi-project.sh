#!/usr/bin/sh 

MVCFILESTRUCTURE=('Route' 'Controller' 'Model')
FILES=('readme.md' 'index.js' 'home-route.js' 'home-controller.js' 'model.js')

FOLDERNAME=$1
INSTALL=$2

mkdir $FOLDERNAME
cd $FOLDERNAME || return

# Make Files
for FILE in "${FILES[@]}"
do
   touch $FILE
done

# Make Folders
for FOLDER in "${MVCFILESTRUCTURE[@]}"
do
    mkdir $FOLDER
done
mv home-route.js Route/
mv home-controller.js Controller/
mv model.js Model/
echo " # RestApi Templete" > readme.md

if [ "$INSTALL" == "dev" ] 
then 
    yarn add express
fi


