# Statistical data analysis workshop (organized by YUVA Germany)
# Day 1 - R introduction and graph plotting

######################################

### 0. Getting ready

# Try simple arithmetic operations

2+1      # Press CTRL + ENTER to see the output in the console
2*4
20/10
25/4
25%/%4
3^2       # Exponent


# Why there is "[1]" in front of output everytime

# 1. Vectors

x <- 2
x
# A sequence of data elements of the same variable type
# Consider a sequence of integers from 1 to 4
x <- c(1,2,3,4)                 # c() is a function for concatenation
x
x[1]
x[3]
x[5] <- 2
x
x[c(1,5)]

y <- c("a","b")
y
y[2]

y[3] <- 2
y
y[4]

z <- c(TRUE,FALSE,TRUE)
z
z[2]

# Vector is the fundamental data type in R
# All scalars are considered one-element vectors

x <- 2
x
x[1]
y <- "a"
y

str(x)
str(y)
typeof(y)
typeof(x)

x <- 1:2
typeof(x)

# 1.1 Simple operations on vectors

# 1.1.1 Adding and deleting vector elements
#need to 'reassign' the vector for adding/deleting elements
#the size is determined at its creation

x <- c(88,5,12,13)
x
x[1]
x[2]
x[1:3] # Give me elements of the vector at positions 1,.,3
x[c(1,3)]

# Combine two vectors
x <- c(1,6,5)
x
y <- 3:7
y
z <- c(x,y)
z

c(x,65,y)
c(x,65,y,1009)

#1.1.2 obtaining the length of a vector

x <- c(1,2,4)
length(x)

#1.1.3 declarations
#no prior declaration needed to use a variable

z <- 3

#if one needs to access specific element of a 'new' vector then
#R must be told beforehand that the variable is a vector

W[1] <- 3  #will not work

W <- c(3, 2) # will work

#or

W <- vector(length = 2)
W[1] <- 3
W[2] <- 2
W

#1.1.4 vector arithmetic and logical operations

x <- c(1,2,4)
x + c(5,0,-1)
x * c(5,0,-1)
x / c(5,0,-1)

x + c(5,0,-1,1) # You get an output 6, 2, 3, 2 Why? What is happening?

# R duplicates the first value of vector x in the 4th position

x + c(5,0,-1,1,1) # Now first and second element of x are duplicated

c(x,x[1:2])+c(5,0,-1,1,1)

#1.1.5 vector indexing

y <- c(1.2,3.9,0.4,0.12)
y

y[c(1,3)]
y[2:3]
v <- 3:4
v
y[v]

x <- c(4,2,17,5)
x[c(1,1,1)]
y <- x[c(1,1,3)]
y

#-ve subscript mean that we want to exclude the given elements

z <- c(5,12,13)
z[-1]
z[-1:-2]

4:1
1:4
-1:-4


# a:b gives a sequence that starts with a and increases/decreases by 1
1.1:6
6:1.1

#1.1.6: seq()

#a more general operator than :
seq(from=12,to=30,by=3)
seq(from=1,to=30,by=1)
1:30
seq(from=1,to=100,by=10)

seq(from=1.1,to=2,length=10)

#1.1.7: rep()
x <- rep(8,4)
x

rep(c(5,12,13), 3)
rep(c(5,12,13), each=3)
k<-rep(c(5,12,13), each=3)
k
str(k)


#1.1.8: NA and NULL values
#NA: missing data
#NULL: value does not exist

x <- c(88,NA,12,168,13)
x
mean(x)
mean(x, na.rm=T)
x <- c(88,NULL,12,168,13)
mean(x)

u <- NULL
length(u)

u <- NA
length(u)

# 1.2 Analysis using vectors
# 1.2.1 filtering

#subset
(x <- c(6,1:3,NA,12))
x
x[x>5]
subset(x,x>5)

#which
#to find position rather than the number itself
z <- c(5,2,-3,8)
which(z < 6)
z[which(z < 6)]
which(z*z<8)

#ifelse()

