#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Quanyin Tang'
import math
def quadratic(a,b,c):
    if a==0:
        if b==0:
            if c==0:
                print('任意解')
                return
            else:
                print("无解")
                return
        else:
            return c/b
    elif b**2-4*a*c<0:
        print('无解')
        return
    else:
        x1=(-b+math.sqrt(b**2-4*a*c))/(2*a)
        x2=(-b-math.sqrt(b**2-4*a*c))/(2*a)
        return x1,x2
solve=quadratic(0,0,0)
print(solve)
solve=quadratic(0,0,1)
print(solve)
solve=quadratic(0,1,1)
print(solve)
solve=quadratic(2,3,11)
print(solve)
solve=quadratic(2,7,-1)
print(solve)

#默认参数
def enroll(name,gender,age=6,city="SH"):
    print('name:',name)
    print('gender:',gender)
    print('age:',age)
    print('city:',city)
enroll('S','F')
enroll('B','m',7)
enroll('T','m',city='BJ')   #越过某个默认参数时，需要输入参数名

#默认参数 
def add_end(L=None):
    if L is None:
        print(L)
        L=[]
    L.append('End')
    return L
print(add_end([1,2,3]))
print(add_end(['x','y']))
print(add_end())
print(add_end())

#可变参数
def calc(numbers):
    sum=0
    for n in numbers:
        sum=sum+n*n
    return sum
print(calc([1,2,3]),calc([1,3,5,7]),calc((1,2,3,4)))
#传入参数必须先包装成List或Tuple

def calc1(*numbers):   #可变参数前多个*号
    sum=0
    for n in numbers:
        sum=sum+n*n
    return sum
print(calc1(1,2,3),calc1()) #可以直接传入任意个参数
nums=[1,3,4]
print(calc1(*nums))         #参数为元祖或者列表时，在传入参数时前面加上*



#关键字参数
def person(name,age,**ke):              #关键字参数前面加上**,是可选项
    print('name:',name,'age:',age,'other:',ke)
person('Bob',35,city='BJ')
person("adam",40,gender='M',Job='Teacher')
extra={'city':"BJ",'job':'Engineer'} #用字典传入关键参数,参数前加上**
person('Jack',35,**extra)

#命名关键字参数
def person1(name,age,**kw):
    if 'city' in kw:
        pass
    if 'job' in kw:
        pass
    print('name：',name,'age:',age,'other:',kw)
person1('Jack',24,city='Beijing',addr='Chaoyang') #可以传入不受限制的关键字参数

def person2(name,age,*,city,job):
    #命名关键字参数需要特殊的分隔符*，其后参数视为关键字参数
    #如果已经有可变参数，则不需要再加*
    #调用关键字参数必须传入参数名
    print(name,age,city,job)
person2('Jack',24,city='Bj',job='Engineer')


##参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。
def f1(a,b,c=0,*args,**kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)
def f2(a,b,c=0,*,d,**kw):
    print('a =', a, 'b =', b, 'c =', c, 'd =', d, 'kw =', kw)
f1(1,2)
f1(1,2,3)
f1(1,2,c=3)
f1(1,2,3,'a','b')
f1(1,2,3,'a','b')
f1(1,2,3,'a','b',x=99)
f2(1,2,d=99,ext=None)
#通过tuple和dict调用上述函数，对于任意函数，均可以通过func(*args,**kw)方式调用
args=(1,2,3,4)
kw={'d':99,'x':'#'}
f1(*args,**kw)
args=(1,2,3)
f2(*args,**kw)

#列表生成式
L1=[x*x for x in range(10)]
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

def triangles(max=10):             #Yanghui Sanjiao
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
#Python的Iterator对象表示的是一个数据流，Iterator对象可以被next()函数调用并不断返回下一个数据，直到没有数据时抛出StopIteration错误。可以把这个数据流看做是一个有序序列，但我们却不能提前知道序列的长度，只能不断通过next()函数实现按需计算下一个数据，所以Iterator的计算是惰性的，只有在需要返回下一个数据时它才会计算。Iterator甚至可以表示一个无限大的数据流

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
int('1001010',base=2)
def int2(x,base=2):
    return int(x,base)
import functools
int2=functools.partial(int,base=2)  #仅仅是把base参数重新设定默认值为2，但也可以在函数调用时传入其他值：
int2('100000')
#创建偏函数时，实际上可以接收函数对象、*args和**kw这3个参数
#当函数的参数个数太多，需要简化时，使用functools.partial可以创建一个新的函数，这个新函数可以固定住原函数的部分参数，


#模块Module
#在Python中，一个.py文件就称之为一个模块（Module）
#使用模块还可以避免函数名和变量名冲突。相同名字的函数和变量完全可以分别存在不同的模块中
#为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包（Package）
#方法是选择一个顶层包名(文件夹)，如mycompany,每一个包目录下面都会有一个__init__.py的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包。__init__.py可以是空文件，也可以有Python代码，因为__init__.py本身就是一个模块，而它的模块名就是mycompany

#作用域
#正常的函数和变量名是公开的（public），可以被直接引用
#有的函数和变量我们希望给别人使用，有的函数和变量我们希望仅仅在模块内部使用。在Python中，是通过_前缀来实现的
#类似__xxx__这样的变量是特殊变量，可以被直接引用，但是有特殊用途，我们自己的变量一般不要用这种变量名
#类似_xxx和__xxx这样的函数或变量就是非公开的（private），不应该被直接引用
#外部不需要引用的函数全部定义成private，只有外部需要引用的函数才定义为public

#安装第三方模块,通过命令行下pip实现
#一般来说，第三方库都会在Python官方的pypi.python.org网站注册，要安装一个第三方库，必须先知道该库的名称，可以在官网或者pypi上搜索
#当我们试图加载一个模块时，Python会在指定的路径下搜索对应的.py文件，如果找不到，就会报错。
#默认情况下，Python解释器会搜索当前目录、所有已安装的内置模块和第三方模块，搜索路径存放在sys模块的path变量中
#如果我们要添加自己的搜索目录，有两种方法：一是直接修改sys.path，添加要搜索的目录：第二种方法是设置环境变量PYTHONPATH，该环境变量的内容会被自动添加到模块搜索路径中。设置方式与设置Path环境变量类似。

