# print absolute value of an integer:
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#函数式编程 允许把函数本身作为参数传入另一个函数，还允许返回一个函数
#变量可以指向函数
print(abs(-10))
print(abs)          #abs是函数本身，abs(-10)是函数调用
x=abs(10)           #要获得函数调用的结果，可以把结果赋值给变量
f=abs
#函数本省也可以赋值给变量，即：变量可以指向函数，并且可通过该变量来调用函数
print(x,f,f(-10))
#函数名也是变量
#变量可以指向函数，函数的参数也能接收变量，那么一个函数就可以接收另一个函数作为参数，这种函数称之为高阶函数
def add(x,y,f):
    return f(x)+f(y)
x=add(5,-6,abs)
print(x)
#编写高阶函数，就是让函数的参数能够接收别的函数,内置常用的有map/reduce,filter,sorted

##map/Reduce
###map()函数接收两个参数，一个是函数，一个是Iterable，map将传入的函数依次作用到序列的每个元素，并把结果作为新的Iterator返回
def f(x):
    return x*x
r=map(f,[1,2,3,4])      
#map()传入的第一个参数是f，即函数对象本身。由于结果r是一个Iterator，Iterator是惰性序列，因此通过list()函数让它把整个序列都计算出来并返回一个list
l=list(r)
print(l)
#reduce接收两个参数，第一个是函数，第二个为序列。其作用是把一个函数作用在一个序列[x1, x2, x3, ...]上，这个函数必须接收两个参数，reduce把结果继续和序列的下一个元素做累积计算，其效果就是：reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)
from functools import reduce
def add(x,y):
    return x+y
r=reduce(add,[1,3,5,7,9])
print(r)
def fn(x,y):
    return x*10+y
r=reduce(fn,[1,3,5,7,9])
print(r)
def char2num(s):
    return {'0':0,'1':1,'2':2,"3":3,'4':4}[s]
r=reduce(fn,map(char2num,'1234'))
print(r)
def normalize(name):
    name=name.capitalize()
    return name
L1 = ['adam', 'LISA', 'barT']
L2 = list(map(normalize, L1))
print(L2)
def prod(L):
    def Cf(x,y):
        return x*y
    return reduce(Cf,L)
print('3 * 5 * 7 * 9 =', prod([3, 5, 7, 9]))
def Prod(L):
    return reduce(lambda x,y:x*y,L)
print('3 * 5 * 7 * 9 =', Prod([3, 5, 7, 9]))
#Python内建的filter()函数用于过滤序列。
#和map()类似，filter()也接收一个函数和一个序列。和map()不同的是，filter()把传入的函数依次作用于每个元素，然后根据返回值是True还是False决定保留还是丢弃该元素。
def is_odd(n):
    return n%2==1
l=list(filter(is_odd,[1,2,3,4,5,6,9,10]))
print(l)

def not_empty(s):
    return s and s.strip()
l=list(filter(not_empty, ['A', '', 'B', None, 'C', '  ']))
print(l)
#filter()这个高阶函数，关键在于正确实现一个“筛选”函数。
#注意到filter()函数返回的是一个Iterator，也就是一个惰性序列，所以要强迫filter()完成计算结果，需要用list()函数获得所有结果并返回list

#筛选素数
def _odd_iter():
    n = 1
    while True:
        n = n + 2
        yield n
def _not_divisible(n):
    return lambda x: x % n > 0
def primes():
    yield 2
    it = _odd_iter() # 初始序列
    while True:
        n = next(it) # 返回序列的第一个数
        yield n
        it = filter(_not_divisible(n), it) # 构造新序列
# 打印1000以内的素数:
for n in primes():
    if n < 100:
        print(n)
    else:
        break

#sorted 排序算法
#sorted()函数也是一个高阶函数，它还可以接收一个key函数来实现自定义的排序，key指定的函数将作用于list的每一个元素上，并根据key函数返回的结果进行排序
print(sorted([36, 5, -12, 9, -21]))
print(sorted([36, 5, -12, 9, -21],key=abs))
print(sorted(['bob', 'about', 'Zoo', 'Credit']))
print(sorted(['bob', 'about', 'Zoo', 'Credit'],key=str.lower))
#要进行反向排序，不必改动key函数，可以传入第三个参数reverse=True
print(sorted(['bob', 'about', 'Zoo', 'Credit'],key=str.lower,reverse=True))


#返回函数
#函数作为返回值，高阶函数除了可以接受函数作为参数外，还可以把函数作为结果值返回
#如果不需要立刻求和，而是在后面的代码中，根据需要再计算怎么办？可以不返回求和的结果，而是返回求和的函数:
def lazy_sum(*args):
    def sum():
        ax = 0
        for n in args:
            ax = ax + n
        return ax
    return sum
