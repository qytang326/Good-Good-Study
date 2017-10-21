#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Quanyin Tang'
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


#######单元测试
#######文档测试














input() #防止运行完自动退出
