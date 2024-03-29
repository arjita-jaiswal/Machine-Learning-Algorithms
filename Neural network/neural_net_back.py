# -*- coding: utf-8 -*-
"""neural_net_back.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1l_Z8O5bB6VbE4bsv36WLSAw3DPigx3u6
"""

import scipy.io
import numpy as np
import pandas as pd

mat = scipy.io.loadmat('ex4data1.mat')
#print(mat)
train_set=mat['X']
y=mat['y']
#print(x)
r,c=train_set.shape
print(y.shape)
train_set.shape

def sigmoid(n):
    return 1/(1+np.exp(-n))

def find_max_value_index(n):
    return np.argmax(n,axis=1)

W1=np.random.randn(26,c)*np.sqrt(1/c)
print(W1.shape)
print(W1[:5,:])

b1=np.random.randn(26,1)*np.sqrt(1/c)

W2=np.random.randn(10,26)*np.sqrt(1/26)
print(W2.shape)
print(W2)

b2=np.random.randn(10,1)*np.sqrt(1/26)

def forward_propagation(W1,b1,W2,b2,train_set):
    
    k=np.transpose(train_set)
    
    x2=np.dot(W1,k)
    #add bias
    x2=x2+b1
    
    a1=sigmoid(x2)
    r2,c2=a1.shape
#     print(a1.shape)
    x3=np.dot(W2,a1)
    x3=x3+b2
    a2=sigmoid(x3).T
    return [a2,a1]
# print(a2.shape)

new_X=np.zeros((r,10))
print(new_X.shape)
for i,j in zip(y,range(0,r)):
    new_X[j,i%10]=1
new_X

a2,a1=forward_propagation(W1,b1,W2,b2,train_set)
predict_final=find_max_value_index(a2)
c=0
for i,j in zip(predict_final,y):
    if i==0:
        i=10
    if i==j:
        c+=1

k=(c/r)*100
print(k)
alpha = 0.99
loss = 1/r*np.sum(np.sum((a2-new_X)**2,axis=1),axis=0)

#back propagation
def backpropagation(a2,new_X,a1,W2,W1,b1,b2):
    dz2=a2-new_X
    for i in range(0,10):
        if i==0:
            dw2=np.sum(dz2[:,i].T*a1,axis=1)
            db2=np.sum(dz2[:,i],axis=0)
        else:
            dw_temp=np.sum(dz2[:,i].T*a1,axis=1)
            db_temp=np.sum(dz2[:,1],axis=0)
            dw2=np.vstack((dw2,dw_temp))
            db2=np.vstack((db2,db_temp))
    W2=W2-alpha*1/r*dw2
    b2=b2-alpha*1/r*db2
    dz1=np.dot(W2.T,dz2.T)*((a1*(1-a1)))
    dw1=np.dot(dz1,train_set)
    db1=np.sum(dz1,axis=1)
#     print(dw1.shape,db1.shape)
    W1=W1-alpha*(1/r)*dw1
#     print(b1.shape)
#     print(r,db1.shape)
    db1=db1.reshape(26,1)
    b1=b1-alpha*(1/r)*db1
    b1=b1.reshape(26,1)
#     print(W1.shape,b1.shape)
    return [W1,b1,W2,b2]

for i in range(1000):
    
    a2,a1=forward_propagation(W1,b1,W2,b2,train_set)
    W1,b1,W2,b2=backpropagation(a2,new_X,a1,W2,W1,b1,b2)
predict_final=find_max_value_index(a2)
c=0
for i,j in zip(predict_final,y):
    if i==0:
        i=10
    if i==j:
        c+=1
print("accuracy of model")
print(c/r)