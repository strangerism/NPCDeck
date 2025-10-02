$target = "D:\games\GAMMA\GAMMA RC3\mods\NPCDeck"
Copy-Item -Recurse -Force -Path ".\Main\gamedata" -Destination $target -Exclude .bak