####——————————————————————————————————————————
#面向对象编程OOP——OOP把对象作为程序的基本单元，一个对象包含了数据和操作数据的函数。
#面向过程的程序设计把计算机程序视为一系列的命令集合，即一组函数的顺序执行。为了简化程序设计，面向过程把函数继续切分为子函数，即把大块函数通过切割成小块函数来降低系统的复杂度。
#面向对象的程序设计把计算机程序视为一组对象的集合，而每个对象都可以接收其他对象发过来的消息，并处理这些消息，计算机程序的执行就是一系列消息在各个对象之间传递。
#面向过程
std1 = { 'name': 'Michael', 'score': 98 }
std2 = { 'name': 'Bob', 'score': 81 }
def print_score(std):
    print('%s:%s'%(std['name'],std['score']))
#面向对象-首选不是程序的执行流程，而是把student这个数据类型视为一个对象，这个对象拥有name和score两个属性
        #如果要打印一个学生的成绩，首先必须创建出这个学生对应的对象，然后，给对象发一个print_score消息，让对象自己把自己的数据打印出来
class Student(object):                  #定义Student这个类Class,通过class关键字
                                        #class后面紧接着是类名，即Student，类名通常是大写开头的单词，
                                        #紧接着是(object)，表示该类是从哪个类继承下来的
                                        #通常，如果没有合适的继承类，就使用object类，这是所有类最终都会继承的类
    def __init__(self,name=0,score=0):  #通过定义一个特殊的__init__方法，在创建实例的时候，就把name，score等属性绑上去
                                        #__init__方法的第一个参数永远是self，表示创建的实例本身
                                        #在__init__方法内部，就可以把各种属性绑定到self，因为self就指向创建的实例本身。
                                        #有了__init__方法，在创建实例的时候，就不能传入空的参数了，必须传入与__init__方法匹配的参数
                                        #self不需要传，Python解释器自己会把实例变量传进去
        self.name=name
        self.score=score
    def print_score(self):              #定义类的方法Method
        print('%s:%s'%(self.name,self.score))
    def get_grade(self):
        if self.score >= 90:
            return 'A'
        elif self.score >= 60:
            return 'B'
        else:
            return 'C'
#给对象发消息实际上就是调用对象对应的关联函数，我们称之为对象的方法（Method）
#和普通的函数相比，在类中定义的函数只有一点不同，就是第一个参数永远是实例变量self，并且，调用时，不用传递该参数。除此之外，类的方法和普通函数没有什么区别，所以，你仍然可以用默认参数、可变参数、关键字参数和命名关键字参数。
bart=Student('Bart Simpon',57)      #实例（Instance），是一个个具体的Student
lisa=Student('Lisa Simpon',87)      
qytang=Student()                        #创建实例是通过类名+()实现的
qytang.name='Quanyin Tang'              #可以自由地给一个实例变量绑定属性 
                                    #可以在创建实例的时候，把一些我们认为必须绑定的属性强制填写进去
bart.print_score()  
lisa.print_score()
#面向对象的设计思想是抽象出Class，根据Class创建Instance。
#面向对象的抽象程度又比函数要高，因为一个Class既包含数据，又包含操作数据的方法

##面向对象编程的一个重要特点就是数据封装
#既然Student实例本身就拥有这些数据，要访问这些数据，就没有必要从外面的函数去访问，可以直接在Student类的内部定义访问数据的函数，这样，就把“数据”给封装起来了。这些封装数据的函数是和Student类本身是关联起来的，我们称之为类的方法
#定义一个方法，除了第一个参数是self外，其他和普通函数一样。要调用一个方法，只需要在实例变量上直接调用，除了self不用传递，其他参数正常传入
#封装的另一个好处是可以给Student类增加新的方法，比如get_grade
print(bart.get_grade())
##类是创建实例的模板，而实例则是一个一个具体的对象，各个实例拥有的数据都互相独立，互不影响；方法就是与实例绑定的函数，和普通函数不同，方法可以直接访问实例的数据.通过在实例上调用方法，我们就直接操作了对象内部的数据，但无需知道方法内部的实现细节。


###访问限制
#如果要让内部属性不被外部访问，可以把属性的名称前加上两个下划线__，在Python中，实例的变量名如果以__开头，就变成了一个私有变量（private），只有内部可以访问，外部不能访问
class Student(object):

    def __init__(self, name, score):
        self.__name = name              #改完后，对于外部代码来说，没什么变动，但是已经无法从外部访问实例变量.__name和实例变量.__score
        self.__score = score

    def print_score(self):
        print('%s: %s' % (self.__name, self.__score))
bart=Student('Bart Simpon',98)
#bart.__name无法访问，会报错确保了外部代码不能随意修改对象内部的状态，这样通过访问限制的保护，代码更加健壮
#如果外部代码要获取name和score怎么办？可以给Student类增加get_name和get_score这样的方法
class Student(object):
    ...

    def get_name(self):
        return self.__name

    def get_score(self):
        return self.__score
#如果又要允许外部代码修改score怎么办？可以再给Student类增加set_score方法：
class Student(object):
    ...

    def set_score(self, score):
        self.__score = score
#原先那种直接通过bart.score = 59也可以修改啊，为什么要定义一个方法大费周折？因为在方法中，可以对参数做检查，避免传入无效的参数：

#在Python中，变量名类似__xxx__的，也就是以双下划线开头，并且以双下划线结尾的，是特殊变量，特殊变量是可以直接访问的，不是private变量，所以，不能用__name__、__score__这样的变量名

#以一个下划线开头的实例变量名，比如_name，这样的实例变量外部是可以访问的，但是，按照约定俗成的规定，当你看到这样的变量时，意思就是，“虽然我可以被访问，但是，请把我视为私有变量，不要随意访问”。

#不能直接访问__name是因为Python解释器对外把__name变量改成了_Student__name，所以，仍然可以通过_Student__name来访问__name变量

