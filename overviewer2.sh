#!/bin/bash
#OVERVIEWER MAP GENERATION SCRIPT
#Author - Zach Drew 2019
#Usage ./overviewer.sh worldname worldpath dockercontainername rconport mapdir
#Example ./overviewer.sh Bees /home/prozach/minecraft/world zachulacraft 25575 /home/prozach/mcmaps

#Overviewer Vars

#WORLD NAME
WORLD_NAME=$1
export WORLD_NAME

#PATH TO WORLD TO BE MAPPED
WORLD_PATH=$2
export WORLD_PATH

#Docker Container Name
CONTAINER_NAME=$3

#RCON PORT DOCKER IS LISTENING ON
RCON_PORT=$4
export RCON_PORT

#OUTPUT DIRECTORY FOR MAP
MAP_DIR=$5
export MAP_DIR

#Disable Saving and Save the world
docker exec $CONTAINER_NAME rcon-cli save-off
docker exec $CONTAINER_NAME rcon-cli save-all

if ps -aux | grep "[o]verviewer.py" >/dev/null
    then
        echo "Previous execution of Overviewer is still running, exiting"
    else
        ~/veradalelabs/Projects/overviewer_source/Minecraft-Overviewer/overviewer.py --config=/home/prozach/veradalelabs/Projects/overviewer_cfg/overviewer_dyn.cfg --genpoi
        ~/veradalelabs/Projects/overviewer_source/Minecraft-Overviewer/overviewer.py --config=/home/prozach/veradalelabs/Projects/overviewer_cfg/overviewer_dyn.cfg
fi

#re-enable world Saving
docker exec $CONTAINER_NAME rcon-cli save-on
