library(dplyr)

dat <- read.table("Data/df_pupil_complete.csv",
                  sep=",",header=T)
head(dat)
dim(dat)

dat.summary <- dat %>% 
  group_by(subj,load) %>% 
  summarize(AvgPsize=mean(p_size),
            sdPsize=sd(p_size),
            count=n())
dat.summary

save(dat.summary,
     file="Data/Summary-stats.rda")
load("Data/Summary-stats.rda")
head(dat.summary)

colnames(dat.summary)[1] <- "Load"


lm(p_size~load,data=dat)

library(ggplot2)
ggplot(dat.summary,
       aes(x=load,y=AvgPsize,fill=load))+
  geom_bar(stat="identity")+
  geom_errorbar(aes(ymin=AvgPsize-sdPsize,
                    ymax=AvgPsize+sdPsize))

############

library(reshape2)

dat <- data.frame(subj=c(1,2,3),
                  cond0=rnorm(3,700,20),
                  cond1=rnorm(3,720,20),
                  cond2=rnorm(3,730,20))
dat

dat.long <- melt(dat,id=c("subj"))
colnames(dat.long)[2:3] <- c("load","p_size")
dat.long
plot(dat$load,dat$p_size)

dat.long$load <- 
  ifelse(dat.long$load=="cond0",0,
         ifelse(dat.long$load=="cond1",1,2))
dat.long
