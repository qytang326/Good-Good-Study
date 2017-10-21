#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Quanyin Tang'
def add(value1,value2):
    return value1 + value2
result = add(3,5)
print(result)

def add(value1,value2):
    global results
    results = value1 + value2
add(3,5)
print(results)

def profile():
    name = "Danny"
    age = 30
    return  name,age 
profile_data=profile()
print(profile_data[0])
print(profile_data[1])

foo=['hi']
print(foo)
bar=foo
bar+=['bye']
print(foo)          ###Output:['hi','bye']

def add_to(num,target=[]):  
    #### Python中函数被定义时，默认参数只会运算一次，而不是每次都会重新运算！！
    ####！！！！永远不要定义可变类型的默认参数
    target.append(num)
    return target
print(add_to(1))
print(add_to(2))
print(add_to(3))    # Output:[1,2,3]

def add_to2(element,target=None):
    if target is None:
        target=[]
    target.append(element)
    return target
print(add_to2(11))
print(add_to2(21))
print(add_to2(31))

class MyClass(object):
    __slots__=['name','age']
    def __init__(self,name,age):
        self.name=name
        self.age=age
        self.set_up()


from collections import defaultdict
colours=(
        ('Yasoob','Yellow'),
        ('B','Blue'),
        ('C','Silver'),
        ('B','Blue'),
        )
favourite_colours = defaultdict(list)
for name,color in colours:
    favourite_colours[name].append(color)
print(favourite_colours)

import collections
tree = lambda:collections.defaultdict(tree)
some_dict=tree()
some_dict['colors']['favorite']='yellow'
import json
print(json.dumps(some_dict))


from collections import Counter
colours	=	(
				('Yasoob',	'Yellow'),
				('Ali',	'Blue'),
				('Arham',	'Green'),
				('Ali',	'Black'),
				('Yasoob',	'Red'),
				('Ahmed',	'Silver'),
)
favs=Counter(name for name,color in colours)
print(favs)

with open('out.log','rb') as f:
    line_count=Counter(f)
print(line_count)

from collections import deque
d=deque()
d.append(1)
d.append(2)
d.append(3)
print(len(d))
print(d[0],d[1],d[2])

d=deque(range(5))
d.popleft()
d.pop()

d=deque(maxlen=5)


d=deque([1,2,3,4,5])
d.extendleft([0])
d.extend([6,7,8])
print(d)


from collections import namedtuple
Animal = namedtuple('Animal','name age type')
perry=Animal(name='perry',age=31,type='cat')
print(perry)
print(perry.name)
print(perry[0])
print(perry._asdict())

my_list=['apple','banana','grapes','pear']
for counter,value in enumerate(my_list,1):
    print(counter,value)
counter_list=list(enumerate(my_list,1))
print(counter_list)


#print(dir(my_list))

print(type(''))
print(type([]))
print(type({}))
print(type(dict))

import inspect
#print(inspect.getmembers(str))

multiples=[i for i in range(10) if i%3 is 0]
print(multiples)

squard=[x**2 for x in range(10)]
print(squard)

mcase={'a':10,'b':34,'A':7,'Z':3}
mcase_frequency={
        k.lower():mcase.get(k.lower(),0)+mcase.get(k.upper(),0)
        for k in mcase.keys()
        }
print(mcase_frequency)

print({v:k for k,v in mcase.items()})

squard={x**2 for x in [1,2,3,1,-1]}
print(squard)

try:
    file = open('test.txt','rb')
except IOError as e:
    print('An IOError occurred.{}'.format(e.args[-1]))
    
## 处理多个异常
try:
    file = open('test.txt','rb')
except (IOError,EOFError) as e:
    print('An Error occurred.{}'.format(e.args[-1]))
    #raise e
    
try:
    file = open('test.txt','rb')
except IOError as e:
    print('An IOError occurred.{}'.format(e.args[-1]))
    #raise e
except EOFError as e:
    print('An EOFError occurred.{}'.format(e.args[-1]))
    #raise e
    