#####继承和多态
#在OOP程序设计中，当我们定义一个class的时候，可以从某个现有的class继承，新的class称为子类（Subclass），而被继承的class称为基类、父类或超类（Base class、Super class）
#继承有什么好处？最大的好处是子类获得了父类的全部功能。由于Animial实现了run()方法
class Animal(object):
    def run(self):
        print('Animal is running....')
class Dog(Animal):    #继承使用方法：类名后面（）内写上继承的类名，如果没有，默认写上object
    pass
class Cat(Animal):
    pass
dog=Dog()
dog.run()
#继承也可以增加一些新的方法，也可以对代码进行改进，当子类和父类都存在相同的run()方法时，我们说，子类的run()覆盖了父类的run()，在代码运行的时候，总是会调用子类的run()。这样，我们就获得了继承的另一个好处：多态。
class Dog(Animal):
    def run(self):
        print("Dog is running....")
    def eat(self):
        print('Eating meat...')
dog=Dog()
dog.run()

a=list()
b=Animal()
c=Dog()
#判断一个变量是否是某个类型可以用isinstance()判断：
print(isinstance(a,list))
print(isinstance(b,Animal))
print(isinstance(c,Dog))
print(isinstance(c,Animal))

def run_twice(animal):
    animal.run()
    animal.run()
run_twice(Animal())
run_twice(Dog())    #新增一个Animal的子类，不必对run_twice()做任何修改，实际上，任何依赖Animal作为参数的函数或者方法都可以不加修改地正常运行
#多态的好处就是，当我们需要传入Dog、Cat、Tortoise……时，我们只需要接收Animal类型就可以了，因为Dog、Cat、Tortoise……都是Animal类型，然后，按照Animal类型进行操作即可。由于Animal类型有run()方法，因此，传入的任意类型，只要是Animal类或者子类，就会自动调用实际类型的run()方法，这就是多态的意思：
#多态真正的威力：调用方只管调用，不管细节，而当我们新增一种Animal的子类时，只要确保run()方法编写正确，不用管原来的代码是如何调用的。
#这就是著名的“开闭”原则：
    #对扩展开放：允许新增Animal子类；
    #对修改封闭：不需要修改依赖Animal类型的run_twice()等函数。
#继承可以把父类的所有功能都直接拿过来，这样就不必重零做起，子类只需要新增自己特有的方法，也可以把父类不适合的方法覆盖重写。
#动态语言的鸭子类型(一个对象只要“看起来像鸭子，走起路来像鸭子”，那它就可以被看做是鸭子)特点决定了继承不像静态语言那样是必须的。

#########获取对象信息
###使用type()
#首先，我们来判断对象类型，使用type()函数：基本类型都可以用type()判断：
print(type(123))
print(type('str'))
print(type(None))
print(type(dog))
print(abs)          #如果一个变量指向函数或者类，也可以用type()判断
#type()函数返回对应的Class类型。如果我们要在if语句中判断，就需要比较两个变量的type类型是否相同
print(type(123)==type(234))
print(type(123)==type('s'))
#判断基本数据类型可以直接写int，str等，但如果要判断一个对象是否是函数怎么办？可以使用types模块中定义的常量
print(type(123)==int)
print(type(123)==str)
import types
def fn():
    pass
print(type(fn)==types.FunctionType)
type(abs)==types.BuiltinFunctionType
type(lambda x: x)==types.LambdaType
type((x for x in range(10)))==types.GeneratorType
###使用isinstance()
#能用type()判断的基本类型也可以用isinstance()判断
print(isinstance('a',str))
#并且还可以判断一个变量是否是某些类型中的一种，比如下面的代码就可以判断是否是list或者tuple
print(isinstance([1,2,3],(list,tuple)))
####使用dir()
#如果要获得一个对象的所有属性和方法，可以使用dir()函数，它返回一个包含字符串的list
print(dir('abc'))
#类似__xxx__的属性和方法在Python中都是有特殊用途的，比如__len__方法返回长度。在Python中，如果你调用len()函数试图获取一个对象的长度，实际上，在len()函数内部，它自动去调用该对象的__len__()方法
print(len('ANC'))
print('ABC'.__len__())
class MyObject(object):
    def __init__(self):
        self.x=9
    def power(self):
        return self.x*self.x
obj=MyObject()
#配合getattr()、setattr()以及hasattr()，我们可以直接操作一个对象的状态
print(hasattr(obj, 'x'))    # 有属性'x'吗？
print(hasattr(obj, 'x'))    # 有属性'x'吗？
print(setattr(obj, 'y',19))    # 设置属性一个'y'
print(hasattr(obj, 'y'))    # 有属性'y'吗？
print(getattr(obj, 'y'))    #获取属性'y'
print(obj.y)
#如果试图获取不存在的属性，会抛出AttributeError的错误
#可以传入一个default参数，如果属性不存在，就返回默认值
print(getattr(obj, 'z', 404)) # 获取属性'z'，如果不存在，返回默认值404
#也可以获得对象的方法：
hasattr(obj, 'power') # 有属性'power'吗？
getattr(obj, 'power') # 获取属性'power'
fn = getattr(obj, 'power') # 获取属性'power'并赋值到变量fn
fn # fn指向obj.power
fn() # 调用fn()与调用obj.power()是一样的
###通过内置的一系列函数，我们可以对任意一个Python对象进行剖析，拿到其内部的数据。要注意的是，只有在不知道对象信息的时候，我们才会去获取对象信息。假设我们希望从文件流fp中读取图像，我们首先要判断该fp对象是否存在read方法，如果存在，则该对象是一个流，如果不存在，则无法读取。hasattr()就派上了用场。

############实例属性和类属性
#根据类创建的实例可以任意绑定属性。
#给实例绑定属性的方法是通过实例变量，或者通过self变量
class Student(object):
    def __init__(self, name):
        self.name = name

s = Student('Bob')
s.score = 90
#如果Student类本身需要绑定一个属性呢？可以直接在class中定义属性，这种属性是类属性，归Student类所有。当我们定义了一个类属性后，这个属性虽然归类所有，但类的所有实例都可以访问到
class Student(object):
    name = 'Student'
