#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Quanyin Tang'
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


































input() #防止运行完自动退出
