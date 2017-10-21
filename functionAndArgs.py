# print absolute value of an integer:
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import math
def quadratic(a,b,c): 
#定义函数，注意不要漏了冒号，遇到return退出函数
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
def add_end(L=None):        #默认参数要为不可变对象，如None，True，1,2等
    if L is None:
        print(L)
        L=[]
    L.append('End')
    return L
print(add_end([1,2,3]))
print(add_end(['x','y']))
print(add_end())
print(add_end())

#可变参数                   #可变参数*args接收的是一个元组Tuple
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
#可变参数既可以直接传入：func(1, 2, 3)，又可以先组装list或tuple，再通过*args传入：func(*(1, 2, 3))；


#关键字参数                 #关键字参数**kw接收的是一个字典dict
def person(name,age,**ke):              #关键字参数前面加上**,是可选项
    print('name:',name,'age:',age,'other:',ke)
person('Bob',35,city='BJ')
person("adam",40,gender='M',Job='Teacher')
extra={'city':"BJ",'job':'Engineer'} #用字典传入关键参数,参数前加上**
person('Jack',35,**extra)          #关键字参数既可以直接传入：func(a=1, b=2)，又可以先组装dict，再通过**kw传入：func(**{'a': 1, 'b': 2})

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
#使用*args和**kw是Python的习惯写法，当然也可以用其他参数名，但最好使用习惯用法。

#命名的关键字参数是为了限制调用者可以传入的参数名，同时可以提供默认值。
#定义命名的关键字参数在没有可变参数的情况下不要忘了写分隔符*，否则定义的将是位置参数


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

#递归函数           #在函数内部调用自身本身
def fact(n):
    if n==1:
        return 1
    return n*fact(n-1)
print(fact(1),fact(2),fact(5),fact(100))
#使用递归函数需要注意防止栈溢出。在计算机中，函数调用是通过栈（stack）这种数据结构实现的，每当进入一个函数调用，栈就会加一层栈帧，每当函数返回，栈就会减一层栈帧。由于栈的大小不是无限的，所以，递归调用的次数过多，会导致栈溢出。
#解决递归调用栈溢出的方法是通过尾递归优化,尾递归本质上和循环等价
#尾递归是指，在函数返回的时候，调用自身本身，并且，return语句不能包含表达式!!!!。这样，编译器或者解释器就可以把尾递归做优化，使递归本身无论调用多少次，都只占用一个栈帧，不会出现栈溢出的情况

#要改成尾递归方式，需要多一点代码，主要是要把每一步的乘积传入到递归函数中：
def Fact(n):
    return Fact_iter(n,1)
def Fact_iter(num,product):
    if num==1:
        return product
    return Fact_iter(num-1,num*product)
print(Fact(5),Fact(100))
#return fact_iter(num - 1, num * product)仅返回递归函数本身，num - 1和num * product在函数调用前就会被计算，不影响函数调用
#尾递归调用时，如果做了优化，栈不会增长，因此，无论多少次调用也不会导致栈溢出。
#遗憾的是，大多数编程语言没有针对尾递归做优化，Python解释器也没有做优化，所以，即使把上面的fact(n)函数改成尾递归方式，也会导致栈溢出