#在编写程序的时候，千万不要把实例属性和类属性使用相同的名字，因为相同名称的实例属性将屏蔽掉类属性，但是当你删除实例属性后，再使用相同的名称，访问到的将是类属性。

####使用__slots__
#正常情况下，当我们定义了一个class，创建了一个class的实例后，我们可以给该实例绑定任何属性和方法，这就是动态语言的灵活性
class Student(object):          #定义一个类
    pass
s=Student()                     #创建一个实例
s.name='qytang'                 #动态给实例绑定一个属性
print(s.name)
#尝试给实例绑定一个方法
def set_age(self,age):          #定义一个函数作为实例方法
    self.age=age
from types import MethodType
s.set_age=MethodType(set_age,s)     #给实例绑定一个方法
s.set_age(25)                       #调用实例方法
print(s.age)

#给一个实例绑定的方法，对另一个实例不起作用
s2=Student()

#为了给所有实例都绑定方法，可以给class绑定方法,这样所有实例都可以调用
#动态绑定允许我们在程序运行的过程中动态给class加上功能
def set_score(self,score):
    self.score=score
Student.set_score=set_score
s.set_score(99)
s2.set_score(100)
print(s.score,s2.score)

##如果我们想要限制实例的属性怎么办？比如，只允许对Student实例添加name和age属性。
#为了达到限制的目的，Python允许在定义class的时候，定义一个特殊的__slots__变量，来限制该class实例能添加的属性
class Student(object):
    __slots__ = ('name', 'age') # 用tuple定义允许绑定的属性名称
s=Student()
s.name="M"
s.age=25
#s.score=99          #由于'score'没有被放到__slots__中，所以不能绑定score属性，试图绑定score将得到AttributeError的错误
#使用__slots__要注意，__slots__定义的属性仅对当前类实例起作用，对继承的子类是不起作用的
#除非在子类中也定义__slots__，这样，子类实例允许定义的属性就是自身的__slots__加上父类的__slots__

##############使用@property
#在绑定属性时，如果我们直接把属性暴露出去，虽然写起来很简单，但是，没办法检查参数
#为了限制score的范围，可以通过一个set_score()方法来设置成绩，再通过一个get_score()来获取成绩，这样，在set_score()方法里，就可以检查参数
class Student(object):
    def get_score(self):
        return self._score
    def set_score(self,value):
        if not isinstance(value,int):
            raise ValueError('score must be an integer!')
        if value<0 or value>100:
            raise ValueError("Score must between 0~100")
        self._score=value
s=Student()
s.set_score(60)
print(s.get_score())
#s.set_score(9999)
#上面的方法太过于复杂，没有直接用属性直接简单

#Python内置的@property装饰器就是负责 把一个方法变成属性  调用的
class Student(object):
    @property                       #利用@property把方法定义为属性
    def score(self):
        return self._score
    @score.setter                   #利用setter进行赋值
    def score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an integer!')
        if value < 0 or value > 100:
            raise ValueError('score must between 0 ~ 100!')
        self._score = value
s=Student()
s.score=60
print(s.score)
#神奇的@property，我们在对实例属性操作的时候，就知道该属性很可能不是直接暴露的，而是通过getter和setter方法来实现的。
#可以定义只读属性，只定义getter方法，不定义setter方法就是一个只读属性：
class Student(object):

    @property
    def birth(self):
        return self._birth

    @birth.setter
    def birth(self, value):
        self._birth = value

    @property
    def age(self):
        return 2015 - self._birth
#@property广泛应用在类的定义中，可以让调用者写出简短的代码，同时保证对参数进行必要的检查，这样，程序运行时就减少了出错的可能性

######多重继承
#正确的做法是采用多重继承。首先，主要的类层次仍按照哺乳类和鸟类设计：

class Animal(object):
    pass
# 大类:
class Mammal(Animal):
    pass
class Bird(Animal):
    pass
# 各种动物:
class Dog(Mammal):
    pass
class Bat(Mammal):
    pass
class Parrot(Bird):
    pass
class Ostrich(Bird):
    pass
#给动物再加上Runnable和Flyable的功能，只需要先定义好Runnable和Flyable的类：
class Runnable(object):
    def run(self):
        print('Running...')
class Flyable(object):
    def fly(self):
        print('Flying...')
#对于需要Runnable功能的动物，就多继承一个Runnable，例如Dog：
class Dog(Mammal, Runnable):
    pass
##通过多重继承，一个子类就可以同时获得多个父类的所有功能
#在设计类的继承关系时，通常，主线都是单一继承下来的，例如，Ostrich继承自Bird。但是，如果需要“混入”额外的功能，通过多重继承就可以实现，比如，让Ostrich除了继承自Bird外，再同时继承Runnable。这种设计通常称之为MixIn。
#为了更好地看出继承关系，我们把Runnable和Flyable改为RunnableMixIn和FlyableMixIn。类似的，你还可以定义出肉食动物CarnivorousMixIn和植食动物HerbivoresMixIn，让某个动物同时拥有好几个MixIn：
#class Dog(Mammal,RunnableMixIn,CarnivorousMixIn):
    pass
##MixIn的目的就是给一个类增加多个功能，这样，在设计类的时候，我们优先考虑通过多重继承来组合多个MixIn的功能，而不是设计多层次的复杂的继承关系。
##不需要复杂而庞大的继承链，只要选择组合不同的类的功能，就可以快速构造出所需的子类。
##############定制类
##形如__xxx__的变量或者函数名就要注意，这些在Python中是有特殊用途的
##__len__()方法我们也知道是为了能让class作用于len()函数。除此之外，Python的class中还有许多这样有特殊用途的函数，可以帮助我们定制类
##__str__       返回字符串，可以进行打印输出
class Student(object):
    def __init__(self,name):
        self.name=name
print(Student('qytang'))        #打印出一堆<__main__.Student object at 0x109afb190>
#只需要定义好__str__()方法，返回一个好看的字符串就可以
class Student(object):
    def __init__(self,name):
        self.name=name
    def __str__(self):
        return 'Student object (name :%s)' %self.name
