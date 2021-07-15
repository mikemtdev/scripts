#!/usr/bin/sh 



# -------------------------------------------


#--------------------------------------------

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


FOLDERNAME=$1
INSTALL=$2

mkdir $FOLDERNAME
sudo chown  -R --verbose $USER:$USER $FOLDERNAME || sudo chown  -R --verbose $USER:$USER ./*
sudo chmod  -R --verbose 777 $FOLDERNAME || sudo chown  -R --verbose 777 ./*
cd $FOLDERNAME || return
sudo yarn init -y

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
 




for PACKAGE in "${DEPS[@]}"
do
     yarn add "$PACKAGE" || sudo yarn add "$PACKAGE" 
    
done

if [ "$INSTALL" == "dev" ] 
then 
    for PACKAGE in "${DEVDEP[@]}"
    do
        echo "
        ---------------------------------------
            Installing DEV-DEP +
        ---------------------------------------
        "
        yarn add "$PACKAGE" --dev ||   sudo  yarn add "$PACKAGE" --dev
        
    done
fi



# if     [ -n "$(tail -c1 package.json )" ]    # if the file has not a trailing new line.
# then
#        truncate -s-1 package.json            # remove one char as the question request.
# else
#        truncate -s-2 package.json            # remove the last two characters
#        echo "" >> package.json               # add the trailing new line back
# fi
