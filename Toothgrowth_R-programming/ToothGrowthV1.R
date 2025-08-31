#Loading dataset
data("ToothGrowth")
tg <- ToothGrowth

#dataset of only OJ 
tgoj <- tg[tg$supp == "OJ" ,]

#dataset of only VC 
tgvc <- tg[tg$supp == "VC" ,]

#summary of data 
summary(ToothGrowth)

library(ggplot2)

#creating first degree polynomial fit for both OJ guinea pigs and VC guinniea pigs
tgojlm <- lm(formula = len ~ dose, data = tgoj)
tgvclm <- lm(formula = len ~ dose, data = tgvc)

#use the linear fit to extrapolate for dose = 0
lengthojat0 <- tgojlm$coefficients[1] + tgojlm$coefficients[2]*0
lengthvcat0 <- tgvclm$coefficients[1] + tgvclm$coefficients[2]*0

#calc error at 0 dose for the two lin fits
errlin <- abs(lengthojat0 - lengthvcat0) 

#calculating the coefficient of determination on each supp
cdojlm <- cor(sqrt(tgoj$len), sqrt(tgoj$dose))
cdojlm <- cdojlm^2*100
cdvclm <- cor(sqrt(tgvc$len), sqrt(tgvc$dose))
cdvclm <- cdvclm^2*100

#fitting the data with quadratic equation
tgojquad <- lm(formula = len ~ poly(dose,2,raw=T), data = tgoj)
tgvcquad <- lm(formula = len ~ poly(dose,2,raw=T), data = tgvc)

#xquad = seq(0, 2, length.out=1000)
yojquad = coef(tgojquad)[1] + coef(tgojquad)[2]*0 + coef(tgojquad)[3]*0^2 
yvcquad = coef(tgvcquad)[1] + coef(tgvcquad)[2]*0 + coef(tgvcquad)[3]*0^2
errquad <- abs(yojquad - yvcquad) 

#creating fitted data plots
g <-ggplot(tg, aes(x=dose, y=len)) + geom_point(aes(color=(supp))) +
   scale_y_continuous("Length of Teeth") +
   ggtitle("Tooth length for each supplement") + 
   xlim(c(0, 2.0))+
   geom_abline(intercept = tgojlm$coefficients[1], 
               slope = tgojlm$coefficients[2], col="red") +
   geom_abline(intercept = tgvclm$coefficients[1], 
               slope = tgvclm$coefficients[2], col="blue")+
   geom_smooth(data=subset(tg, supp=="OJ"), method='lm', fullrange=TRUE, formula=y~poly(x,2), col="red") +
   geom_smooth(data=subset(tg, supp=="VC"), method='lm', fullrange=TRUE, formula=y~poly(x,2), col="blue")
 plot(g)

# calculate the average, standard distribution and confidence intervals
# for each dosage level
# dosage 0.5
tg_0_5 <- subset(tg, tg$dose == 0.5)
tg_0_5_oj <- tg_0_5[tg_0_5$supp == "OJ" ,]
tg_0_5_vc <- tg_0_5[tg_0_5$supp == "VC" ,]
sig2_tg_0_5_oj <- 2*sd(tg_0_5_oj$len)
sig2_tg_0_5_vc <- 2*sd(tg_0_5_vc$len)
avg_0_5_oj <- mean(tg_0_5_oj$len)
avg_0_5_vc <- mean(tg_0_5_vc$len)
ci_tg_0_5_oj <- c(avg_0_5_oj-sig2_tg_0_5_oj, avg_0_5_oj+sig2_tg_0_5_oj)
ci_tg_0_5_vc <- c(avg_0_5_vc-sig2_tg_0_5_vc, avg_0_5_vc+sig2_tg_0_5_vc)
diff_0_5 = avg_0_5_vc - avg_0_5_oj

