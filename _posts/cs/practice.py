import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt 
import seaborn as sns

## 日常操作
df = pd.read_csv('name.csv')
df.head()
df.info()
df.describe()
sns.pairplot(df)   

## 