x <- 1:10
y <- ifelse(x ==4,NA,x)
y
y <- ifelse(x %% 2 == 0,5,12) 
y
#%% is the modulus operator: gives the remainder
#of a division
x %% 2 
(x %% 2 == 0)
y
z <- ifelse(x %% 2 == 0,'even','odd')
z

#2.2 Mean, SDs
y <- c(34,67,209,55,69,100)
mean(y)
sd(y)
var(y)

#2.3 Hist, Plots
y
hist(y)
plot(y)
points(y)
barplot(y)



#Exercises

#(1) Manually create a vector with 10 numbers
#     (a) Get all the values that are greater than 5
#     (b) Get all the values that are odd 
#     (provide two ways to do this)
#     (c) Get the index of all the odd values
#     (d) Check if all values are even
#     (e) Check if any value is even

#(2) Manually create a vector with 5 numbers
#     (a) Now create another vector where the 1st element is 1 more than the length of the above vector
#         and has a length of 10. The max value of this new vector should be 20
#     (b) What is the difference between the length of the two vectors?



# 1.3 Factors

x <- c(5,12,13,12)
x
xf <- factor(x)
xf
str(xf)

xf +x

plot(xf)
plot(x)

###############################################################

# 2. Matrix
x <- matrix(1:4,nrow=2,ncol = 2)
x[1,]
x[,1]
x[2,2]
y <- matrix(5:6,nrow=2,ncol = 1)
y
# 2.1 Matrix operations
# Matrix multiplication
x%*%y
x*y
# Multiplication by a scalar
x*2
x*y[2]

#Element wise multiplication
x[,2]*y

# Matrix transpose
t(x)

# Addition
x+y
x[,2]+y
y <- matrix(0:3,nrow = 2,ncol = 2)
y
x+y

# Substraction
x-y

# Matrix cross product
crossprod(x,y)
t(x)%*%y

crossprod(x,y)==t(x)%*%y

# Determinant

det(x)
#########################################################
# 3. Data frames
# Data-frames are collection of equal-length vectors in two dimesnions
# A data frame is like a matrix, but here each column may have 
#different variable type.
#Technically, a data frame is a list, with the components of that list being
#equal-length vectors

#3.1 Representing and accessing data frames
kids <- c("Manish", "Abhay")
ages <- c(12, 10)
d <- data.frame(kids, ages)
d
str(d)

d <- data.frame(kids, ages, stringsAsFactors = FALSE)
d
str(d)

kids <- c("Manish")
ages <- c(12, 10)
df <- data.frame(kids, ages)
df

#Accessing values

d
d[1]
d[2]
d[[1]]
d[[2]]
d$kids
d$ages
d[,1]

studentID <- c(101:110)
marks <- c(40,12,34,56,78,90,87,56,89,60)
results <- data.frame(studentID,marks)
results
# Average marks in class
mean(results$marks)

# How many students failed, marks<40
which(results$marks<40)
length(which(results$marks<40))
results$marks<40
any(results$marks<40)  # Is "any" element of the vector TRUE
all(results$marks<40) # Are all values of the vector true

# What are IDs of students who failed?
which(results$marks<40)
results$studentID[which(results$marks<40)]

# Filtering
# Only show results of passed students
subset(results,marks>=40)
results[which(results$marks>=40),]

# Average marks of students who passed the exam
subset(results,marks>=40)$marks
mean(subset(results,marks>=40)$marks)

#3.2: Reading from external files as data frames 

#getwd() tells you where you are

new.d <- read.table(file = "data-frame-file.dat", header = TRUE, sep="\t")
new.d
str(new.d)
new.d$Student <- as.character(new.d$Student)
str(new.d)
new.d <- read.table(file = "data-frame-file.dat", header = TRUE, stringsAsFactors = FALSE)
str(new.d)

# 3.2.1 'header' attribute
new.d <- read.table(file = "data-frame-file.dat", header = TRUE, sep="\t")
new.d
new.d <- read.table(file = "data-frame-file.dat", sep="\t")
new.d
new.d <- new.d[-c(1),]
new.d
#I can add column names manually
colnames(new.d) <- c("Student","Exam1","Exam2", "Age")
new.d

