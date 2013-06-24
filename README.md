DPFPSHelper
===========

English
===========
Testing FPS for Objective-C Methods

Russian
===========
Тестирование FPS для Objective-C методов.
Получение таких данных как: 
- Время выполнение метода (в секундах), 
- FPS (количество возможных вызовов в секунду), 
- Среднее FPS (среднее арифметическое между всеми FPS данного метода)

Простое использование:

Имеем метод:

-(void)myMethodWithParameter:(NSString*)string{
  ...
}

Для того, чтобы вызвать этот метод с изменением времени его выполнения, достаточно просто написать одну строчку

[DPFPSHelper getFPSMethod:@"myMethodWithParameter:" withTarget:self withObject:@"XXX"];

В лог выведется результат. Например:

Method 'myMethodWithParameter:' info: 
Time working: 0.008602 
FPS = 116.3 
avgFPS = 96.6
