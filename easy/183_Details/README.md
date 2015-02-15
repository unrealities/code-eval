# 183 - DETAILS
## CHALLENGE DESCRIPTION:

There are two details on a M*N checkered field. The detail X covers several (at least one) first cells in each line. The detail Y covers several (at least one) last cells. Each cell is either fully covered with a detail or not.

For example:

The detail Y starts moving left (without any turn) until it bumps into the X detail at least with one cell. Determine by how many cells the detail Y will be moved.

## INPUT SAMPLE:

The first argument is a file with different test cases. Each test case contains a matrix the lines of which are separated by comma. (Empty cells are marked as ".")

For example:

> XX.YY,XXX.Y,X..YY,XX..Y

> XX...YY,X....YY,XX..YYY,X..YYYY

> XXYY,X..Y,XX.Y

## OUTPUT SAMPLE:

Print out the number of cells the detail Y will be moved.

For example:

> 1

> 2

> 0

## CONSTRAINTS:

- The matrices can be of different M*N sizes. (2 <= M <= 10, 2 <= N <= 10)
- Number of test cases is 40.