# 3.2.2 'sep' attribute
new.d <- read.table(file = "data-frame-file.dat", header = TRUE, sep=" ")
new.d

# 3.2.3 Accessing columns and rows
new.d <- read.table(file = "data-frame-file.dat", header = TRUE, sep="\t")
new.d
# Info
head(new.d)
dim(new.d)

new.d$Student
new.d$Exam1

# Columns
new.d[,c(1,2)]
new.d[,c(1,3)]
# Rows
new.d[c(1,2),]
new.d[c(1,3),]

# 3.3 Removing rows and columns
new.d
new.d[-c(1),]
new.new.d <- new.d[-c(1),]
new.new.d

new.d[,-c(2)]
new.new.d <- new.d[,-c(2)]
new.new.d

# 3.4 complete.cases function
new.d <- read.table(file = "data-frame-file.dat", header = TRUE, sep="\t")
new.d

new.d[complete.cases(new.d),]
new.d[!complete.cases(new.d),]

# if data has NA values i.e., missing values
new.d$Exam1[2] <- NA
new.d
new.d[complete.cases(new.d),]
new.d[!complete.cases(new.d),]

new.d <- new.d[complete.cases(new.d),]

# 3.5 Operations on rows and columns
new.d <- read.table(file = "data-frame-file.dat", header = TRUE, sep="\t")
new.d

new.d$Exam1+new.d$Exam2
new.d$Exam1-new.d$Exam2

mean(Exam1)
mean(new.d$Exam1)
sd(new.d$Exam1)
max(new.d$Exam1)
min(new.d$Exam1)

is.numeric(new.d$Student)
is.numeric(new.d$Exam1)

# 3.6: Adding variables i.e., columns to the dataframes
new.d

# You can add a vector of same length
totalMarks <- c(198,132,199)
new.d$total <- totalMarks
new.d

totalMarks <- new.d$Exam1+new.d$Exam2
totalMarks
new.d$total <- totalMarks
new.d
new.d$total <- new.d$Exam1+new.d$Exam2

# 3.7 ifelse function
grade <- c("A","B","C")
new.d$grade <- grade
new.d

new.d$grade <- ifelse(new.d$Exam1>80,"A","B")
new.d

new.d$grade <- ifelse(new.d$Exam1>80,ifelse(new.d$Exam2>80,"A","B"),"B")
new.d

#Exercises

#(1) Create a data frame as shown below

# Stimuli_id cond rt
# 1           a   300   
# 1           b   420
# 2           a   330
# 2           b   412
# 3           a   250
# 3           b   523

# (2) Find the mean RT for each condition i.e., condition 'a' and condition 'b'
# Your output should look like:
# cond  mean.rt
#   a   293.33
#   b   451.66

# (3) Draw a barplot showing mean RT for each condition

# Load data from file 'dep_length.dat'
# (4) Compute the following
# (a) Number of variables and observations in the data
# (b) Number of observations having length=0
# (c) Overall Mean length, mean length for each direction
# (d) Draw histogram for lengths
# (e) Draw barplot showing mean length for each direction
# (f) Add a column "type" in the dataframe which has 
#     value "adjacent" if length is O, else "apart"
# (g) Which of the directions has more number of higher lengths i.e., length>7 

#############################################

# 4. Data frame manipulation

# 4.1 Combining multiple data frames

df1 <- read.table(file = "data-frame-file.dat", header = TRUE, sep="\t")
df1
df2 <- read.table(file = "data-frame-file.dat", header = TRUE, sep="\t")
df2
# rbind function 
df <- rbind(df1,df2)
df

# cbind
cbind(df1,df2)

examdiff <- df1$Exam1 - df2$Exam2
df1 <- cbind(df1, examdiff)
df1
# merge function
df2 <- df2[,c(1,4)]
df1 <- df1[,c(1,2,3)]
df2
df1
merge(df1,df2)

