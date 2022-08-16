# -*- coding: utf-8 -*-
"""Fuzzy final.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/0B2PGrP1h1nsXT1dQLUljUkVjb1dWc015TkJ5aElqUWhuV09r
"""

import numpy as np
import pandas as pd
import collections
data=pd.read_csv('iris.data',header=None)
x,y=data.shape
lis=data.iloc[:,4].unique()
dict={}
count=0
for i in lis:
    if i not in dict.keys():
        dict[i]=count
        count+=1
for i in range(0,x):
    data.iloc[i,4]=dict[data.iloc[i,4]]
list=[i for i in range(5,31)]
acc=[]
for cl in list:
    print(cl)
    mem_matrix=np.random.random_sample((x,cl))
    mem_matrix=mem_matrix/np.sum(mem_matrix,axis=1).reshape(-1,1)
    m=np.random.rand(1)*np.random.randint(1,10)
    data1=data.to_numpy()
    cent=[]
    for i in range(0,cl):
        cent.append(np.sum(data1*((mem_matrix[:,i])**m).reshape(-1,1),axis=0)/np.sum((mem_matrix[:,i])**m))
    print(len(cent))
    l=np.zeros((x,1))
    for i in cent:
        l1=np.sqrt(np.sum((data1-i)**2,axis=1))
        l=np.hstack((l,l1.reshape(-1,1)))
    l=l[:,1:]
    new_mem_matrix=((1/l)**(1/(m-1)))/np.sum(((1/l)**(1/(m-1))),axis=0)
    l=np.argmin(new_mem_matrix,axis=1)
    for j in range(0,1000):
        cent=[]
        mem_matrix=new_mem_matrix
        for i in range(0,cl):
            cent.append(np.sum(data1*((mem_matrix[:,i])**m).reshape(-1,1),axis=0)/np.sum((mem_matrix[:,i])**m))
        cent
        l=np.zeros((x,1))
        for i in cent:
            l1=np.sqrt(np.sum((data1-i)**2,axis=1))
            l=np.hstack((l,l1.reshape(-1,1)))
        l=l[:,1:]
        new_mem_matrix=((1/l)**(1/(m-1)))/np.sum(((1/l)**(1/(m-1))),axis=0)
        l=np.argmin(new_mem_matrix,axis=1)
    top=collections.Counter(l)
    most_freq=top.most_common(1)
    x,y=data.shape
    print('Accuracy %:',most_freq[0][1]/x*100)
    acc.append((most_freq[0][1]/x)*100)

import matplotlib.pyplot as plt
plt.plot(list,acc)
plt.xlabel('cluster num') 
plt.ylabel('Accuracy')