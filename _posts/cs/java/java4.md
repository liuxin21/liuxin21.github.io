# 多态

## 多态：对象的多种形态
1. 引用多态：
父类的引用指向本类/子类的对象
`Animal obj1 = new Animal();`
`Animal obj2 = new Dog();`
2. 方法多态
`obj1.eat();`
`obj2.eat();`

## 引用类型转换

向上类型转换/自动类型提升:
`Dog d1 = new Dog();`
`Animal a1 = d1;`

向下类型转换/强制类型转换(需用instanceof):
`Dog d2 = a1;` //不行
`Dog d2 = (Dog)a1;` //可以
`Cat c1 = (Cat)a1;` // 不行，a1此时已经是DOG类型

通常写为：
```java
if (a1 instanceof Cat){
    Cat c1 = (Cat)a1;
}else{
    System.out.println("无法类型转换");
}
```

