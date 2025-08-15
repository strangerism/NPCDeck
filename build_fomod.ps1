

function CreateBuildFolders {
    
    New-Item -Path "build" -ItemType Directory | Out-Null

    New-Item -Path "build/NPCDeck" -ItemType Directory | Out-Null
    
}

function BuildMod {

    $target = "build/NPCDeck"
    Copy-Item -Recurse -Force -Path ".\Main\gamedata", ".\Module\gamedata" -Destination $target -Exclude .bak
}

CreateBuildFolders
BuildMod

$compress = @{
    Path = "build/NPCDeck/gamedata" 
    CompressionLevel = "Fastest"
    DestinationPath = "release/NPCDeck.zip"
}
Compress-Archive @compress -Force

Remove-Item -Force -Recurse -Path "./build"