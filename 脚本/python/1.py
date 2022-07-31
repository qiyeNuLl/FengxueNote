class people:
    name = ''
    age = 0
    tel = 0
    def __init__(self,n,a,t):
        self.name = n
        self.age = a
        self.tel = t
    def __att(self):
        print("攻击力：2100")
    def active(self):
        self.__att()
        print("我是：%s,电话是%d"%(self.name,self.age))

class game:
    def __init__(self,g_n,g_t):
        self.game_name = g_n
        self.game_time = g_t
    def play(self):
        return '%s,这游戏我玩了%s,我太刀贼6'%(self.game_name,self.game_time)

class student(game,people):
    grade = ''
    def __init__(self,n,a,t,g,g_n,g_t):
        people.__init__(self,n,a,t)
        game.__init__(self,g_n,g_t)
        self.grade = g
    def active(self):
        print("我是：%s,电话是：%d,成绩是：%s"%(self.name,self.age,self.grade))
    def play(self):
         print('%s,这游戏我玩了%s,我太刀贼6'%(self.game_name,self.game_time))

x = student('cyber',17,2077,'S','NHW','1167h')
super(student,x).active()   #调用已被子类覆盖的父类方法
x.active()
x.play()

class Vector:
   def __init__(self, a, b):
      self.a = a
      self.b = b

   def __str__(self):
      return 'Vector (%d, %d)' % (self.a, self.b)

   def __sub__(self,other):
      return Vector(self.a - other.a, self.b - other.b)

v1 = Vector(2,10)
v2 = Vector(5,-2)
print (v1 - v2)
