library(dplyr)

mydata <- data.frame(StudentName=c("Abhay","Kriti","John"),
                     Marks=c(90,80,56),Percentage=rep(NA,3))
mydata

mydata[3,]
unname(unlist(mydata[3,]))
mydata[3,2]
mydata[,2]

stats <- c(mean=mean(mydata[,2]),sd=sd(mydata[,2]))
stats
unname(stats)
###################

mydata$Marks
mydata$StudentName
mydata$Percentage

mydata$TotalMarks <- rep(200,3)
mydata

mydata$Percentage <- (mydata$Marks/mydata$TotalMarks)*100
mydata  

mydata$Grade <- ifelse(mydata$Percentage>=40,"A","B")

library(dplyr)

mydata <- data.frame(StudentName=c("Abhay","Kriti","John"),
                     Marks=c(90,80,56),Percentage=rep(NA,3))
mydata$TotalMarks <- rep(200,3)

mydata <- mydata %>% 
  select(StudentName,Marks,TotalMarks) %>% 
  mutate(Percent=(Marks/TotalMarks)*100) %>%
  filter(Percent>30)
mydata
  