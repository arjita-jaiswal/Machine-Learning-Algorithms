import pandas as pd
import numpy as np
f = pd.read_csv("breast-cancer_train.txt")
f = f.values
n,m = f.shape
c1 = []
c2 = []
l_11 = 0
l_12 = 0.2
l_21 = 0.8
l_22 = 0
print(f[0][0])
for i in range(n):
	if f[i][0]=="no-recurrence-events":
		c1.append(f[i])
	else:
		c2.append(f[i])
c1 = np.array(c1)
c2 = np.array(c2)
# print(c1)
print(c1.shape)
print(c2.shape)
c1n,c1m = c1.shape
c2n,c2m = c2.shape
# print(c1[0][0])

test = pd.read_csv("breast-cancer_test.txt")
test = test.values
tn,tm = test.shape


y1 = c1n/n
y2 = c2n/n

cc = 0
cx1 = 0
cx2 = 0
cx3 = 0
cx4 = 0
co1 =0
co2 = 0
co3 =0
co4 =0
count = 0
cy = 0
a = []
risk = []

for i in range(tn):
	row = test[i];
	p1 = 1;
	p2 = 1;
	for j in range(1,10):
		c1p = 0
		c2p = 0
		for k in range(1,c1n):
			if row[j]==c1[k][j]:
				# print(row[j],c1[k][j])
				c1p = c1p+1

		for k in range(1,c2n):
			if row[j]==c2[k][j]:
				c2p = c2p+1

		c1p=c1p/c1n
		c2p=c2p/c2n
		p1 = p1*c1p
		p2 = p2*c2p

	p1 = p1*y1
	p2 = p2*y2

	r1 = l_11*p1 + l_12*p2
	r2 = l_21*p1 + l_22*p2

	if p1>p2 and row[0]=="recurrence-events":
		cx1 = cx1+1
	elif p1<p2 and row[0]=="recurrence-events":
		cx2 = cx2 +1
	elif p2>p1 and row[0]=="no-recurrence-events":
		cx3 = cx2+1
	elif p2<p1 and row[0]== "no-recurrence-events":
		cx4 = cx4 +1
	# elif p1 == p2:
	# 	cy +=1

	if r1>r2 and row[0]=="recurrence-events":
		co1 = co1+1
	elif r1<r2 and row[0]=="recurrence-events":
		co2 = co2 +1
	elif r2>r1 and row[0]=="no-recurrence-events":
		co3 = co2+1
	elif r2<r1 and row[0]== "no-recurrence-events":
		co4 = co4 +1


	

	if r1>r2 and row[0]=="no-recurrence-events":
		cc = cc+1
	elif r2>r1 and row[0]=="recurrence-events":
		cc = cc+1
	elif r1 == r2:
		cc += 1

	if p1>p2 and row[0]=="no-recurrence-events":
		count = count+1
	elif p2>p1 and row[0]=="recurrence-events":
		count = count+1
	elif p1 == p2:
		count += 1
a.append([cx1,cx2])
a.append([cx4,cx3])	
risk.append([co1,co2])
risk.append([co4,co3])
accuracy = 100*cc/tn;
acc = 100* count/tn;
print("accuracy in bayes classification:" ,acc)
print(cc)
print(a)
print("accuracy by risk classification:" ,accuracy)
print(cc)
print(accuracy)
print(risk)
