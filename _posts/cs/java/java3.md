# 继承

`public class Dog extends Animal {}`
注意 private 不能继承

初始化顺序：
1. 父类属性
2. 父类构造方法
3. 子类属性
4. 子类构造方法

final:
fianl类，final方法，final变量：
类不能继承，方法在子类不能覆盖，变量不许修改（常量）。