df1$Age <- df2$Age[match(df1$Student, df2$Student)]
df1
###################################

# 4.2 "dplyr" package

# COVID-19 data
# Reference: https://data.europa.eu/euodp/en/data/dataset/covid-19-coronavirus-data
# Description: daywise cases, deaths per country, total population

covid <- read.table("COVID19data.csv", header = TRUE,sep=",")
covid <- covid[,-1]
head(covid)
dim(covid)

library(dplyr)

# 4.2.1 select function

# Suppose I only want number of cases on every date, and want to throw rest columns
# Syntax is select(dataframeName,selectedColumnNames)
# Alternative syntax: dataframeName %>% select(selectedColumnNames)

d.cases <- select(covid,cases)
head(d.cases)
d.cases <- select(covid, dateRep, cases)
head(d.cases)
# Select date, country, cases
d.cases <- select(covid, dateRep, country, cases)
head(d.cases)
# Alternatively
d.cases <- covid %>% select(dateRep,country,cases)
head(d.cases)

# 4.2.2 filter function

# Suppose I want to select only those rows 
# where number of cases in day is greater than 2000
# If you can recall, you can do this using subset() function 
highRate <- subset(covid, cases>2000)
head(highRate)
# You can also do this using filter() function from "dplyr"
highRate <- filter(covid, cases>2000)
head(highRate)
#Alternatively
highRate <- covid %>% filter(cases>2000)
head(highRate)

#Show columns dateRep, country and cases only, when no. of cases>2000
#Apply both filter and select function
highRate <- covid %>% filter(cases>2000) %>% select(dateRep,country,cases)
head(highRate)

#List all the countries that had cases>50000 on any day 
#in the last month
str(covid)
highRate <- covid %>% filter(cases>50000&month==11)
# & means 'AND'
# | means 'OR'
# Try: TRUE & FALSE, TRUE | FALSE
head(highRate)
head(highRate$country)
unique(highRate$country)

# 4.2.3 summarise function

# Now suppose I want to calculate total number of cases in each country

totalCases <- covid %>% group_by(country) %>% summarise(total.cases=sum(cases))
head(totalCases)
totalCases <- as.data.frame(totalCases)
totalCases

# Total number of cases per month in each country
totalCases <- covid %>% group_by(country,year,month) %>% summarise(total.cases=sum(cases))
totalCases <- as.data.frame(totalCases)
head(totalCases)

# 4.2.4 mutate function

# I want to add the total.cases column in the same covid dataframe

totalCases <-  covid %>% group_by(country) %>% mutate(total.cases=sum(cases))
totalCases <- as.data.frame(totalCases)
head(totalCases)

# Can you create a dataframe sorted by total number of cases per country
# I want columns - country, total.cases, total.deaths, populaton

covid.table <- covid %>% 
  group_by(country,popData2019) %>% 
  summarise(Cases=sum(cases),Deaths=sum(deaths)) %>%
  select(country,Cases,Deaths,popData2019)
covid.table <- as.data.frame(covid.table)
head(covid.table)
# Why I did not use mutate here? Think about it!

sort(covid.table$Cases)
sort(covid.table$Cases,decreasing = TRUE) # Returns values
order(covid.table$Cases,decreasing = TRUE) # Returns indices

covid.table[order(covid.table$Cases,decreasing = TRUE),]
# dataframe[rowIDs,]


# What is number of observations for each country in the data

covid %>%
  group_by(country) %>%
  summarise(count=n())

# More summaries

covid %>%
  group_by(country) %>%
  summarise(count=n(),
            total.cases=sum(cases),
            mean.cases=mean(cases),
            max.cases=max(cases),
            min.cases=min(cases))

#4.3 "Reshape2" package
library(reshape2) #long-to-wide, wide-to-long

student.id <- c("s1", "s2", "s3", "s4", "s5", "s6")
m1 <- c(12, 10, 45, 22, 30, 27)
m2 <- c(55, 60, 72, 89, 45, 55)

data.wide <- data.frame(student.id, m1, m2, stringsAsFactors = FALSE)
data.wide 
#this is the wide format, each variable is a column

