# Raylib-Windows-Template
A template to create games with raylib on Windows, making it a one click install that can be repeated over and over again.

THIS IS STILL A WORK IN PROGRESS

# Programs required
Windows powerShell

Git

Mingw32 

# Install
Install Git if needed (https://gitforwindows.org/)

Clone this repository

Install Mingw32 if needed via Chocolatey (https://chocolatey.org/install), then run the command `chocolatey install mingw32` in a powershell terminal
Chocolatey will add Mingw32 to system path 

# Run
Open a powershell terminal in the cloned repo and execute `.\CreateGame.ps1 mygamename`

Then run `gcc main.c -o main.exe -O1 -Wall -std=c99 -Wno-miising-braces -I includes/ -L libs/ -lraylib -opengl32 -lgdi32 -lwinmm` to compile the game into a .exe file you can run

# How it works
Creates a directory for your game, you can specify the name by running the script like this `.\CreateGame.ps1 mygamename` in a terminal
if there is no name given then it will use its default name `MyNewGame` for the directory.

If the directory already exists you will get a prompt asking to delete it.

Creates a `includes` directory the in root directory of the game

Creates a `libs` directory in the root directory of the game

Clones raylib master branch into root directory 

Compiles it for `PLATFORM=PLATFORM_DESKTOP` with `mingw32-make` using the `Makefile` in `raylib/src`

Copies the compiled raylib library `libraylib.a` into `libs` directory and `raylib.h` into `includes` directory

Deletes raylib repo

FIN. 
