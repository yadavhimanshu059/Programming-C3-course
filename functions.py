def f(a,b):
    s = a + 2*b
    return s

c = f(2,3.5)

d = "The value of the function is: " + str(c)
print(d)

# Define a function which takes variables "mean" and "SE" as arguments
# and returns the confidence interval as output

def confidence_interval(mean,SE):
    lower = mean - (2*SE)
    upper = mean + (2*SE)
    return [lower, upper]

print("The confidence interval for the mean 20 and standard error 2 is "+str(confidence_interval(mean=20,SE=2)))


def confidence_interval(mean,SE):
    lower = mean - (2*SE)
    upper = mean + (2*SE)
    output_statement = "The confidence interval is "+str([lower,upper])
    return output_statement

print(confidence_interval(10,1))

