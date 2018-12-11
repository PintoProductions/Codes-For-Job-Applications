from math import *
import time

def priemwortels(p):
    pw = []
    num = range(1,p)
    for i in num: #candidaat primitieve wortel
        m = 1
        for j in range(1, p): #wordt de orde van candidaat i
            m *= i
            m %= p
            if m == 1: #orde wordt nu gecheckt
                if j < p-1: #als orde < p-1, dan geen primitieve wortel
                    break
                pw.append(i)
    return pw

def priemwortels2(p):
    pw = []
    num = range(1,p)
    for i in num: #candidaat primitieve wortel
        t = 0
        while t < p: #stopt pas als candidaat orde p-1 is gecheckt
            t += 1
            if (p-1) % t == 0: #candidaat orde is een deler van p-1
                m = i**t
                m %= p
                if m == 1: #orde wordt nu gecheckt
                    if t < p-1: #als orde < p-1, dan geen primitieve wortel
                        break
                    pw.append(i)
    return pw


p = [11, 31, 41, 71, 997, 9973]


tb = time.time()
for n in p:
    pw = priemwortels(n)
    print str(n)+' heeft '+str(len(pw))+' primitieve wortels:', pw
    print
te = time.time() - tb
print 'tijdsduur:', te
print
print
print

tb = time.time()
for n in p:
    pw = priemwortels2(n)
    print str(n)+' heeft '+str(len(pw))+' primitieve wortels:', pw
    print
te = time.time() - tb
print 'tijdsduur:', te
