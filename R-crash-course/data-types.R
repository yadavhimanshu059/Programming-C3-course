a <- 2
str(a)
a

a <- c(3,2,1)
a

a[2]
a[1]+a[2]

sum(a)
mean(a)
max(a)

a[-1]
a[2:3]

1:5
seq(from=1,to=5,by=1)

for(i in 1:5){
  if(i/2==1){
    print(i)
  }else if(i>3){
    print(i)
  }else{
    print(i^2)
  }
}

a <- 1:6
a+c(2,1)
a*c(2,1)

factorial <- function(n){
  fact <- prod(1:n)
  return(fact)
}

factorial(7)
