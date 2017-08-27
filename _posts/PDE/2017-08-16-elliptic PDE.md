---
layout: post
author: liuxin
title: 2-elliptic PDE 的基本特征 
date: 2017-08-16
category: PDE
tags: elliptic PDE
---

Elliptic PDEs govern **steady-state equilibrium problems**, which are **boundary-value problems** in closed domains. Consequently, elliptic PDEs are solved numerically by **relaxation methods**. 在[2-PDE的分类]()一节里讲到, problems governed by elliptic PDEs have no real characteristic paths. Physically, this means that there are no preferred paths of information propagation and that **the domain of dependence and the range of influence of every point is the entire solution domain**. The solution at every point depends on the solution at all other points, including the boundaries of the solution domain, and the solution at every point influences the solution at all other points. The solution is continuous through out the solution domain since there are no paths along which the derivatives of the solution maybe discontinuous. These general features of elliptic PDEs are illustrated in Figure9.4. 

Every exact partial derivative in a PDEshould be approximated in a manner consistent with the physical requirementsof the problem.For an elliptic PDE,the solution at every point in the solution domaindependson the solution at all the other points, in particular, the inmaediateneighboringpoints. Thus,the exactpartial derivatives in elliptic PDEsare approximatedby centered-difference approximations, as discussed in Section 9.3.2. 