print(Student("Quanyin"))
s=Student('Quanyin')
s
#直接显示变量调用的不是__str__()，而是__repr__()，两者的区别是__str__()返回用户看到的字符串，而__repr__()返回程序开发者看到的字符串，也就是说，__repr__()是为调试服务的。
#解决办法是再定义一个__repr__()。但是通常__str__()和__repr__()代码都是一样的
class Student(object):
    def __init__(self,name):
        self.name=name
    def __str__(self):
        return 'Student object (name :%s)' %self.name
    __repr__=__str__

###__iter__    返回一个迭代对象，可以进行迭代
#如果一个类想被用于for ... in循环，类似list或tuple那样，就必须实现一个__iter__()方法，该方法返回一个迭代对象，然后，Python的for循环就会不断调用该迭代对象的__next__()方法拿到循环的下一个值，直到遇到StopIteration错误时退出循环
class Fib(object):
    def __init__(self):
        self.a,self.b=0,1     #初始化a,b
    def __iter__(self):
        return self         #实例本身就是迭代对象，故返回自己
    def __next__(self):
        self.a,self.b=self.b,self.a+self.b  #计算下一个值
        if self.a>100000:   #退出循环条件
            raise StopIteration();
        return self.a   #返回下一个值
for n in Fib():
    print(n)
###__get__          要表现得像list那样按照下标取出元素，需要实现__getitem__()方法
class Fib(object):
    def __getitem__(self, n):
        a, b = 1, 1
        for x in range(n):
            a, b = b, a + b
        return a
f=Fib()
print(f[0],f[4],f[100])
#list有个神奇的切片方法：list(range(100))[5:10],对于Fib却报错。原因是__getitem__()传入的参数可能是一个int，也可能是一个切片对象slice，所以要做判断:
class Fib(object):
    def __getitem__(self,n):
        if isinstance(n,int):   #n是索引
            a,b=1,1
            for x in range(n):
                a,b=b,a+b
            return a
        if isinstance(n,slice):         #n是切片
            start=n.start
            stop=n.stop
            if start is None:
                start=0
            a,b=1,1
            L=[]
            for x in range(stop):
                if x>=start:
                    L.append(a)
                a,b=b,a+b
            return L

f=Fib()
print(f[0:5],f[:8])
#但是没有对step参数作处理：也没有对负数作处理，所以，要正确实现一个__getitem__()还是有很多工作要做的。
#此外，如果把对象看成dict，__getitem__()的参数也可能是一个可以作key的object，例如str。
#与之对应的是__setitem__()方法，把对象视作list或dict来对集合赋值。最后，还有一个__delitem__()方法，用于删除某个元素。
#总之，通过上面的方法，我们自己定义的类表现得和Python自带的list、tuple、dict没什么区别，这完全归功于动态语言的“鸭子类型”，不需要强制继承某个接口

####__getattr__
#正常情况下，当我们调用类的方法或属性时，如果不存在，就会报错。要避免这个错误，除了可以加上这个属性和方法之外，python还有另外一个机制，那就是写一个__getattr__()方法，动态返回一个属性。修改如下：
class Student(object):
    def __init__(self,name):
        self.name=name
    def __getattr__(self,attr):
        if attr=='score':
            return 99
#当调用不存在的属性时，比如score，Python解释器会试图调用__getattr__(self,'score')来尝试获得属性，这样就有机会返回score的值
s=Student("qytang")
print(s.name)
print(s.score)
#返回函数也是可以的
class Student(object):
    def __getattr__(self,attr):
        if attr=='age':
            return lambda:25
s=Student()
print(s.age())
##注意：只有在没有找到属性的情况下，才会调用__getattr__,已有的属性，不会在__getattr__()中查找
##任意调用会返回None，因为我们定义的__getattr__默认返回值是None。要让class值响应特定的几个属性，就需要按照约定，抛出AttributeError的错误：
class Student(object):
    def __getattr__(self,attr):
        if attr=='age':
            return lambda:24
        raise AttributeError('\'Student\' object has no attribute\'%s\''%attr)
s=Student()
print(s.age())
#print(s.abv())  
##这实际上可以把一个类的所有属性和方法调用全部动态化处理了，不需要任何特殊手段。
#这种完全动态调用的特性有什么实际作用呢？作用就是，可以针对完全动态的情况作调用。
#利用完全动态的__getattr__，我们可以写出一个链式调用：
class Chain(object):
    def __init__(self, path=''):
        self._path = path
    def __getattr__(self, path):
        return Chain('%s/%s' % (self._path, path))
    def __str__(self):
        return self._path
    __repr__ = __str__
print(Chain().status.user.timeline.list)    #'/status/user/timeline/list'

###__call__    直接对实例进行调用
#一个对象实例可以有自己的属性和方法，当我们调用实例方法时，我们用instance.method()来调用。能不能直接在实例本身上调用呢？在Python中，任何类，只需要定义一个__call__()方法，就可以直接对实例进行调用
class Student(object):
    def __init__(self,name="Quanyin"):
        self.name=name
    def __call__(self):
        print('My name: %s'%self.name)
s=Student('Quanyin')
s()         #self参数不需要传入

#__call__()还可以定义参数。对实例进行直接调用就好比对一个函数进行调用一样，所以你完全可以把对象看成函数，把函数看成对象，因为这两者之间本来就没啥根本的区别。
#如果你把对象看成函数，那么函数本身其实也可以在运行期动态创建出来，因为类的实例都是运行期创建出来的，这么一来，我们就模糊了对象和函数的界限。
#怎么判断一个变量是对象还是函数呢？其实，更多的时候，我们需要判断一个对象是否能被调用，能被调用的对象就是一个Callable对象，比如函数和我们上面定义的带有__call__()的类实例
print(callable(Student()),callable(max),callable([1,2,3]))
##通过callable()函数，我们就可以判断一个对象是否是“可调用”对象
#####Python的class允许定义许多定制方法，可以让我们非常方便地生成特定的类


