---
layout: post
author: liuxin
title: 2-PDE的分类
date: 2017-08-11
category: PDE
tags: partial differential equations 
---

## 分类

结合物理问题，

* a single first-order PDE: 极少数
* a system of first-order PDEs：许多
* a single second-order PDE：一些
* a system of second-order PDEs：许多

PDE的分类就从**a single second-order PDE** 来解释比较容易。
所以在接下来的讨论中，最先分类的是 the **general quasilinear second-order non-homogenous PDE in two independent variables.**
也就是：$$ Af_{xx} + Bf_{xy} + Cf\_{yy} + Df\_x + Ef\_y + Ff = G $$

上面这个式子可以分三类，而分类的依据是(discriminant)判别式: $B^2 - 4AC$

![][image-1]

**Classification** 由 **Characteristics** 决定。
PDE 的 characteristics 就是 (n-1)-dimensional **hyper-surfaces** in n-dimensional **hyper-space** that have some very special features.

hyper 指的是不止三维，也就是 xyzt spaces, and curves and surfaces within those spaces. 

在二维空间里，characteristics 是在solution domain中的paths (一般来说是曲线)，而 information 就沿着这些 paths 传播。

如果一个PDE具有 real characteristics, 那么信息就会沿着这些 characteristics 传播。如果没有 real characteristics，那么就没有信息传播的 preferred paths. 

所以说， 有没有characteristics对PDE的解有着重要影响。

Connection is the process in which a physical property is propagated through space by the motion.

也就是说，motion of the medium occupying the space.

fluid flow 是一个常见的 convection 例子

The convection of **a property f** of a fluid particle in one dimension:

$$f\_t + u f\_x = 0$$

u 就是 convection velocity.

a moving fluid particle carries (convects) its mass, momentum, and energy with it as it moves through space. 

上式(convection equation)还可写为：

$$ f\_t + \frac{dx}{dt} f\_x = 0  $$

而很明显，$ f\_t + \frac{dx}{dt} f\_x = \frac{df}{dt}$，所以$\frac{df}{dt} = 0$, f 为常数。

一个方法就是回答以下问题：在solution domain D(x,y) 中能不能找到一个路径，这个路径经过点P，二阶导$f_{xx}$ $f_{xy}$ $f_{yy}$是 multivalued 或 discontinuous? 如果这些paths 存在，那么这些paths就是信息传播的paths，也就是characteristics! 

通过cramer’s法则可以得到无数的$f_{xx}$ $f_{xy}$ $f_{yy}$ 的值, 这样就没有物理意义了。所以我们把 determinant of the coefficient matrix 设为0


[image-1]:	http://wx3.sinaimg.cn/mw690/8db2c8cbly1fitx9punuyj20jd09l407.jpg