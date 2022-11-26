# Computer-Architecture-HW3. <br/> Выполнил Федоров Артём БПИ217. <br/> Вариант 35

## Арифметика с плавающей точкой <br/>

35. Разработать программу, определяющую корень уравнения x^4 − x^3 − 2.5 = 0 методом хорд с точностью от 0,001 до 0,00000001 в диапазоне [1;2]. Если диапазон некорректен, то подобрать корректный диапазон.

---- 
<br/>

## Структура репозитория:
* [C Files](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C_files) - содержит реализацию задачи на C

* [Assembler](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler) - содержит __не__ модифицированный код на Ассемблере

* [Assembler_mod](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod) - содержит модифицированный код на Ассемблере c комментариями к коду

__Заметка 1:__ В папке [_Assembler_](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler) содержится файл [_README.md_](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler/README.md) со списком переменных и их адресами в памяти (эквиваленты Си и Ассемблера)

__Заметка 2:__ В папке [_Assembler_mod_](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod) содержится файл [_README.md_](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/README.md) со списком изменений (модификаций) после преобразования из первичного Ассемблера в модифицированный.

***Примечание:*** Программа разрабатывалась сразу на 9 баллов, поэтому ссылка в каждом разделе будет на одинаковые файлы 

## Первоначальная компиляция:

### Создаем main.o и lib.o:

```
gcc main.s -c -o main.o
gcc lib.s -c -o lib.o
gcc main.o lib.o -o program.exe
```

Либо другие названия файлов, если вы собираетесь тестировать другую версию программы.

## Как устроена программа:
1. Если вы хотите протестировать консольный ввод или встроенный рандомный генератор, вам следует ввести команду:

```
./program.exe
```

На экране появится меню с опцией тестирования:
* Введите 1 для автоматической генерации данных, будет сгенерирована случайная точность от 0.00000001 до 0.001.
* Любое другое значение приведёт к ручному вводу данных через консоль <br/>


2. Если вы хотите протестировать файловый ввод одной строки, вам необходимо указать два аргумента командной строки - это будут имена файлов ввода и вывода:
```
./program.exe input.txt output.txt
```
input.txt - имя файла рядом с program.exe из которого будет прочитана одна строка.
output.txt - имя файла рядом с program.exe в который будет записан ответ = один инт.

3. Если же вы хотите протестировать работу программы с таймером на вашей строке, вам необходимо указать один аргумент командной строки - это будет точность, с которой будет выполнен task() 25млн раз:
```
./program.exe your_string
```

__Заметка 3:__ Значение точности (эпсилон) должно задаваться из диапозона от 0.00000001 до 0.001, поэтому все некорректные значения будут заменены на значение ближайшей границы (сопровождается специльным сообщением)

__Заметка 4:__ При работе с файлами программа проверяет наличие файла input, в то время как output файл может и не существовать, он будет пересоздан автоматически

# Отчёт 4 балла:
### 1. _Приведено решение задачи на Cи:_
__Написана программа на С, использующая 2 единицы компиляции (main.c lib.c):__
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C_files/main.c)
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C_files/lib.c)

<br/>

### 2. _Немодифицированная ассемблерная программа с комментариями:_
__Программа проассемблирована и откомпилирована без оптимизирующих опций:__
> * [main.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler/main.s)
> * [lib.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler/lib.s)

__Добавлены комментарии и удобный список, поясняющий эквивалентное представление переменных на С в Ассемблере.__
> [Список переменных](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler/README.md)

<br/>

### 3. _Модифицированная ассемблерная программа с комментариями:_
__Программа промодифицирована вручную:__
> [Список изменений](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/README.md)

__Модифицированная программа:__
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/main_mod.s)
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/lib_mod.s)

<br/>

### 4. _Тестирование:_
> [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Tests.md) <br/>
> По результатам нескольких тестов сравнения программ на Ассемблере и Модифицированном Ассемблере можно легко заметить, что программы отработали идетично и без ошибок, поэтому делаем вывод, что модификация программы проведена успешно.


---- 
<br/>


# Отчёт 5 баллов:
### 1. _Решение на Cи с передачей данных в функции через параметры + локальные переменные:_
В программе присутствуют три функции: int task(const char *str), int task_random(int length) и int task_cmd() с соответствующими параметрами. Используются локальные переменные.
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C_files/main.c)
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C_files/lib.c)

<br/>

### 2. _Ассемблерная программа с комментариями_:
Добавлены комментарии, описывающие передачу параметров и перенос возвращаемого результат <br/>
Была прокоментированна связь между параметрами языка Си и регистрами по правилам: <br/>
> 1)  eax/rax - для запоминания/аккумулирования данных
> 2)  rdi - первый аргумент в функции / edi - argc
> 3)  rsi/esi - второй аргумент в функции (esi - так как передаю "маленький" length, а не массив)
> 4)  rdx - третий аргумент в функции
> 5)  rcx - счётчик

> * [Список переменных в модифицированной программе](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/Readme.md)
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/main_mod.s)
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW2/blob/main/Assembler_mod/lib_mod.s)


---- 
<br/>

# Отчёт 6 баллов:
### 1. _Решение на ассемблере с рефакторингом программы за счет максимального использования регистров процессор:_ <br/>
Добавлены комментарии на эквивалентное использование регистров вместо переменных: <br/>
Были реализованы все увиденные возможные замены локальных переменных на регистры процессора:
*   Добавлен r12d вместо перемеенной-итератора i в for в main()
*   Остальные замены (epsilon, answer) привели к Segmentation fault (core dumped), поэтому было решено оставить как есть :)


> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/main_mod.s) <br/>
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/lib_mod.s) <br/>

<br/>

### 2. Тестирование:
> [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Tests.md) <br/>
> По результатам нескольких тестов сравнения программ на ассемблере и модифицированном ассемблере с регистрами можно легко заметить, что программы отработали идетично и без ошибок, поэтому делаем вывод, что эквивалентная замена переменных на регистры в программе была проведена успешно.

---- 
<br/>


# Отчёт 7 баллов:
### 1. _Решение на Cи с двумя единицами компиляции + использование аргументов коммандной строки для работы с файлами:_ <br/>
Две единиицы компиляции: main.c и lib.c:
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C%20Files/main.c) <br/>
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C%20Files/lib.c) <br/>

<br/>

### 2. _Решение на ассемблере с двумя единицами компиляции + использование аргументов коммандной строки для работы с файлами:_ <br/>
Использование аргументов командной строки:
* При вызове файла запуска с двумя аргументами, первый будет считаться файлом для чтения, второй для записи (файл для записи будет создаваться каждый раз заново).
* При вызове файла запуска с одним аргументом, он будет считаться значением эпсилон, с которым будет просчитан ответ по __Методу хорд__ для замера времени работы программы в цикле на 25млн итераций 

<br/>

### 3. _Текстовые файлы:_ (перед использованием скачайте их и поместите рядом с исполняемым файлом)
> * [input1.txt](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/input1.txt)
> * [input2.txt](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/input2.txt)
> * [input3.txt](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/input3.txt)
> * [input3.txt](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/input4.txt)

---- 
<br/>

# Отчёт 8 баллов:
### 1. _Решение на Cи c генератором случайного набора данных + интерфейс для расширения анализа командной строки + режим с таймером и циклом на 25млн итераций:_
> * [main.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C_files/main.c) <br/>
> * [lib.c](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/C_files/lib.c) <br/>

<br/>

### 2. _Модифицированное решение на ассемблере c генератором случайного набора данных + интерфейс для расширения анализа командной строки + режим с таймером и циклом на 25млн итераций:_
> * [main_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/main_mod.s) <br/>
> * [lib_mod.s](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Assembler_mod/lib_mod.s) <br/>

<br/>

### 5. _Тестирование:_
* [Ссылка](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Tests.md) <br/>
  "Рандомайзер" работает корректно, создавая значение эпсилон (точности) из заданного диапазона от 0.00000001 до 0.001

---- 
<br/>

# Отчёт 9 баллов
1) Первый тест: eps=0.00000001, 25млн итераций task(). <br/>
2) Второй тест: eps=0.0001, 25млн итераций task(). <br/>
>   [Ссылка на скриншоты (внизу)](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Tests.md) <br/>

| Программа  | Время работы первого теста  | Время работы второго теста   | Размер исполняемого файла | Суммарное количество строк | 
| :---: | :---: | :---: | :---: | :---: | 
| [C](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Optimized_Files/C)  | 3066 ms  | 2220 ms| 17.416 KiB  | 96 строк  | 
| [Ассемблер](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/Optimized_Files/Assembly)  | 3117 ms  | 2138 ms  | 17.36 KiB  | 433 строк  | 
| [Мод Ассемблер](https://github.com/ArtemFed/Computer-Architecture-HW3/blob/main/With_flags/Assembly_mod)  | 3015 ms  | 2138 ms  | 17.16 KiB  | 376 строк  | 
| [Флаг -O0](https://github.com/ArtemFed/Computer-Architecture-HW3/tree/main/With_flags/Compiled%20with%20-O0)  | 3014 ms  | 2127 ms  | 17.208 KiB  | 350 строк  | 
| [Флаг -O1](https://github.com/ArtemFed/Computer-Architecture-HW3/tree/main/With_flags/Compiled%20with%20-O1)  | 1747 ms  | 1191 ms  | 17.192 KiB  | 321 строк  | 
| [Флаг -O2](https://github.com/ArtemFed/Computer-Architecture-HW3/tree/main/With_flags/Compiled%20with%20-O2)  | 1194 ms  | 811 ms  | 17.24 KiB  | 322 строк  | 
| [Флаг -O3](https://github.com/ArtemFed/Computer-Architecture-HW3/tree/main/With_flags/Compiled%20with%20-O3)  | 1176 ms  | 788 ms  | 21.336 KiB  | 1211 строк  | 
| [Флаг -Ofast](https://github.com/ArtemFed/Computer-Architecture-HW3/tree/main/With_flags/Compiled%20with%20-Ofast)  | 1129 ms  | 767 ms  | 21.336 KiB  | 1211 строк  | 
| [Флаг -Os](https://github.com/ArtemFed/Computer-Architecture-HW3/tree/main/With_flags/Compiled%20with%20-Os)  | 1488 ms  | 944 ms  | 17.2 KiB  | 300 строк  | 

### Вывод по сравнению:
* Размер файлов практически не отличается, так как код рантайма одинаковый, он присутствует в каждом варианте запуска и занимает большую часть памяти
* Модифицированный Ассемблер занимает в 1.34 раз меньше памяти, чем -O3 и -Ofast
* Си, обычный ассемблер, флаг -О0 и флаг -Оs отработали идентично, так как не задействовали или минимально использовали регистры процессора
* Разница в скорости работы между -O0, -O1, -O2 и -O3 очень сильно заметна
* Вручную промоифицированный Ассемблер отработал в __1.5__ раз быстрее -O0, в __1.37__ -O1 и в __1.61__ -Os, __НО__ в __1.31__, __2.8__, __2.85__  раз медленнее -O1, -O2 и -O3 соответственно. 
