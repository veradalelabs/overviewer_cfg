## Config files for Minecraft Overviewer (https://github.com/overviewer/Minecraft-Overviewer)

**I run my minecraft servers using docker (https://hub.docker.com/r/itzg/minecraft-server/)**
**This setup assumes things are running in a docker container on a linux host.**

There are two components, the automation script and the overviewer config.

The script is set up with cron in mind as it will check to see if overviewer is still running.

The script, overviewer2.sh, takes 5 command line arguments;
  * worldname: The name for your world, pick something unique to identify this map
  * worldpath: The path to the world to be mapped
  * dockercontainername: The name of the dockercontainer
  * rconport for container: The config will report render progress to players on the server and manage saving while rendering
  * mapdir: The output directory you would like your map written to

_Usage example: ./overviewer2.sh testing /home/minecraft/world minecraft 25575 /home/minecraft/mcmaps/map_

### **This config will generate the following maps:**

**4 versions of the overworld with each north direction represented, North Upper Right, North Lower Right, North Lower Left, and North Upper Left**

**Night, Cave, Nether, and End, however these will have the default North Upper Left orientation.**

### The following overlays will be generated and presented on the North Upper Left daytime overworld map:
   * Biomes
   * Minerals
   * Slime Blocks
   
### The following overlays will be generated and presented on the Cave map:
  * Overworld Minerals
  * Overworld Slime Blocks
  * Cave Minerals
  * Cave Slime Blocks
  * Depth Overlay
  * Lit Cave Overlay
  
### The following POIs will be generated and displayed on all overworld map renders:
  * Players
  * Spawn
  * Player Spawns
  * Chests
  * Signs
  
An example can be found here: http://minecraft.zachula.com/test/