try:
    file = open('test.txt','rb')
except Exception:
    print('An Error occurred')
    #raise
    
    
    
try:
    file = open('test.txt','rb')
except Exception:
    print('An Error occurred')
    #raise
finally:
    print('This would always be printed')


try:
    print('I am sure no exception is going to occur!')
except Exception:
    print('exception')
else:
    #	这⾥的代码只会在try语句⾥没有触发异常时运⾏,
	 #	但是这⾥的异常将	*不会*	被捕获
     print('This would only run if no exception occurs. And an error would NOT be caught.')
finally:
    print('This would be printed in every case.')
    
add=lambda x,y:x+y

print(add(3,5))
a=[(1,2),(4,1),(9,10),(13,-3)]
a.sort(key=lambda x:x[1])
print(a)

list1=range(1,5)
list2=range(2,6)
data=list(zip(list1,list2))
data.sort()
list1,list2=map(lambda t:list(t),zip(*data))

import itertools
a_list=[[1,2],[3,4],[5,6]]
print(list(itertools.chain.from_iterable(a_list)))
print(list(itertools.chain(*a_list)))


for n in range(2,10):
    for x in range(2,n):
        if n%x ==0:
            print(n,' equals ',x,'*',n/x)
            break
    else:
        print(n,'is a pri')
'''       
from ctypes import *
adder=CDLL('adder.lib')
res_int=adder.add_int(4,5)
print(str(res_int))
'''
import time,threading
def loop():
    print('thread %s is running...'%threading.current_thread().name)
    n=0
    while n<5:
        n=n+1
        print('thread %s >>>%s'%(threading.current_thread().name,n))
        time.sleep(0.5)
    print('thread %s ended.'%threading.current_thread().name)
print('thread %s is running...'%threading.current_thread().name)
t=threading.Thread(target=loop,name='LoopThread')
t.start()
t.join()
print('thread %s ended.'%threading.current_thread().name)

def grep(pattern):
    print('searching for ',pattern)
    while True:
        line=(yield)
        if pattern in line:
            print(line)
search = grep('love')
next(search)
search.send('I love you')
search.send("Don't you love me?")
search.send("I love coroutine instead!")
search.close()

from functools import lru_cache
@lru_cache(maxsize=32)
def fib(n):
    if n<2:
        return n
    return fib(n-1)+fib(n-2)
print([fib(n) for n in range(10)])
fib.cache_clear()

###上下文管理器
class File(object):
    def __init__(self,file_name,method):
        self.file_obj=open(file_name,method)
    def __enter__(self):
        return self.file_obj
    def __exit__(self,type,value,traceback):
        self.file_obj.close()
with File('out.log','w') as opened_file:
    opened_file.write('hello')
    
from contextlib import contextmanager
@contextmanager
def open_file(name):
    f=open(name,'w')
    yield f
    f.close()
with open_file('out.log') as f:
    f.write('hi')

'''
import tensorflow as tf
import numpy as np
# 使用 NumPy 生成假数据(phony data), 总共 100 个点.
x_data = np.float32(np.random.rand(2, 100)) # 随机输入
y_data = np.dot([0.100, 0.200], x_data) + 0.300

# 构造一个线性模型
# 
b = tf.Variable(tf.zeros([1]))
W = tf.Variable(tf.random_uniform([1, 2], -1.0, 1.0))
y = tf.matmul(W, x_data) + b

# 最小化方差
loss = tf.reduce_mean(tf.square(y - y_data))
optimizer = tf.train.GradientDescentOptimizer(0.5)
train = optimizer.minimize(loss)

# 初始化变量
init = tf.global_variables_initializer()

# 启动图 (graph)
sess = tf.Session()
sess.run(init)

# 拟合平面
for step in range(0, 201):
    sess.run(train)
    if step % 20 == 0:
        print(step, sess.run(W), sess.run(b))

# 得到最佳拟合结果 W: [[0.100  0.200]], b: [0.300]    
'''

