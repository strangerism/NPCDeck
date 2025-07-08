

function CreateBuildFolders {
    
    New-Item -Path "build" -ItemType Directory | Out-Null

    New-Item -Path "build/Spotter" -ItemType Directory | Out-Null
    
}

function BuildMod {

    $target = "build/Spotter"
    Copy-Item -Recurse -Force -Path ".\Main\gamedata" -Destination $target -Exclude .bak
}

CreateBuildFolders
BuildMod

$compress = @{
    Path = "build/Spotter/gamedata" 
    CompressionLevel = "Fastest"
    DestinationPath = "release/Spotter.zip"
}
Compress-Archive @compress -Force

Remove-Item -Force -Recurse -Path "./build"