# JLC2KiCad_one_shot

## Description
This is a simple bash script for importing JLCPCB components using the [JLC2KiCad](https://github.com/TousstNicolas/JLC2KiCad_lib) library. 
It features 2 modes:
-One Shot: This allows passing multiple JLCPCB part numbers to the script, after which it will create the symbol, footprint and 3D model, in a default folder. This can be changed in the script depending on needs.
-No argument: This starts up a docker image containing the JLC2KiCad, in which the program can be called and passed JLCPCB part numbers as normal
Both of these require the docker image containing the JLC2KiCad program.

## Usage
For getting the docker image, follow the [instructions](https://github.com/carlsa/JLC2KiCad_docker/blob/main/README.md) made by carlsa.
Afterwards download the script, and change the folders in it as accordingly.
Enjoy!
