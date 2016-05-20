from __future__ import division
import numpy as np
import matplotlib.pyplot as plt
import sys

def moving_average(a, n=5):
    ret = np.cumsum(a, dtype=float)
    ret[n:] = ret[n:] - ret[:-n]
    return ret[n - 1:] / n

with open(sys.argv[1], "r+") as f:
    lines = []
    for line in f:
        lines.append(float(line))



#print running_mean(lines, len(lines))
plt.plot(moving_average(lines));
plt.show()
