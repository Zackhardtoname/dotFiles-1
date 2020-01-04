#!/usr/bin/env python

lower = int(input())
upper = int(input())
factor = lower

i = lower
counter = 1
out = "\\{" + str(i)

while i <= (upper - factor):
    i += factor
    if (counter % 10 == 0):
        out += ", \\\\" + str(i)
    else:
        out += ", " + str(i)

    counter += 1

print(out + "\\} \\\\\\\\")