# dosage 1
tg_1 <- subset(tg, tg$dose == 1)
tg_1_oj <- tg_1[tg_1$supp == "OJ" ,]
tg_1_vc <- tg_1[tg_1$supp == "VC" ,]
sig2_tg_1_oj <- 2*sd(tg_1_oj$len)
sig2_tg_1_vc <- 2*sd(tg_1_vc$len)
avg_1_oj <- mean(tg_1_oj$len)
avg_1_vc <- mean(tg_1_vc$len)
ci_tg_1_oj <- c(avg_1_oj-sig2_tg_1_oj, avg_1_oj+sig2_tg_1_oj)
ci_tg_1_vc <- c(avg_1_vc-sig2_tg_1_vc, avg_1_vc+sig2_tg_1_vc)
diff_1 = avg_1_vc - avg_1_oj

# dosage 2
tg_2 <- subset(tg, tg$dose == 2)
tg_2_oj <- tg_2[tg_2$supp == "OJ" ,]
tg_2_vc <- tg_2[tg_2$supp == "VC" ,]
sig2_tg_2_oj <- 2*sd(tg_2_oj$len)
sig2_tg_2_vc <- 2*sd(tg_2_vc$len)
avg_2_oj <- mean(tg_2_oj$len)
avg_2_vc <- mean(tg_2_vc$len)
ci_tg_2_oj <- c(avg_2_oj-sig2_tg_2_oj, avg_2_oj+sig2_tg_2_oj)
ci_tg_2_vc <- c(avg_2_vc-sig2_tg_2_vc, avg_2_vc+sig2_tg_2_vc)
diff_2 = avg_2_vc - avg_2_oj

# creating gaussinan distrib plots for each dose level
# dosage 0.5
g2 <-ggplot(tg_0_5, aes(x=len,y=0)) + geom_point(aes(color=(supp))) +
  scale_x_continuous("len") +  scale_y_continuous("Density of Probability") +
  ggtitle("Gaussia distrubtion of data at dose 0.5 mg") +
  #geom_histogram(alpha=1, fill='red', colour='red', binwidth=1) +
  stat_function(fun=dnorm, n=1001, args=list(mean=mean(tg_0_5_oj$len), sd=sd(tg_0_5_oj$len)), col='red') +
  stat_function(fun=dnorm, n=1001, args=list(mean=mean(tg_0_5_vc$len), sd=sd(tg_0_5_vc$len)), col='blue')+
  xlim(c(0, 30))

# dosage 1
g3 <-ggplot(tg_1, aes(x=len,y=0)) + geom_point(aes(color=(supp))) +
  scale_x_continuous("len") +  scale_y_continuous("Density of Probability") +
  ggtitle("Gaussia distrubtion of data at dose 1 mg") +
  #geom_histogram(alpha=1, fill='red', colour='red', binwidth=1) +
  stat_function(fun=dnorm, n=1001, args=list(mean=mean(tg_1_oj$len), sd=sd(tg_1_oj$len)), col='red') +
  stat_function(fun=dnorm, n=1001, args=list(mean=mean(tg_1_vc$len), sd=sd(tg_1_vc$len)), col='blue')+
  xlim(c(10, 40))

# dosage 2
g4 <-ggplot(tg_2, aes(x=len,y=0)) + geom_point(aes(color=(supp))) +
  scale_x_continuous("len") +  scale_y_continuous("Density of Probability") +
  ggtitle("Gaussia distrubtion of data at dose 2 mg") +
  #geom_histogram(alpha=1, fill='red', colour='red', binwidth=1) +
  stat_function(fun=dnorm, n=1001, args=list(mean=mean(tg_2_oj$len), sd=sd(tg_2_oj$len)), col='red') +
  stat_function(fun=dnorm, n=1001, args=list(mean=mean(tg_2_vc$len), sd=sd(tg_2_vc$len)), col='blue')+
  xlim(c(10, 40))

plot(g2)
plot(g3)
plot(g4)

