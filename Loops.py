from itertools import repeat


a = [2.4, 5, 6.7, 3, 9]

print("The 1th element is "+str(a[0]))
print("The 2th element is "+str(a[1]))
print("The 3th element is "+str(a[2]))
print("The 4th element is "+str(a[3]))
print("The 5th element is "+str(a[4]))

for x in a:
    print("The element is "+str(x))

ids = [1,2,3,4,5]

for idd in ids:
  print("The "+str(idd)+"th element is "+str(a[idd-1]))     

def concat(x,y):
    return str(x)+str(y)


id_names = list(map(concat,ids,["st","nd","rd"]+list(repeat("th",len(ids)-3))))
print(id_names)

for idd in ids:
  print("The "+str(id_names[idd-1])+" element is "+str(a[idd-1]))     

def summation(a):
    sum_value = 0
    for x in a:
        sum_value = sum_value + x
    return sum_value

sum_a = summation(a)
print(sum_a)


##def Length(a):
##    len_value = 0
##    for x in a:
##        len_value = len_value + 1
##    return len_value
##
##len_a = Length(a)
##print(len_a)
##
##a = [200,205,210,10,5000,240,300]
##
##def new_summation(a):
##    sum_value=0
##    for x in a:
##        if x==10 and x<1000:
##            sum_value = sum_value + x
##        else:
##            sum_value = sum_value
##    return sum_value
##        
##
##