#当我们调用lazy_sum()时，返回的并不是求和结果，而是求和函数
f=lazy_sum(1,3,5,7,9)
print(f)
print(f())          #调用函数f时，才真正计算求和的结果
#在函数lazy_sum中又定义了函数sum，并且，内部函数sum可以引用外部函数lazy_sum的参数和局部变量，当lazy_sum返回函数sum时，相关参数和变量都保存在返回的函数中，这种称为“闭包（Closure）”的程序结构拥有极大的威力。
#注意，当我们调用lazy_sum()时，每次调用都会返回一个新的函数，即使传入相同的参数
##闭包
#返回的函数在其定义内部引用了局部变量args，所以，当一个函数返回了一个函数后，其内部的局部变量还被新函数引用
def count():
    fs = []
    for i in range(1, 4):
        def f():
             return i*i
        fs.append(f)
    return fs
f1, f2, f3 = count()
print(f1,f2,f3)
#返回函数不要引用任何循环变量，或者后续会发生变化的变量。
#如果一定要引用循环变量怎么办？方法是再创建一个函数，用该函数的参数绑定循环变量当前的值，无论该循环变量后续如何更改，已绑定到函数参数的值不变
def count():
    def f(j):
        def g():
            return j*j
        return g
    fs = []
    for i in range(1, 4):
        fs.append(f(i)) # f(i)立刻被执行，因此i的当前值被传入f()
    return fs

#匿名函数——在传入函数时，有些时候，不需要显式地定义函数，直接传入匿名函数更方便
#关键字lambda，冒号前面的表示函数参数
#匿名函数有个限制，就是只能有一个表达式，不用写return，返回值就是该表达式的结果。
#用匿名函数有个好处，因为函数没有名字，不必担心函数名冲突。
#匿名函数也是一个函数对象，也可以把匿名函数赋值给一个变量，再利用变量来调用该函数;也可以把匿名函数作为返回值返回
#匿名函数是个函数对象，要想调用，后面加上括号并传入参数
l=list(map(lambda x:x*x,[1,2,3,4,5]))
print(l)
f=lambda x:x*x
print(f)
print(f(5))

def build(x,y):
    return lambda x,y:x*x+y*y #返回函数对象
print(build(3,4)) 
def build(x,y):
    return (lambda x,y:x*x+y*y)(x,y) #返回函数调用值
print(build(3,4)) 

#装饰器:动态增加函数的功能，接收一个函数，并返回一个函数
#函数也是一个对象，而且函数对象可以被赋值给变量，所以，通过变量也能调用该函数
##假设我们要增强now()函数的功能，比如，在函数调用前后自动打印日志，但又不希望修改now()函数的定义，这种在代码运行期间动态增加功能的方式，称之为“装饰器”（Decorator）。
#本质上，decorator就是一个返回函数的高阶函数
def now():
    print('2016-7-4')
f=now
print(now.__name__)    #函数对象有一个__name__属性，可以拿到函数的名字
print(f.__name__)
def log(func):
    def wrapper(*args, **kw):
        print('call %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper
#log是一个decorator，接受一个函数作为参数，并返回一个函数。
#借助Python的@语法，把decorator置于函数的定义处
@log            #把@log放到now()函数的定义处，相当于执行了语句：now = log(now)
def now():
    print('2016-7-5')
now()       #调用now()函数，不仅会运行now()函数本身，还会在运行now()函数前打印一行日志
#由于log()是一个decorator，返回一个函数，所以，原来的now()函数仍然存在，只是现在同名的now变量指向了新的函数，于是调用now()将执行新函数，即在log()函数中返回的wrapper()函数。
#wrapper()函数的参数定义是(*args, **kw)，因此，wrapper()函数可以接受任意参数的调用。在wrapper()函数内，首先打印日志，再紧接着调用原始函数。
#如果decorator本身需要传入参数，那就需要编写一个返回decorator的高阶函数，写出来会更复杂。比如，要自定义log的文本：
def log(text):
    def decorator(func):
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator
@log('execute')
def now():
    print('2015-3-25')
now()
now = log('execute')(now)
#需要把原始函数的__name__等属性复制到wrapper()函数中，否则，有些依赖函数签名的代码执行就会出错。
#不需要编写wrapper.__name__ = func.__name__这样的代码，Python内置的functools.wraps就是干这个事的，所以，一个完整的decorator的写法如下：
import functools
def log(func):
    @functools.wraps(func)
    def wrapper(*args, **kw):
        print('call %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper

import functools        #针对带参数的decorator
def log(text):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator
#在面向对象（OOP）的设计模式中，decorator被称为装饰模式。OOP的装饰模式需要通过继承和组合来实现，而Python除了能支持OOP的decorator外，直接从语法层次支持decorator。Python的decorator可以用函数实现，也可以用类实现。
#decorator可以增强函数的功能，定义起来虽然有点复杂，但使用起来非常灵活和方便


#偏函数Partial Function
#functools.partial的作用就是，把一个函数的某些参数给固定住（也就是设置默认值），返回一个新的函数，调用这个新函数会更简单
int('12345')
int('12345',base=8)
int('110010',base=2)
def int2(x,base=2):
    return int(x,base)
import functools
int2=functools.partial(int,base=2)  #仅仅是把base参数重新设定默认值为2，但也可以在函数调用时传入其他值：
int2('100000')
#创建偏函数时，实际上可以接收函数对象、*args和**kw这3个参数
#当函数的参数个数太多，需要简化时，使用functools.partial可以创建一个新的函数，这个新函数可以固定住原函数的部分参数，从而在调用时更简单