#this is the long format, variables are attributes with values 
#(in another column)
#useful of a wide variety of R functions, e.g. ggplot, lm
melt(data.wide)
melt(data.wide, id = "student.id")
data.long <- melt(data.wide, id = "student.id")
head(data.long)

#Coverting long to wide
dcast(data.long,student.id~variable)
#OR
reshape(data.long,idvar = "student.id",timevar="variable", direction = "wide")

#Links
#http://seananderson.ca/2014/09/13/dplyr-intro.html
#http://seananderson.ca/2013/10/19/reshape.html
#-----------------------------------------------------------

#######################################################

# 6. Graph plotting
library(ggplot2)

#A graph is made up of layers.
#Visual elements are known as geoms ('geometric objects')
#for example: bar, line, etc.
#Geoms have aesthetic properties (aes()) that control
#the appearance of the graph elements (or the graph as a whole)
#for example: color, size, style

#geoms: geom_bar(), geom_point(), geom_line(), geom_smooth()
#       geom_histogram(), geom_boxplot(), geom_text(), etc.

data <- read.table("Howell.csv", header = T,sep=",")
data <- data[,-1]
head(data)

data$Gender <- ifelse(data$male==1,"Male","Female")
head(data)
#OR
data <- data %>% mutate(Gender=ifelse(male==1,"Male","Female"))
head(data)

# 6.1 Scatter plots

# Age on X axis and Weight on Y axis
base.plot<-ggplot(data=data, aes(x=age, y=weight))
base.plot
p <- base.plot +ggtitle("Relationship between age and weight")
p

#plot the points

p + geom_point()

p + geom_point(color="Blue")
p + geom_point(color="red")
?geom_point
p + geom_point(color="blue",shape=6)
p + geom_point(color="blue",size=1.5)

# Group datapoints by values of a third variable

p+geom_point(aes(colour=Gender))

p <- p+geom_point(aes(colour=Gender))

p+scale_color_manual(values=c("#4682b4","#e9967a"))
p+scale_color_manual(values=c("#4682b4","#e9967a"))+theme_bw()
p+scale_color_manual(values=c("#4682b4","#e9967a"))+theme_bw()+
  xlab("Age (in years)")+ylab("Weight (in Kilograms)")

ggplot(data=data,aes(x=age,y=weight))+
  ggtitle("Relationship between age and weight")+
  geom_point(aes(colour=Gender))+
  scale_color_manual(values=c("#4682b4","#e9967a"))+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")

ggsave("Age_vs_weight_scatterplot.pdf",height=3,width=5)

ggplot(data=data,aes(x=age,y=weight,colour=Gender))+
  ggtitle("Relationship between age and weight")+
  geom_point()+
  scale_color_manual(values=c("#4682b4","#e9967a"))+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")

ggplot(data=data,aes(x=age,y=weight,colour=Gender))+
  ggtitle("Relationship between age and weight")+
  geom_point()+
  scale_color_manual(values=c("#4682b4","#e9967a"))+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")+
  theme(legend.title = element_blank())

ggplot(data=data,aes(x=age,y=weight,colour=Gender))+
  ggtitle("Relationship between age and weight")+
  geom_point()+
  scale_color_manual(values=c("#4682b4","#e9967a"))+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")+
  theme(legend.title = element_blank(),
        legend.position = "top")


ggplot(data=data,aes(x=age,y=weight,colour=Gender))+
  ggtitle("Relationship between age and weight")+
  geom_point()+
  scale_color_manual(values=c("#4682b4","#e9967a"))+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")+
  theme(legend.title = element_blank(),
        legend.position = c(0.8,0.2))

# Facet_wrap()
# Show and Male and Female data separately side by side

p <- ggplot(data=data,aes(x=age,y=weight))+
  ggtitle("Relationship between age and weight")+
  geom_point()+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")
p

p + facet_wrap(~Gender)

p + facet_wrap(~Gender,nrow=2)
p + facet_wrap(~Gender,ncol=2)
p + facet_wrap(~Gender,scales = "free")

