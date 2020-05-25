ls()
iris
str(iris)
View(iris)
Customer <- read.csv('E:/Desktop files/AIIM/R/Diploma in ML in R/Resource 1/15834951762011630928/Complete ML in R/1. Linear Regression/Customer.csv', header = TRUE)
View(Customer)
y <- table(Customer$Region)

barplot(y)
barplot(y[order(-y)])
barplot(y[order(-y)], border = NA)
barplot(y[order(-y)], border = NA, col = "grey")
barplot(y[order(-y)], border = NA, col = c("darkorchid3","grey","grey","grey"))
colors()
barplot(y[order(-y)], border = NA, col = c("darkorchid3","grey","grey","grey"), horiz = TRUE)        
barplot(y[order(-y)], border = NA, col = c("darkorchid3","grey","grey","grey"), horiz = TRUE, main = ("Freq. of \n Area"))        
barplot(y[order(-y)], border = NA, col = c("darkorchid3","grey","grey","grey"), horiz = TRUE, main = ("Freq. of \n Area"), xlab = "No. of Customers")        


hist(Customer$Age)
hist(Customer$Age, breaks = 5)
#note on executing aforementioned command 6 breaks are created instead of 5 this is 'coz 5 is just a suggestive number proposed by us
hist(Customer$Age, breaks = c(0,20,40,60,80))
hist(Customer$Age, breaks = c(0,40,60,100))
#note on executing the above command Y-axis changes to Density by default, for changing it back use the following command
hist(Customer$Age, breaks = c(0,40,60,100), freq = TRUE)
hist(Customer$Age, breaks = c(0,40,60,100), freq = TRUE, col = c("Blue1","grey","grey"))
hist(Customer$Age, breaks = c(0,40,60,100), freq = TRUE, col = c("Blue1","grey","grey"), main = "Histogram of Age", xlab = "Customer Age")
