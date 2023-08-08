$RaylibRepo = "https://github.com/raysan5/raylib"

$CurrentDirectory = Get-Item .

$GameName=$args[0]

# Set game name 
if(!$GameName)
{
    $GameName = "MyNewGame"
}

$GamePath = "$($CurrentDirectory)/$($GameName)"
## Delete if exists
if(Test-Path -Path $GamePath)
{
    ## this can be done beter
    $delete = Read-Host "$($GameName) Already exists, are you sure you want to override it? `n y / n"
    if($delete.ToLower() -eq 'y')
    {
        Remove-Item $GamePath -Force -Recurse
    }
    else {
        ## Lets not delete it okay?
        exit;
    }
}

$LibFolder = "$($GamePath)/libs"
$IncludeFolder = "$($GamePath)/includes"

## Create project folders
New-Item -Path $GamePath -ItemType "directory"
New-Item -Path $LibFolder -ItemType "directory"
New-Item -Path $IncludeFolder -ItemType "directory"

cd $GamePath

## clone ray lib
git clone $RaylibRepo

## compile raylib
cd raylib/src
mingw32-make PLATFORM=PLATFORM_DESKTOP

# Copy static raylib lib
Copy-Item .\libraylib.a "$($LibFolder)/libraylib.a"

## Copy raylib header
Copy-Item .\raylib.h "$($IncludeFolder)/raylib.h"

cd $GamePath

## Add main to run
Copy-Item "$($CurrentDirectory)/main.c" main.c

## Copy compile script
Copy-Item "$($CurrentDirectory)/CompileGame.ps1" "$($GamePath)/CompileGame.ps1"

cd $GamePath

## Delete raylib folder
if(Test-Path -Path raylib)
{
    Remove-Item raylib -Force -Recurse
}

## Compile
.\CompileGame.ps1


