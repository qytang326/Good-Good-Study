# -*- coding: utf-8 -*-

#define a decorator
def a_new_decorator(a_func):
    def wrapTheFunction():
        print('do sth. before a_func')
        a_func()
        print('after')
    return wrapTheFunction


def a_function_requiring_decoration():
    print('need some decoration')
#Original Function
a_function_requiring_decoration()
#Decorate the Function
a_function_requiring_decoration=a_new_decorator(a_function_requiring_decoration)
#Execute the Function
a_function_requiring_decoration()

#simplify
@a_new_decorator
def a_function_requiring_decoration():
    """Hey you! Decorate me!"""
    print('a function needs decoration')

#Problem
print(a_function_requiring_decoration.__name__) ###Output:wrapTheFunction

print('---'*10 + 'Modify' +'---'*10)
#modify the name
from functools import wraps
def an_update_decorator(a_func):
    @wraps(a_func)
    ### @wraps接收一个函数进行装饰，并加入了复制函数名称、注释、参数等功能，让我们访问函数装饰前的属性
    def wrapTheFunction():
        print('Before')
        a_func()
        print('after')
    return wrapTheFunction

@an_update_decorator
def a_function_needs_decoration():
    """Decorate me"""
    print('need a decoration')

print(a_function_needs_decoration.__name__) #Output:a_function_needs_decoration

print('---'*10 + 'Appliction' +'---'*10)
###############################---Application-------------########
   ######### 蓝本规范 #########
from functools import wraps
def decorator_name(f):
    @wraps(f)
    def decorated(*args,**kwargs):
        if not can_run:
            return 'Not Run'
        return f(*args,**kwargs)
    return decorated

@decorator_name
def func():
    return('Running')
can_run=True
print(func())
can_run=False
print(func())
print('')
####### 授权#####
from functools import wraps
def requires_auth(f):
    @wraps(f)
    def decorated(*args,**kwargs):
        auth = request.authorization
        if not auth or not check_auth(auth.username,auth.password):
            authenticate()
        return f(*args,**kwargs)
    return decorated

#### 日志 ######
from functools import wraps
def logit(func):
    @wraps(func)
    def with_logging(*args,**kwargs):
        print(func.__name__+'was called')
        return func(*args,**kwargs)
    return with_logging
@logit
def addition_func(x):
    """Do some math"""
    return x+x,x**2
result = addition_func(4)
print(result)

print('---'*10 + 'Decorator With Args' +'---'*10),print('')
###############################---带参数的装饰器-------------########
####在函数中嵌入装饰器####
from functools import wraps
def logit(logfile='out.log'):
    def logging_decorator(func):
        @wraps(func)
        def wrapped_function(*args,**kwargs):
            log_string=func.__name__ + ' was called'
            print(log_string)
            #打开logfile并写入内容
            with open(logfile,'a') as opened_file:
                #现在将日志打到指定的logfile
                opened_file.write(log_string + '\n')
            return func(*args,**kwargs)
        return wrapped_function
    return logging_decorator
@logit()
def myfunc1():
    pass

myfunc1()   #Output：myfunc1 was called,并创建一个out.log的文件

@logit(logfile='func2.log')
def myfunc2():
    pass

myfunc2()   #Output：myfunc2 was called,并创建一个func2.log的文件
 

print('---'*10 + '装饰器类' +'---'*10),print('')
###############################---装饰器类-------------########
from functools  import wraps
class logit(object):
    def __init__(self,logfile='out.log'):
        self.logfile=logfile
    def __call__(self,func):
        @wraps(func)
        def wrapped_function(*args,**kwargs):
            log_string=func.__name__ + ' was called'
            print(log_string)
            with open(self.logfile,'a') as opened_file:
                opened_file.write(log_string+'\n')
                self.notify() #发送通知
            return func(*args,**kwargs)
        return wrapped_function
    def notify(self):
        pass
@logit()
def myfunc1():
    pass
##创建子类，添加email功能
class email_logit(logit):
    def __init__(self,email='admin@project.com',*args,**keargs):
        self.email=email
        super(logit,self).__init__(*args,**kwargs)
    def notify(self):
        pass

myfunc1()
            

