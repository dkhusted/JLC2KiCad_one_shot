#!/bin/bash

JLCPCB_FOLDER="/home/$USER/KiCad/JLCPCB"
MNT_FOLDER="/usr/src/app/lib"

# Function to print usage
usage() {
    echo "Usage: $0 [-o] [args...]"
    echo "  -o    Run one-shot command"
    echo "  args  Arguments to pass to the one-shot command"
    exit 1
}

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    usage
fi

# Parse flag
if [ "$1" = "-o" ]; then
    one_shot=true
    shift  # Remove the flag from the arguments by shifting all args to the left by 1
else
    one_shot=false
fi

if [ "$one_shot" = true ]; then
    # Prepare arguments for one-shot command
    args=""
    for arg in "$@"; do
        args="$args $arg"
    done
    
    # Run one-shot command
    docker run --rm -v $JLCPCB_FOLDER:$MNT_FOLDER -w /usr/src/app jlc2kicad_image /bin/bash -c "JLC2KiCadLib $args --skip_existing -dir lib -symbol_lib symbols -footprint_lib footprints"
else
    # Run interactive terminal
    docker run -it -w /usr/src/app --rm -v $JLCPCB_FOLDER:/usr/src/app/lib jlc2kicad_image
fi