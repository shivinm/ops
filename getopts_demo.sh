#!/bin/bash
# Script to demonstrate getopts utility
# Does Task X or Task Y with a parameter (P1 or P2 or P3)

Help()
{
   # Display Help
   echo
   echo "Syntax: getopts_demo.sh [-x|y|h]"
   echo "Options:"
   echo
   echo "h: Displays this help menu"
   echo "x: Does Task X; Cannot be used with Task Y"
   echo "y: Does Task Y; Provide a parameter (P1, P2, P3); Cannot be used with Task X"
   echo
}

TASK_X="";
TASK_Y="";
TASK_Y_PARAM="";

while getopts "hxy:" option; do
   case $option in
       h)  # display Help
           Help
           exit;;
       x)
           TASK_X=TRUE
           ;;
       y)
           TASK_Y=TRUE
           TASK_Y_PARAM=$OPTARG
           if [ "$TASK_Y_PARAM" != "P1" ] && [ "$TASK_Y_PARAM" != "P2" ] && [ "$TASK_Y_PARAM" != "P3" ]; then
               echo "ERROR: Taskk Y param not specified correctly. See help menu (-h)"
               exit 1
           fi
           ;;
       \?)
           echo "Invalid option: -$OPTARG" >&2
           ;;

   esac
done

# Validate Inputs
if [ "$TASK_X" == "" ] && [ "$TASK_Y" == "" ]; then
    echo "ERROR: Task X (-x) or Y (-y) options not entered. See help menu (-h)"
    exit 1
fi

if [ "$TASK_X" != "" ] && [ "$TASK_Y" != "" ]; then
    echo "ERROR: Task X (-z) and Y (-y) options cannot be entered at the same time. See help menu (-h)"
    exit 1
fi


if [ "$TASK_X" == "TRUE" ]; then
    echo "Performing Task X"
else
    echo "Performing Task Y with param "$TASK_Y_PARAM
fi
