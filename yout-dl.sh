#!/usr/bin/env bash

# Sturacture

# script [ COMMAND ] [ URL ] [opitional NAME ]


$1
$2

COMMAND=$1
LINK=$2
DIR=$3
# LINK="https://www.youtube.com/watch?v=hrAoU2O8sfE&list=OLAK5uy_lng-TQQ64VxKYb381FjW-gmJ6lYjwnnk4"

function downloadWithLogsAndNoOverwrite() {
  #statements
  #Download With Logs
  #No Overwrite files in directory
  #Get best Quality --audio-quality 0
  playlistlink=$1
  echo "+++++++ Downnloading with logs  $playlistlink +++++++++"
   youtube-dl --download-archive downloaded.txt --no-overwrites --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 $playlistlink
}
#
# if [ "$COMMAND" == "playlist" ]; then
#   if [[ $DIR ]];then
#     cd $HOME/Downloads/Music
#     mkdir $DIR
#
#     cd $DIR
#
#     if [[ $LINK ]]; then # checks if the link is given
#       downloadWithLogsAndNoOverwrite $LINK
#
#     else
#       echo "Give link ====="
#     fi
#
#   else
#     if [[ $LINK ]]; then # checks if the link is given
#       downloadWithLogsAndNoOverwrite $LINK
#     else
#       echo "Give link ====="
#     fi
#   fi
# else
#   echo "$COMMAND: Not regonised"
#
# fi
echo

if [ "$COMMAND" == "playlist" ]; then
  if [[ $DIR ]];then
    cd $HOME/Downloads/Music
    mkdir $DIR
    cd $DIR
    if [[ $LINK ]]; then # checks if the link is given
      downloadWithLogsAndNoOverwrite $LINK

    else
      echo "Give link ====="
    fi
  else
    cd $HOME/Downloads/Music
NOW=`date '+%F_%H:%M:'`;
defaultFileName="playlist_$NOW"
echo "+++++++++++++++++++
      Making folder $defaultFileName
      +++++++++++++++++++
"
    mkdir $defaultFileName

    cd $defaultFileName

    if [[ $LINK ]]; then # checks if the link is given
      downloadWithLogsAndNoOverwrite $LINK
    fi
  fi
else
  echo "$COMMAND: Not regonised"

fi