# 6.2 regression line
#the line summarizes the relationship between age and weight
#the shaded area is the 95% confidence interval around the line
p
p+geom_smooth()
p+geom_smooth(size=1.8)
p+geom_smooth(size=1.8,method="lm")

p+geom_smooth(size=1.8,aes(colour=Gender))

ggplot(data=data,aes(x=age,y=weight,colour=Gender))+
  ggtitle("Relationship between age and weight")+
  geom_point()+
  geom_smooth(size=1.5)+
  scale_color_manual(values=c("#4682b4","#e9967a"))+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")+
  theme(legend.title = element_blank(),
        legend.position = c(0.8,0.2))

ggsave("Age_vs_Weight_regression.pdf",width=5,height=3)

ggplot(data=data,aes(x=age,y=weight,colour=Gender))+
  ggtitle("Relationship between age and weight")+
  geom_point()+
  geom_smooth(size=1.5,method="lm")+
  scale_color_manual(values=c("#4682b4","#e9967a"))+
  theme_bw()+
  xlab("Age (in years)")+
  ylab("Weight (in Kilograms)")+
  theme(legend.title = element_blank(),
        legend.position = c(0.8,0.2))


# 6.3 Histograms

head(data)

p <- ggplot(data,aes(x=weight))+theme_bw()+
  ggtitle("Distribution of body weight in !Kung San population")
p

p+geom_histogram()
p+geom_histogram(bins=100)
p+geom_histogram(bins=100,colour="black",fill="white")
p+geom_histogram(bins=100,colour="blue",fill="blue")

ggplot(data,aes(x=height))+theme_bw()+
  geom_histogram(bins=50,colour="black",fill="white")

ggplot(data,aes(x=height))+theme_bw()+
  geom_histogram(bins=50,colour="black",fill="white")+
  facet_wrap(~Gender)

ggplot(data,aes(x=weight))+theme_bw()+
  geom_histogram(bins=50,colour="black",fill="white")+
  facet_wrap(~Gender)

ggplot(data,aes(x=weight))+theme_bw()+
  geom_histogram(bins=50,colour="black",fill="white")+
  facet_wrap(~Gender)+
  ylab("")+
  theme(axis.text.y = element_blank())

# 6.4 Density plots

p <- ggplot(data, aes(x=weight))
p
p+geom_density()
p+geom_density(colour="blue",size=1.5)

p+geom_density(aes(colour=Gender),size=1.5)

p+geom_density(aes(colour=Gender,
                   fill=Gender),
               size=1.5)

p+geom_density(aes(colour=Gender,
                   fill=Gender),
               size=1.5,
               alpha=0.2)

p+geom_density(aes(colour=Gender,
                   fill=Gender),
               size=1.5,
               alpha=0.2)+
  theme_bw()+
  theme(legend.title = element_blank())+
  xlab("weight (in Kilograms)")

ggsave("Weight_density_plot.pdf",width=5,height=4)

# 6.5 boxplot

# median at the centre
# sorrounded by a box; top/bottom: Upper/Lower quartile
# this covers the middle 50% of the data
# the vertical bar above and below (and the points) show 
# the top and bottom 25% respectively
# the bars specifically: upper whisker = 3rd quartile + 1.5*IQR
# lower whisker = 1st quartile - 1.5*IQR

p <- ggplot(data, aes(x=Gender, y=weight))
p + geom_boxplot()

# 6.6 Error bars

data.m <- data %>% group_by(Gender) %>% summarize(avgHeight=mean(height),SDheight=sd(height))
data.m <- as.data.frame(data.m)
data.m

p <- ggplot(data=data.m,aes(x=Gender,y=avgHeight))+theme_bw()
p + geom_point(size=2)

# I want to show the distribution of heights using
# an error bar that goes from one SD below average to one SD higher 

p + geom_point(size=2)+
  geom_errorbar(aes(ymin=avgHeight-SDheight,ymax=avgHeight+SDheight))

# 6.7 Line plots

