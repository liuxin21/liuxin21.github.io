---
layout: post
author: liuxin
title: 2-变分法近似解法
date: 2017-08-02
category: 变分法
tags: calculus of variations 
---

![][image-1]

将微分方程乘以一个权函数（基函数），然后令加权积分为零

在弱形式中，我们将乘的这个函数称为检验函数(test function)，用V￼表示。

![][image-2]

第一项积分内y是二次微分而检验函数v是零次微分。如果使用分部积分，就可以将一次微分转移到检验函数v上，这样y的近似解函数只需是一阶线性的而不用是二次的了。通过分部积分可得：

![][image-3]

最后得到加权积分(弱形式)：

![][image-4]

## 注释

![][image-5]

[image-1]:	http://wx3.sinaimg.cn/mw690/8db2c8cbly1fiaw27g8gij20jb02rmxn.jpg
[image-2]:	http://wx4.sinaimg.cn/mw690/8db2c8cbgy1fiawxi3fzzj20kt050js0.jpg
[image-3]:	http://wx4.sinaimg.cn/mw690/8db2c8cbgy1fiawxjy0huj20kq02wwev.jpg
[image-4]:	http://wx3.sinaimg.cn/mw690/8db2c8cbgy1fiawxlswh9j20i101y0su.jpg
[image-5]:	http://wx1.sinaimg.cn/mw690/8db2c8cbly1fiaw28zmuej20iy05h74w.jpg