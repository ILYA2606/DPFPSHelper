DPFPSHelper
===========

English
===========
Testing FPS for Objective-C Methods. 
Getting such data as:
- Time of execution (in seconds)
- FPS (number of possible calls per second)
- Average FPS (average mean of all the FPS of this method)

Easy to use:

Have a method

- (void) myMethodWithParameter: (NSString *) string {
  ... 
}

To call this method with the calculate of time of its execution, it is enough to simply write a single line

[DPFPSHelper getFPSMethod: @ "myMethodWithParameter:" withTarget: self withObject: @ "XXX"];

In the log displays the results. For example:

Method 'myMethodWithParameter:' info: 
Time working: 0.008602; 
FPS = 116.3; 
avgFPS = 96.6

Russian
===========
Тестирование FPS для Objective-C методов.
Получение таких данных как: 

- Время выполнение метода (в секундах), 
- FPS (количество возможных вызовов в секунду), 
- Среднее FPS (среднее арифметическое между всеми FPS данного метода)

Простое использование:

Имеем метод

-(void)myMethodWithParameter:(NSString*)string{
  ...
}

Для того, чтобы вызвать этот метод с измерением времени его выполнения, достаточно просто написать одну строчку

[DPFPSHelper getFPSMethod:@"myMethodWithParameter:" withTarget:self withObject:@"XXX"];

В лог выведется результат. Например:

Method 'myMethodWithParameter:' info: 

Time working: 0.008602; 
FPS = 116.3; 
avgFPS = 96.6

