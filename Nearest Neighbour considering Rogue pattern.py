import math
import numpy as np
import matplotlib.pyplot, pylab
fp=[[2,4],[4,4],[2,5],[3,5],[5,5], [2,7], [4,6]] #input pattern of class football player
wp=[[14,4],[18,4],[14,5],[15,5],[17,5], [14,7], [15,6]] #input pattern of class WWE player
for i in range(3): #classifying 3 input patterns
    l=len(fp) #length of football player data
    ll=len(wp) # length of WWE player data
    input_string = input("Enter a list element separated by space: ")#input new unknown pattern
    nw = input_string. split()
    nw=[nw] #enlist the data
    summ=int(0)
    summm=int(0)
    mini1=int(50) # select initial minimum distance
    ## calculate average distance from class of football player
    for i in range(l):
        x1=(int(fp[i][0])-int(nw[0][0]))**2
        y1=(int(fp[i][1])-int(nw[0][1]))**2
        su=x1+y1
        su=math.sqrt(su)
        summ=summ+su
    avg1=summ/l
    mini2=int(50) # select initial minimum distance
## calculate average distance from class of WWE player
    for i in range(ll):
        x1=(int(wp[i][0])-int(nw[0][0]))**2
        y1=(int(wp[i][1])-int(nw[0][1]))**2
        su=x1+y1
        su=math.sqrt(su)
        summm=summm+su
    avg2=summm/ll
    print('avegare distance from dataset 1=',avg1)
    print('average distance from dataset 2=',avg2)
##select minimum average distance for which input pattern will be classified
    if (avg1>=avg2):
        wp.extend(nw)
        print("New data is under class 2")
    else:
        fp.extend(nw)
        print("New data is under class 1")
    data=fp+wp # add total class data
    matplotlib.pyplot.scatter(*zip(*data),marker='x') 
    matplotlib.pyplot.show() #show the plotted pattern
    print('Updated dataset of class 1 Football Player=',fp)
    print('Updated dataset of class 2 WWE player=',wp)
