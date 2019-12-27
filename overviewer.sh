#!/bin/bash
#OVERVIEWER MAP GENERATION SCRIPT
#Author - Zach Drew 2019
#Usage ./overviewer.sh oepration_mode worldname worldpath dockercontainername rconport mapdir
#Example ./overviewer.sh online|offline myworld /home/minecraft/world minecraftserver 25575 /home/webhost/mcmaps

#minecraft overviewer location
MCOV_EXE="/home/prozach/veradalelabs/Projects/overviewer_source/Minecraft-Overviewer"


#OPERATION MODE
OPMODE=$1

if ps -aux | grep "[o]verviewer.py" >/dev/null
    then
        echo "Previous execution of Overviewer is still running, exiting"
    else
        case $OPMODE in
            online*)
                if [ "$#" -ne 6 ]
                    then 
                        echo "Invalid argument count.  Please supply correct commandline arguments for proper operation"
                    else
                        #Overviewer Vars
                        #WORLD NAME
                        WORLD_NAME=$2
                        export WORLD_NAME
                        #PATH TO WORLD TO BE MAPPED
                        WORLD_PATH=$3
                        export WORLD_PATH
                        #Docker Container Name
                        CONTAINER_NAME=$4
                        #RCON PORT DOCKER IS LISTENING ON
                        RCON_PORT=$5
                        export RCON_PORT
                        #OUTPUT DIRECTORY FOR MAP
                        MAP_DIR=$6
                        export MAP_DIR
                        CONFIG="/home/prozach/veradalelabs/Projects/overviewer_cfg/overviewer_dyn_online.cfg"
                        #Disable Saving and Save the world
                        docker exec $CONTAINER_NAME rcon-cli save-off
                        docker exec $CONTAINER_NAME rcon-cli save-all           
                        $MCOV_EXE/overviewer.py --config=$CONFIG --genpoi
                        $MCOV_EXE/overviewer.py --config=$CONFIG
                        #re-enable world Saving
                        docker exec $CONTAINER_NAME rcon-cli save-on
                fi
                ;;
            offline*)
                if [ "$#" -ne 4 ]
                    then 
                        echo "Invalid argument count.  Please supply correct commandline arguments for proper operation"
                    else
                        #Overviewer Vars
                        #WORLD NAME
                        WORLD_NAME=$2
                        export WORLD_NAME
                        #PATH TO WORLD TO BE MAPPED
                        WORLD_PATH=$3
                        export WORLD_PATH
                        #OUTPUT DIRECTORY FOR MAP
                        MAP_DIR=$4
                        export MAP_DIR
                        CONFIG="/home/prozach/veradalelabs/Projects/overviewer_cfg/overviewer_dyn_offline.cfg"
                        $MCOV_EXE/overviewer.py --config=$CONFIG --genpoi
                        $MCOV_EXE/overviewer.py --config=$CONFIG
                fi
                ;;
            *)
                echo "No Mode defined.  Acceptable values are offline or online."
                ;;
        esac
fi

