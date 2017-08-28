---
layout: post
author: liuxin
title: 3-FDM 
date: 2017-08-17
category: PDE
tags: elliptic PDE
---

The finite difference method is a numerical procedure which solves a PDE by **discretizing the continuous physical domain into a discrete finite difference grid**, approximating the individual exact partial derivatives in the PDE by algebraic **finite difference approximations (FDAs)**, substituting the FDAs into the PDE to obtain an algebraic **finite difference equation (FDE)**, and solving the resulting algebraic finite difference equations (FDEs) for the **dependent variable**. 以后我们都会用”FDE”来代替 “finite difference equation”. Some general characteristics of finite difference grids and finite difference approximations for equilibrium problems governed by elliptic PDEs are discussed in this section. 

## Finite Difference Grids 
下图是 the closed solution domainD(x, y) in xy space for a two-dimensional equilibrium problem. The solution domain must be covered by a two-dimensional  grid of lines, called the **finite difference grid**. The intersections of these **grid lines** are the **grid points** at which the finite difference solution to the partial differential equation is to be obtained.

![]()

The dependent variable at a grid point is denoted by the same subscript notation that is used to denote the grid points themselves.Thus,the function f(x, y) at grid point (i,j) is denoted by 


## Finite Difference Approximations 
Nowthat the finite difference grid has beenspecified, finite difference approximations (FDAs)of the individual exact partial derivatives appearingin the partial differential 
equation must be developed. This is accomplished by writing Taylor series for the dependentvariable at several neighboringgrid points using grid point (i,j) as the base point, andcombiningthese Taylorseries to solve for the desired partial derivatives. This is done in Chapter 5 for functions of one independent variable, where approximations of various types (i.e., forward, backward,and centered) having various orders of accuracy (i.e., first order, secondorder, etc.) are developedfor various derivatives (i.e., first derivative, secondderivative, etc.). Thoseresults are presentedin Table5.1. 
The forms of the finite difference approximationsof the individual exact partial derivatives in a PDEshould be governedby the physics being represented by the PDE.For elliptic PDEscontaining only secondderivatives, a characteristic analysis showsthat there are no preferred physical informative propagationpaths. Thus, the solution at all points dependson the solution at all other points, and the solution at all points influences the solution at all the other points. Consequently,centered-spacefinite difference approxima- tions should be used for the second-order spatial derivatives in the Laplaceequation and the Poisson equation. 
In the developmentof finite difference approximations,a distinction must be made betweenthe exact solution of a partial differential equation and the approximatesolution of the partial differential equation.For the remainderof this chapter, exact solutions will be denoted by an overbar over the symbolfor the dependentvariable [i.e., jT(x,y)](), and approximatesolutions will be denoted by the symbolfor the dependentvariable without an overbar[i.e., f(x, y)](). Thus, 

## Finite Difference Equations 



