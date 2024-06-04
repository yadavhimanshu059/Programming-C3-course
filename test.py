import os
from io import open


a = 3.0
b = 2.0

c = a+b
d = a*b
e = a/b

print(c)
print(d)
print(e)
print(type(a))
print(type(e))

f = "dog"
g = f+str(a)
print(g)

statement = "The value of the variable e is "+str(e)
print(statement)

result = open("Results.txt","w")
result.write(statement+"\n"+statement+"\n")
result.close()


result = open("Results.txt","a")
result.write(statement+"\n"+statement+"\n")
result.close()

result = open("Results.txt","r")
for sumantran in result.readlines():
    dharnas = sumantran.split(" ")
    for dharna in dharnas:
        print(dharna) 














