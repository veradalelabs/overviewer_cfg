#!/bin/bash

#Disable Saving and Save the world

#Zachulacraft Server
docker exec zachulacraft rcon-cli save-off
docker exec zachulacraft rcon-cli save-all


#Spigot (BiomeBundle) Server
docker exec zachulaspigot rcon-cli save-off
docker exec zachulaspigot rcon-cli save-all


#ZachulacraftCurrent Server
docker exec zachulacraftcurrent rcon-cli save-off
docker exec zachulacraftcurrent rcon-cli save-all


if [ -z "$(pgrep overviewer.py)" ]
  then
        ~/veradalelabs/Projects/overviewer_source/Minecraft-Overviewer/overviewer.py --config=/home/prozach/overviewer/overviewer.cfg --genpoi
        ~/veradalelabs/Projects/overviewer_source/Minecraft-Overviewer/overviewer.py --config=/home/prozach/overviewer/overviewer.cfg
  else
     echo "Previous execution of Overviewer is still running, exiting"
fi

#re-enable world Saving
docker exec zachulacraft rcon-cli save-on
docker exec zachulaspigot rcon-cli save-on
docker exec zachulacraftcurrent rcon-cli save-on