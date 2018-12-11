from math import *
import numpy as np
import matplotlib.pyplot as plt

def p(x, m):
    if 0 <= x <= 1 or 2 <= x <= 3:
        return 1
    elif 1 < x < 2:
        return m

def spacematrix(dx, m):
    N = 3*int(1./dx)-1
    A = np.zeros((N,N))
    if N > 1:
        A[0,0]   = -p(dx*1/2., m)-p(dx*3/2., m)
        A[0,1]   = p(dx*3/2., m)
        A[N-1,N-2] = p(dx*(N-1/2.), m)
        A[N-1,N-1]   = -p(dx*(N-1/2.), m)-p(dx*(N+1/2.), m)
        for i in range(1,N-1):
            A[i,i-1] = p(dx*(i+1/2.), m)
            A[i,i]   = -p(dx*(i+1/2.), m)-p(dx*(i+3/2.), m)
            A[i,i+1] = p(dx*(i+3/2.), m)
    A *= 1./(dx**2)
    w0 = np.zeros(N)
    return A, w0

def heat(dx, dt, m, theta, tend):
    A, w = spacematrix(dx, m)
    I = np.identity(3*int(1./dx)-1)
    B = np.linalg.inv(I - dt * theta * A)
    t = 0.
    r = np.zeros(3*int(1./dx)-1)
    r[0] = p(dx*1/2., m)/(dx**2)
    x = dx*np.arange(0,3./dx+1)
    i = 0
    alpha1 = []
    alpha2 = []
    while t + dt <= tend + dt/2.:
        u = (w + dt*((1 - theta) * (np.dot(A,w)+r) + theta * r))
        w = np.dot(B,u)
        t += dt
        i += 1
        if i % 5 == 0:
            y = np.append(np.append(v1,w),v2)
            ytemp = 20*y+5
            plt.plot(x,ytemp,label = 't = '+str(t))
            a1 = (y[1] - y[0])/dx
            a2 = (-3*y[0] + 4*y[1] - y[2])/(2*dx)
            alpha1.append(a1)
            alpha2.append(a2)
    return w, alpha1, alpha2


dx = 0.1
dt = 0.02
tend = 0.5
theta = 3./4
m1 = 0.5
m2 = 20.


A, w = spacematrix(dx, m1)
v1 = np.array([1])
v2 = np.array([0])
x = dx*np.arange(0,3./dx+1)
y = np.append(np.append(v1,w),v2)
ytemp = 20*y+5
plt.plot(x,ytemp)
plt.show()

w, alpha1, alpha2 = heat(dx, dt, m1, theta, tend)
##v1 = np.array([1])
##v2 = np.array([0])
##y = np.append(np.append(v1,w),v2)
##x = dx*np.arange(0,3./dx+1)
##plt.plot(x,y)
plt.legend(loc = 'upper left')
plt.title('Glaswol')
plt.show()

print
print 'Glaswol  ||     alpha1      ||      alpha2        '
print 'dt = 0.1 ||', alpha1[0], ' ||', alpha2[0]
print 'dt = 0.2 ||', alpha1[1], ' ||', alpha2[1]
print 'dt = 0.3 ||', alpha1[2], ' ||', alpha2[2]
print 'dt = 0.4 ||', alpha1[3], '||', alpha2[3]
print 'dt = 0.5 ||', alpha1[4], '||', alpha2[4]

w, alpha1, alpha2 = heat(dx, dt, m2, theta, tend)
plt.legend(loc = 'upper left')
plt.title('Lucht')
plt.show()

print
print 'Lucht    ||     alpha1      ||      alpha2        '
print 'dt = 0.1 ||', alpha1[0], ' ||', alpha2[0]
print 'dt = 0.2 ||', alpha1[1], ' ||', alpha2[1]
print 'dt = 0.3 ||', alpha1[2], ' ||', alpha2[2]
print 'dt = 0.4 ||', alpha1[3], '||', alpha2[3]
print 'dt = 0.5 ||', alpha1[-1], '||', alpha2[-1]
