# -*- coding: utf-8 -*-

class MyClass(object):
    __slots__=['name','age']
    def __init__(self,name,age):
        self.name = name
        self.age = age
num=1024*256
x=[MyClass(i,i) for i in range(num)]