a = [2.4, 5, 6.7, 3, 9]

for x in a:
    print("The element is "+str(x))

def summation(a):
    sum_value = 0
    for x in a:
        sum_value = sum_value + x
    return sum_value

sum_a = summation(a)
print(sum_a)


def Length(a):
    len_value = 0
    for x in a:
        len_value = len_value + 1
    return len_value

len_a = Length(a)
print(len_a)

a = [200,205,210,10,5000,240,300]

def new_summation(a):
    sum_value=0
    for x in a:
        if x==10 and x<1000:
            sum_value = sum_value + x
        else:
            sum_value = sum_value
    return sum_value
        

