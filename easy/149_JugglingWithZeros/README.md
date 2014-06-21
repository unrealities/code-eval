# JUGGLING WITH ZEROS
## CHALLENGE DESCRIPTION:

In this challenge you will be dealing with zero based numbers. A zero based number is set in the following form: "flag" "sequence of zeroes" "flag" "sequence of zeroes" etc. Separated by a single space.

``
00 0 0 00 00 0
``

Your goal is to convert these numbers to integers. In order to do that you need to perform the following steps:

1.Convert a zero based number into a binary form using the following rules: a) flag "0" means that the following sequence of zeros should be appended to a binary string. b) flag "00" means that the following sequence of zeroes should be transformed into a sequence of ones and appended to a binary string.

``
00 0 0 00 00 0 --> 1001
``

2.Convert the obtained binary string into an integer.

``
1001 --> 9
``

## INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Each line of input contains a string with zero based number. E.g.

> 00 0 0 00 00 0

> 00 0

> 00 0 0 000 00 0000000 0 000

> 0 000000000 00 00

## OUTPUT SAMPLE:

For each line from input, print an integer representation of a zero based number. E.g.

> 9

> 1

> 9208

> 3

*Submit your solution in a file (some file name).(py2| c| cpp| java| rb| pl| php| tcl| clj| js| scala| cs| m| py3| hs| go| bash| lua) or use the online editor.*