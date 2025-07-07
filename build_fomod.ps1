

function CreateBuildFolders {
    
    New-Item -Path "build" -ItemType Directory | Out-Null

    New-Item -Path "build/TakePoint" -ItemType Directory | Out-Null
    
}

function BuildMod {

    $target = "build/TakePoint"
    Copy-Item -Recurse -Force -Path ".\Main" -Destination $target -Exclude .bak
}

CreateBuildFolders
BuildMod

$compress = @{
    Path = "build/TakePoint" 
    CompressionLevel = "Fastest"
    DestinationPath = "release/TakePoint.zip"
}
Compress-Archive @compress -Force

Remove-Item -Force -Recurse -Path "./build"