##########使用枚举类
#当我们需要定义常量时，一个办法是用大写变量通过整数来定义,好处是简单，但缺点是仍然是变量
##更好的方法是为这样的枚举类型定义一个class类型，然后，每个常量都是class的一个唯一实例。Python提供了Enum类来实现这个功能
from enum import Enum
Month=Enum('Month',('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))
#获得了Month类型的枚举类，可以直接使用Month.Jan来引用一个常量，或者枚举它的所有成员：
for name,member in Month.__members__.items():
    print(name,'=>',member,',',member.value)
#value属性则是自动赋给成员的int常量，默认从1开始计数
##如果需要更精确地控制枚举类型，可以从Enum派生出自定义类：
from enum import Enum,unique
@unique         #@unique装饰器可以帮助我们检查保证没有重复值     
class Weekday(Enum):
    Sun = 0 # Sun的value被设定为0
    Mon = 1
    Tue = 2
    Wed = 3
    Thu = 4
    Fri = 5
    Sat = 6
#访问枚举类  既可以用成员名称引用枚举常量，又可以直接根据value的值获得枚举常量
day1 = Weekday.Mon
print(day1)
print(Weekday.Tue)
print(Weekday['Tue'])
print(Weekday.Tue.value)
print(Weekday(1))
for name, member in Weekday.__members__.items():
    print(name, '=>', member)
##Enum可以把一组相关常量定义在一个class中，且class不可变，而且成员可以直接比较
#########使用元类
###type()
#函数和类的定义，不是编译时定义的，而是运行时动态创建的。
#type()函数可以查看一个类型或变量的类型，Hello是一个class，它的类型就是type，而h是一个实例，它的类型就是class Hello
##class的定义是运行时动态创建的，而创建class的方法就是使用type()函数。type()函数既可以返回一个对象的类型，又可以创建出新的类型，比如，我们可以通过type()函数创建出Hello类，而无需通过class Hello(object)...的定义
def fn(self,name='world'):      #先定义函数
    print('Hello,%s.'%name)
Hello=type('Hello',(object,),dict(hello=fn)) #创建Hello class
h=Hello()
h.hello()
print(type(Hello))
print(type(h))
##要创建一个class对象，type()函数依次传入3个参数：
##      1、class的名称；
##      2、继承的父类集合，注意Python支持多重继承，如果只有一个父类，别忘了tuple的单元素写法(加上,号)；
##      3、class的方法名称与函数绑定，这里我们把函数fn绑定到方法名hello上。
#通过type()函数创建的类和直接写class是完全一样的，因为Python解释器遇到class定义时，仅仅是扫描一下class定义的语法，然后调用type()函数创建出class。
#正常情况下，我们都用class Xxx...来定义类，但是，type()函数也允许我们动态创建出类来，也就是说，动态语言本身支持运行期动态创建类，这和静态语言有非常大的不同，要在静态语言运行期创建类，必须构造源代码字符串再调用编译器，或者借助一些工具生成字节码实现，本质上都是动态编译，会非常复杂。

#####metaclass
#除了使用type()动态创建类以外，要控制类的创建行为,还可以使用metaclass,直译为元类，简单的解释是：
#当我们定义了类之后，就可以根据这个类创建出实例，所有：先定义类，然后创建实例
#但是，若我们想创建出类，就必须根据metaclass创建出类,所有：先定义metaclass,然后创建类，最后创建实例
#所以，metaclass允许创建类或者修改类，也即把类看成是metaclass创建出的“实例
#一个简单的例子，给我们自定义的MyList增加一个add方法：定义ListMetaclass，按照默认习惯，metaclass的类名总是以Metaclass结尾，以便清楚地表示这是一个metaclass：

# metaclass是类的模板，所以必须从`type`类型派生：
class ListMetaclass(type):
    def __new__(cls, name, bases, attrs):
        attrs['add'] = lambda self, value: self.append(value)
        return type.__new__(cls, name, bases, attrs)
#有了ListMetaclass，我们在定义类的时候还要指示使用ListMetaclass来定制类，传入关键字参数metaclass：
class MyList(list, metaclass=ListMetaclass):
    pass
##当我们传入关键字参数metaclass时，魔术就生效了，它指示Python解释器在创建MyList时，要通过ListMetaclass.__new__()来创建，在此，我们可以修改类的定义，比如，加上新的方法，然后，返回修改后的定义。

###__new__()方法接收到的参数依次是：
#   1、当前准备创建的类的对象；
#   2、类的名字；
#   3、类继承的父类集合；
#   4、类的方法集合。
L=MyList()
L.add(1)
print(L)
##动态修改有什么意义？直接在MyList定义中写上add()方法不是更简单吗？正常情况下，确实应该直接写，通过metaclass修改纯属变态。
#但是，总会遇到需要通过metaclass修改类定义的。ORM就是一个典型的例子。ORM全称“Object Relational Mapping”，即对象-关系映射，就是把关系数据库的一行映射为一个对象，也就是一个类对应一个表，这样，写代码更简单，不用直接操作SQL语句。
#要编写一个ORM框架，所有的类都只能动态定义，因为只有使用者才能根据表的结构定义出对应的类来。
#让我们来尝试编写一个ORM框架。
#编写底层模块的第一步，就是先把调用接口写出来。比如，使用者如果使用这个ORM框架，想定义一个User类来操作对应的数据库表User，我们期待他写出这样的代码：
#class User(Model):
    # 定义类的属性到列的映射：
#    id = IntegerField('id')
#    name = StringField('username')
#    email = StringField('email')
#    password = StringField('password')

# 创建一个实例：
#u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
# 保存到数据库：
#u.save()
#其中，父类Model和属性类型StringField、IntegerField是由ORM框架提供的，剩下的魔术方法比如save()全部由metaclass自动完成。虽然metaclass的编写会比较复杂，但ORM的使用者用起来却异常简单。

#现在，我们就按上面的接口来实现该ORM。
#首先来定义Field类，它负责保存数据库表的字段名和字段类型：
class Field(object):
    def __init__(self, name, column_type):
        self.name = name
        self.column_type = column_type
    def __str__(self):
        return '<%s:%s>' % (self.__class__.__name__, self.name)
#在Field的基础上，进一步定义各种类型的Field，比如StringField，IntegerField等等：
class StringField(Field):
    def __init__(self, name):
        super(StringField, self).__init__(name, 'varchar(100)')
class IntegerField(Field):
    def __init__(self, name):
        super(IntegerField, self).__init__(name, 'bigint')
#下一步，就是编写最复杂的ModelMetaclass了：
class ModelMetaclass(type):
    def __new__(cls, name, bases, attrs):
        if name=='Model':
            return type.__new__(cls, name, bases, attrs)
        print('Found model: %s' % name)
        mappings = dict()
        for k, v in attrs.items():
            if isinstance(v, Field):
                print('Found mapping: %s ==> %s' % (k, v))
                mappings[k] = v
        for k in mappings.keys():
            attrs.pop(k)
        attrs['__mappings__'] = mappings # 保存属性和列的映射关系
        attrs['__table__'] = name # 假设表名和类名一致
        return type.__new__(cls, name, bases, attrs)
#以及基类Model：
class Model(dict, metaclass=ModelMetaclass):
    def __init__(self, **kw):
        super(Model, self).__init__(**kw)
    def __getattr__(self, key):
        try:
            return self[key]
        except KeyError:
            raise AttributeError(r"'Model' object has no attribute '%s'" % key)
    def __setattr__(self, key, value):
        self[key] = value
    def save(self):
        fields = []
        params = []
        args = []
        for k, v in self.__mappings__.items():
            fields.append(v.name)
            params.append('?')
            args.append(getattr(self, k, None))
        sql = 'insert into %s (%s) values (%s)' % (self.__table__, ','.join(fields), ','.join(params))
        print('SQL: %s' % sql)
        print('ARGS: %s' % str(args))
#当用户定义一个class User(Model)时，Python解释器首先在当前类User的定义中查找metaclass，如果没有找到，就继续在父类Model中查找metaclass，找到了，就使用Model中定义的metaclass的ModelMetaclass来创建User类，也就是说，metaclass可以隐式地继承到子类，但子类自己却感觉不到。
#在ModelMetaclass中，一共做了几件事情：
#   1、排除掉对Model类的修改；
#   2、在当前类（比如User）中查找定义的类的所有属性，如果找到一个Field属性，就把它保存到一个__mappings__的dict中，同时从类属性中删除该Field属性，否则，容易造成运行时错误（实例的属性会遮盖类的同名属性）；
#   3、把表名保存到__table__中，这里简化为表名默认为类名。
#在Model类中，就可以定义各种操作数据库的方法，比如save()，delete()，find()，update等等。
#我们实现了save()方法，把一个实例保存到数据库中。因为有表名，属性到字段的映射和属性值的集合，就可以构造出INSERT语句。
class User(Model):
    # 定义类的属性到列的映射：
    id = IntegerField('id')
    name = StringField('username')
    email = StringField('email')
    password = StringField('password')

# 创建一个实例：
u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
# 保存到数据库：
u.save()
u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
u.save()
#可以看到，save()方法已经打印出了可执行的SQL语句，以及参数列表，只需要真正连接到数据库，执行该SQL语句，就可以完成真正的功能。不到100行代码，我们就通过metaclass实现了一个精简的ORM框架

#####——————————————————————————————————————————##########
#################错误、调试与测试
####错误处理
#在程序运行的过程中，如果发生了错误，可以事先约定返回一个错误代码
#用错误码来表示是否出错十分不便，因为函数本身应该返回的正常结果和错误码混在一起，造成调用者必须用大量的代码来判断是否出错：
def foo():
    r = some_function()
    if r==(-1):
        return (-1)
    # do something
    return r

def bar():
    r = foo()
    if r==(-1):
        print('Error')
    else:
        pass
##一旦出错，还要一级一级上报，直到某个函数可以处理该错误（比如，给用户输出一个错误信息）。
##高级语言通常都内置了一套try...except...finally...的错误处理机制
###try
try:
    print('try...')
    r=10/0
    print('result:',r)
except ZeroDivisionError as e:
    print('except:',e)
finally:
    print('finally...')
print('End')
#当我们认为某些代码可能会出错时，就可以用try来运行这段代码，如果执行出错，则后续代码不会继续执行，而是直接跳转至错误处理代码，即except语句块，执行完except后，如果有finally语句块，则执行finally语句块，至此，执行完毕
#当错误发生时，后续语句print('result:', r)不会被执行，except由于捕获到ZeroDivisionError，因此被执行。最后，finally语句被执行。然后，程序继续按照流程往下走
#由于没有错误发生，所以except语句块不会被执行，但是finally如果有，则一定会被执行（可以没有finally语句）。

#错误应该有很多种类，如果发生了不同类型的错误，应该由不同的except语句块处理。没错，可以有多个except来捕获不同类型的错误
try:
    #出现错误则跳到except部分，剩下部分不再运行
    print('try...')
    r=10/int('a')
    print('result:',r)
except ValueError as e:
    print('ValueError:',e)
except ZeroDivisionError as e:              #可以多个except捕获不同类型的错误
    print('ZeroDivisionError:',e)
else:                                       #如果没有错误，则运行else
    print('no error!')
finally:                                    #始终运行，可以没有
    print('finally...')
print('end')
#如果没有错误发生，可以在except语句块后面加一个else，当没有错误发生时，会自动执行else语句：

#Python的错误是class,所有的错误类型都继承自BaseException,所以在使用except时，它不但把捕获该类型的错误，还把其子类一网打尽
try:
    r=10/int('a')
except ValueError as e:
    print('ValueError:',e)
except UnicodeDecodeError as e:
    print("UnicodeDecodeError:",e)          #第二个except永远也捕获不到UnicodeError，因为UnicodeError是ValueError的子类，如果有，也被第一个except给捕获
###使用try...except捕获错误还有一个巨大的好处，就是可以跨越多层调用，比如函数main()调用foo()，foo()调用bar()，结果bar()出错了，这时，只要main()捕获到了，就可以处理：
#也即：需要在每个可能出错的地方去捕获错误，只要在合适的层次去捕获错误就可以了。这样一来，就大大减少了写try...except...finally的麻烦
def foo(s):
    return 10 / int(s)

def bar(s):
    return foo(s) * 2

def main():
    try:
        bar('0')
    except Exception as e:
        print('Error:', e)
    finally:
        print('finally...')
#########调用堆栈
#如果错误没有被捕获，它就会一直往上抛，最后被Python解释器捕获，打印一个错误信息，然后程序退出
######错误记录
#如果不捕获错误，自然可以让Python解释器来打印出错误堆栈，但程序也被结束了。既然我们能捕获错误，就可以把错误堆栈打印出来，然后分析错误原因，同时，让程序继续执行下去。
#Python内置的logging模块可以非常容易地记录错误信息：
'''
import logging
def foo(s):
    return 10 / int(s)
def bar(s):
    return foo(s) * 2
def main():
    try:
        bar('0')
    except Exception as e:
        logging.exception(e)
main()
print('END')
'''
####抛出错误
#因为错误是class，捕获一个错误就是捕获到该class的一个实例。因此，错误并不是凭空产生的，而是有意创建并抛出的。Python的内置函数会抛出很多类型的错误，我们自己编写的函数也可以抛出错误。
#如果要抛出错误，首先根据需要，可以定义一个错误的class，选择好继承关系，然后，用raise语句抛出一个错误的实例：
"""
class FooError(ValueError):
    pass
def foo(s):
    n = int(s)
    if n==0:
        raise FooError('invalid value: %s' % s)
    return 10 / n
foo('0')
"""
#只有在必要的时候才定义我们自己的错误类型。如果可以选择Python已有的内置的错误类型（比如ValueError，TypeError），尽量使用Python内置的错误类型

##另一种错误处理的方式：
'''
def foo(s):
    n = int(s)
    if n==0:
        raise ValueError('invalid value: %s' % s)
    return 10 / n
def bar():
    try:
        foo('0')
    except ValueError as e:
        print('ValueError!')
        raise
bar()
'''
#捕获错误目的只是记录一下，便于后续追踪。但是，由于当前函数不知道应该怎么处理该错误，所以，最恰当的方式是继续往上抛，让顶层调用者去处理。好比一个员工处理不了一个问题时，就把问题抛给他的老板，如果他的老板也处理不了，就一直往上抛，最终会抛给CEO去处理。
#raise语句如果不带参数，就会把当前错误原样抛出。此外，在except中raise一个Error，还可以把一种类型的错误转化成另一种类型：
'''
try:
    10 / 0
except ZeroDivisionError:
    raise ValueError('input error!')
'''
###Python内置的try...except...finally用来处理错误十分方便。出错时，会分析错误信息并定位错误发生的代码位置才是最关键的。
###程序也可以主动抛出错误，让调用者来处理相应的错误。但是，应该在文档中写清楚可能会抛出哪些错误，以及错误产生的原因
#######调试
##第一种方法简单直接粗暴有效，就是用print()把可能有问题的变量打印出来看看：
#用print()最大的坏处是将来还得删掉它，想想程序里到处都是print()，运行结果也会包含很多垃圾信息。所以，我们又有第二种方法
###断言
##凡是用print()来辅助查看的地方，都可以用断言（assert）来替代：
'''
def foo(s):
    n=int(s)
    assert n!=0,'n is zero!'
    return 10/n
def main():
    foo('0')
'''
#assert的意思是，表达式n != 0应该是True，否则，根据程序运行的逻辑，后面的代码肯定会出错。
#如果断言失败，assert语句本身就会抛出AssertionError：
#启动Python解释器时可以用-O参数来关闭assert,关闭后，你可以把所有的assert语句当成pass来看
####logging
#把print()替换为logging是第3种方式，和assert比，logging不会抛出错误，而且可以输出到文件：
'''
import logging
s = '0'
n = int(s)
logging.info('n = %d' % n)
print(10 / n)
#logging.info()就可以输出一段文本。运行，发现除了ZeroDivisionError，没有任何信息
#在import logging之后添加一行配置再试试：
import logging
logging.basicConfig(level=logging.INFO)
#logging的好处，它允许你指定记录信息的级别，有debug，info，warning，error等几个级别，当我们指定level=INFO时，logging.debug就不起作用了。同理，指定level=WARNING后，debug和info就不起作用了。这样一来，你可以放心地输出不同级别的信息，也不用删除，最后统一控制输出哪个级别的信息。
#logging的另一个好处是通过简单的配置，一条语句可以同时输出到不同的地方，比如console和文件
####pdb
#第4种方式是启动Python的调试器pdb，让程序以单步方式运行，可以随时查看运行状态。
#准备好需要调试的文件，用python3 -m pdb err.py启动
#以参数-m pdb启动后，pdb定位到下一步要执行的代码。
#输入命令l来查看代码
#输入命令n可以单步执行代码
#任何时候都可以输入命令   p 变量名   来查看变量
#输入命令q结束调试，退出程序
#####pdb.set_trace()
#也是用pdb，但是不需要单步执行，我们只需要import pdb，然后，在可能出错的地方放一个pdb.set_trace()，就可以设置一个断点：
#运行代码，程序会自动在pdb.set_trace()暂停并进入pdb调试环境，可以用命令p查看变量，或者用命令c继续运行
#######IDE
#如果要比较爽地设置断点、单步执行，就需要一个支持调试功能的IDE。目前比较好的Python IDE有PyCharm：http://www.jetbrains.com/pycharm/。Eclipse加上pydev插件也可以调试Python程序
###写程序最痛苦的事情莫过于调试，程序往往会以你意想不到的流程来运行，你期待执行的语句其实根本没有执行，这时候，就需要调试了。虽然用IDE调试起来比较方便，但是最后你会发现，logging才是终极武器。
'''

#######单元测试
#######文档测试


##############——————————————————————————
#########RE








input() #防止运行完自动退