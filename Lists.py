from itertools import repeat

a = [1,2,"a",3,4]
print(a)

# Operations

# query elemnts of the lists in certain position
print(a[1])
print(a[4])

def Range(a):
    output = max(a) - min(a)
    return output

a = [1,2,4,6,2,9]
range_a = Range(a)
print("The range is "+str(range_a))


mean_a = sum(a)/len(a)
print(mean_a)

#print(a[0:3])

a = list(range(1,101))
print(a[1])
print(list(a))

a[34] = "Book"
#print(a)


a.append(101)
a.append(102)

#print(a)


a = [1,2,3,4]
b = [5,6,7,8]
c = [9,10,11,12]

d = [a,b,c]
print(d)

print(d[1][1])

def max_val(x,y):
    return max([x,y])

def diff_val(x,y):
    return x-y

print(map(a,b))
print(diff_val(2,3))
print(list(map(diff_val,a,b)))

print(set(map(diff_val,a,b)))
















####################