# Could be more useful than scatter plots sometimes

data.m <- data %>% 
  group_by(Gender,age) %>% 
  summarize(Weight=mean(weight),upper.w=quantile(weight)[4],lower.w=quantile(weight)[2])
data.m <- as.data.frame(data.m)
head(data.m)

# Line plot between Age and weight

p <- ggplot(data.m,aes(x=age,y=Weight,group=Gender,color=Gender))+theme_bw()  
p
p + geom_line(size=1.1)

p + geom_line() + geom_point(size=1.5)

ggplot(data.m,aes(x=age,y=Weight,group=Gender,color=Gender))+
  theme_bw()+
  geom_line(size=1.1)

ggplot(subset(data.m,age<20),aes(x=age,y=Weight,group=Gender,color=Gender))+
  theme_bw()+
  geom_line(size=1.1)

ggplot(subset(data.m,age<20),aes(x=age,y=Weight,group=Gender,color=Gender))+
  theme_bw()+
  geom_line(size=1.1)+
  facet_wrap(~Gender)+
  theme(legend.position = "top")

ggplot(subset(data.m,age<20),aes(x=age,y=Weight,group=Gender,color=Gender))+
  theme_bw()+
  geom_line()+
  facet_wrap(~Gender)+
  theme(legend.position = "top")+
  geom_point(size=1.1)+
  geom_errorbar(aes(ymax=upper.w,ymin=lower.w))

ggplot(subset(data.m,age<20),aes(x=age,y=Weight,group=Gender,color=Gender))+
  theme_bw()+
  geom_line()+
  theme(legend.position = "top")+
  geom_point(size=1.1)+
  geom_errorbar(aes(ymax=upper.w,ymin=lower.w))


# 6.8 Barplots

p <- ggplot(subset(data.m,Gender=="Female"&age<20),
            aes(x=age,y=Weight))+theme_bw()
p
p+geom_bar(stat="identity")

ggplot(subset(data.m,Gender=="Female"&age<20),
       aes(x=age,y=Weight))+
  theme_bw()+
  geom_bar(stat="identity",width=0.5)

ggplot(subset(data.m,age<20),
       aes(x=age,y=Weight,group=Gender,colour=Gender,fill=Gender))+
  theme_bw()+
  geom_bar(stat="identity",position = "dodge",width=0.5)

ggplot(subset(data.m,age<20),
       aes(x=age,y=Weight,group=Gender,colour=Gender,fill=Gender))+
  theme_bw()+
  geom_bar(stat="identity",width=0.5)+facet_wrap(~Gender)

# 6.9 Heat maps

# To visualize relationships between categorical data
head(covid)
covid.m <- covid %>% filter(year==2020&continentExp=="Asia") %>% group_by(country,month) %>% summarize(Cases=sum(cases))
covid.m <- as.data.frame(covid.m)
head(covid.m)

# Number of cases per month in each country

p <- ggplot(subset(covid.m,month>2),aes(x=factor(month),y=factor(country),fill=Cases))
p + geom_tile()

ggplot(subset(covid.m,month>2),
       aes(x=factor(month),y=factor(country),fill=Cases))+
  geom_tile()+
  scale_fill_gradient(low="white", high="blue")+
  theme(axis.text.x = )

# Month wise cases in Europe

covid.m <- covid %>% filter(year==2020&continentExp=="Europe") %>% group_by(country,month) %>% summarize(Cases=sum(cases))
covid.m <- as.data.frame(covid.m)
head(covid.m)
ggplot(subset(covid.m,month>2),
       aes(x=factor(month),y=factor(country),fill=Cases))+
  geom_tile()+
  scale_fill_gradient(low="white", high="blue")+
  theme(axis.text.x = )

# Case normalized by population in Asian counteries

covid.m <- covid %>% filter(year==2020&continentExp=="Asia") %>% group_by(country,month,popData2019) %>% summarize(Cases=sum(cases)) %>% mutate(Cases.perc=Cases*100/popData2019)
covid.m <- as.data.frame(covid.m)
head(covid.m)
ggplot(subset(covid.m,month>2),
       aes(x=factor(month),y=factor(country),fill=Cases.perc))+
  geom_tile()+
  scale_fill_gradient(low="white", high="blue")+
  theme(axis.text.x = )

