def euler1(n):
    a3 = []
    a5 = []
    for i in range(1,n):
        if i % 3 == 0:
            a3.append(i)
        if i % 5 == 0:
            a5.append(i)
    a = set(a3) | set (a5)
    a = list(a)
    res = 0
    for i in a:
        res += i
    return res
            
def euler2(n):
    a = 1
    b = 2
    lst = []
    while a<=n:
        if a % 2 == 0:
            lst.append(a)
        a, b = b, a + b
    res = 0
    for i in lst:
        res += i
    return res

##def euler3(n):
##    blacklist = []
##    whitelist = [n]
##    for i in range(2,n/2):
##        if n % i == 0:
##            for j in range(2,i):
##                if i % j == 0:
##                    blacklist.append(i)
##            whitelist.append(i)
##    return max(list(set(whitelist)-set(blacklist)))

def euler3(n):
    lst = 0
    def IsPrime(m):
        res = (m>1)
        for i in range(2,m):
            res = (m%i!=0)
            if not res:
                return res
        return res
    for i in range(n):
        if n%i == 0 and IsPrime(i):
            lst = i
    return lst

def euler4(n):
    ad = 10**(n-1)
    bd = 10**n
    lst = []
    for i in range(ad,bd):
        for j in range(ad,bd):
            a = i*j
            b = list(str(a))
            c = list(str(a))
            c.reverse()
            if b == c:
                lst.append(a)
    return max(lst)

def euler5(n):
    i = 0
    lst1 = []
    for l in range(1,n+1):
        lst1.append(l)
    while True:
        lst2 = []
        i += 1
        for k in range(1,n+1):
            if i % k == 0:
                lst2.append(k)
        if lst1 == lst2:
            return i
