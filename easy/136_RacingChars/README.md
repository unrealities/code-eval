#RACING CHARS
##CHALLENGE DESCRIPTION:

In this challenge you will be given a file where each line is a section of a race track with obstructions, gates and checkpoints. The goal is to find a way of passing this track, using the following rules: 
Each section contains only a single gate or a gate with a checkpoint. 
The race car can ride only through gates or checkpoints. 
You should prefer driving through checkpoint rather then a gate. 
The obstructions are represented by "#" (hash). 
The gates are represented by "_" (underscore). 
The checkpoints are represented by "C" .

##INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Each line in this file is a new segment of a race track. E.g.

>#########_##

>########C_##

>#######_####

>######_#C###

>#######_C###

>#######_####

>######C#_###

>######C_####

>#######_####

>#######_####

##OUTPUT SAMPLE:

Print out the way of passing this race track starting from the first line of the file. Use a "|" (pipe) for the straight, use a "/" (forward slash) for the left turn and use a "\" (back slash) for the right turn. E.g.

>#########|##

>########/_##

>#######/####

>######_#\###

>#######_|###

>#######/####

>######/#_###

>######|_####

>#######\####

>#######|####

Constraints: 
The number of lines in a file is 50. 
The width of a section is 12 chars.

*Submit your solution in a file (some file name).(py2| c| cpp| java| rb| pl| php| tcl| clj| js| scala| cs| m| py3| hs| go| bash| lua) or use the online editor.*