# Deaths in Europe

covid.m <- covid %>% filter(year==2020&continentExp=="Europe") %>% group_by(country,month) %>% summarize(Mortality=sum(deaths))
covid.m <- as.data.frame(covid.m)
head(covid.m)
ggplot(subset(covid.m,month>2),
       aes(x=factor(month),y=factor(country),fill=Mortality))+
  geom_tile()+
  scale_fill_gradient(low="white", high="blue")+
  theme(axis.text.x = )

# America

covid.m <- covid %>% filter(year==2020&continentExp=="America") %>% group_by(country,month) %>% summarize(Mortality=sum(deaths))
covid.m <- as.data.frame(covid.m)
head(covid.m)
ggplot(subset(covid.m,month>2),
       aes(x=factor(month),y=factor(country),fill=Mortality))+
  geom_tile()+
  scale_fill_gradient(low="white", high="blue")+
  theme(axis.text.x = )


#########
## Homework
#Load the file 'Hindi-word-recognition-data.csv' as a dataframe
# The data are from a "word recognition experiment"
# About experiment: words are presented on a computer screen one by one
# A participant has to recognize the word as quickly as possible
# Our hypothesis is that
# "The words which are more frequent in everyday use will be read faster"
# i.e., the words with high frequency will have small reaction times
# "The words which are long in size will be read slower"
# i.e., the words with longer length will have larger reaction times
hindi <- read.table("Hindi-word-recognition-data.csv",sep=",",header=T)
head(hindi)
#(1) What is the variable type of column "label"
#(2) Filter all the observations where label "hfshort"
#(3) Draw histogram of reactionTime in "hfshort" labeled words
#(4) Add a column "ReadingSpeed" in the dataframe such that 
# it shows value "Fast" when reactionTime is less than 600 otherwise "Slow"
#(5) Summarize mean, SD of reactionTime by each label
#There are four labels hfshort, hflong, lfshort, lflong
#(6) Draw barplots showing mean reaction time for each label
#(7) Draw errorbar over barplots (ranging from mean-SD to mean+SD)
#(8) Draw density plots showing distribution of 
#reaction times in each of four labels
#(9) Draw scatter plot of frequency and reactionTime
#(10) Does scatter plot suggest any relationship between 
# frequency and reaction time?
#(11) Draw reactionTime~frequency scatter plot in side by side for 
# each label using facet_wrap
#(12) Draw regression line between reactionTime and frequency
#(13) Show scatter plot and regression line for reactionTime and length
#(14) Do this:
hindi$frequency <- as.integer(hindi$frequency)
hindi.m <- hindi %>% group_by(frequency,length) %>% summarise(count=n())
hindi.m <- as.data.frame(hindi.m)
head(hindi.m)
# Use hindi.m dataframe and 
# draw a heatmap between freuency and length where gradient colour is determined by "count" column


howell <- read.table("Howell.csv",header=T,sep=",")
head(howell)
howell.young <- subset(howell,age<25)
hist(howell.young$weight)

# Linear model
# weight_i ~ Normal(mu_i,sigma)
# mu_i = alpha + beta * age_i
# sigma ~ normal+(0,20)
# alpha ~ normal(20,10)
# beta ~ normal(0,10)

howell.young$c_age <- scale(howell.young$age)

# 3.1 Frequentist inference
m1 <- lm(weight~c_age,data=howell.young)
m1
# alpha=24.34, beta=12.96

# 3.2 Bayesian inference
library(brms)
m2 <- brm(weight~c_age,data=howell.young,
          family=gaussian(),
          prior = c(
            prior(normal(20, 10), class=Intercept),
            prior(normal(0, 20), class=sigma),
            prior(normal(0, 10), class = b, coef = c_age)))
save(m2,file="weight-age-model.Rda")
