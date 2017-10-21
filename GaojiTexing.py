# print absolute value of an integer:
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#高级特性
#切片
L=[1,2,3,4,5]
L[0:3]
#L[0:3]表示，从索引0开始取，直到索引3为止，但不包括索引3。即索引0，1，2，正好是3个元素。如果第一个索引是0，还可以省略
L[:3]
L[-2:]      #记住倒数第一个元素的索引是-1
L[1:5:2]    #从索引1开始，取到索引5，但不包括，间隔为2
#切片的对象可以是List，Tuple，str等


#迭代
#如果给定一个list或tuple，我们可以通过for循环来遍历这个list或tuple，这种遍历我们称为迭代（Iteration）。在Python中，迭代是通过for ... in来完成的
#当我们使用for循环时，只要作用于一个可迭代对象，for循环就可以正常运行
d = {'a': 1, 'b': 2, 'c': 3}
for key in d:
    print(key)
#默认情况下，dict迭代的是key。如果要迭代value，可以用for value in d.values()，如果要同时迭代key和value，可以用for k, v in d.items()
#判断一个对象是可迭代对象呢？方法是通过collections模块的Iterable类型判断：
from collections import Iterable
isinstance('abc', Iterable) # str是否可迭代
isinstance([1,2,3], Iterable) # list是否可迭代
#如果要对list实现类似Java那样的下标循环怎么办？Python内置的enumerate函数可以把一个list变成索引-元素对，这样就可以在for循环中同时迭代索引和元素本身：
for i, value in enumerate(['A', 'B', 'C']):
    print(i, value)

#列表生成式
L1=[x*x for x in range(10)]         #方括号，内部含表达式
L2=[x*x for x in range(10) if x%2==0]
print(L1,L2)


#生成器Generator
#方法1：把列表生成式的[]改成圆括号()
g=(x*x for x in range(10))
print(g)
#g为生成器，输出元素需要用next()函数,或者因为g是个迭代，可以用for进行迭代
i=10
while i:
    print(next(g))
    i=i-1
print('hello')
g=(x*x for x in range(10))
for i in g:                 #正确使用方式，用for
    print(i)
def fib(max):
    n,a,b=0,0,1
    while n<max:
        print(b)
        a,b=b,a+b
        n=n+1
    return 'done'
fib(6)
#用生成器，定义generator的另一种方法,用关键词yield
#如果一个函数定义中包含yield关键字，那么这个函数就不再是一个普通函数，而是一个generator
def Fib(max):
    n,a,b=0,0,1
    while n<max:
        yield b                     
        a,b=b,a+b
        n=n+1
    return 'done'
f=Fib(6)
print(f)
for i in f:
    print(i)
#generator和函数的执行流程不一样。函数是顺序执行，遇到return语句或者最后一行函数语句就返回。
#而变成generator的函数，在每次调用next()的时候执行，遇到yield语句返回，再次执行时从上次返回的yield语句处继续执行
#用for循环调用generator时，发现拿不到generator的return语句的返回值。如果想要拿到返回值，必须捕获StopIteration错误，返回值包含在StopIteration的value中

def triangles(max=10):             #杨辉三角
    n=1
    L=[1]
    if max==1:
        yield L
    else:
        while n<=max:
            L.append(1)
            n=n+1
            if n>2:
                for i in range(len(L)-2):
                    L[-i-2]=L[-i-2]+L[-3-i]
        yield L
t=triangles(5)
for i in t:
    print(i)

def Triangles():
    N = [1]
    while True:
        yield N
        N.append(0)
        N = [N[i-1] + N[i] for i in range(len(N))]
n = 0
for t in Triangles():
    print(t)
    n = n + 1
    if n == 10:
        break

##迭代器
#可以直接用for循环迭代的数据类型有:一是集合数据类型，如列表，元组，字典等；二是generator，包括生成器和带yield的生成器函数
#直接用于for循环的对象称为可迭代对象：Iterable,用isinstance()判断
from collections import Iterable
print(isinstance([],Iterable),isinstance({},Iterable))
print(isinstance('abc',Iterable))
print(isinstance((x for x in range(10)),Iterable))
print(isinstance(100,Iterable))

#可以被next()函数调用并不断返回下一个值的对象称为迭代器：Iterator。
#可以使用isinstance()判断一个对象是否是Iterator对象：
from collections import Iterator
print(isinstance((x for x in range(10)), Iterator))
print(isinstance([], Iterator),isinstance('abc', Iterator))
#Python的Iterator对象表示的是一个数据流，Iterator对象可以被 next()函数调用并不断返回下一个数据，直到没有数据时抛出StopIteration错误。可以把这个数据流看做是一个有序序列，但我们却不能提前知道序列的长度，只能不断通过next()函数实现按需计算下一个数据，所以Iterator的计算是惰性的，只有在需要返回下一个数据时它才会计算。Iterator甚至可以表示一个无限大的数据流


