df <- read.csv("E:/Desktop files/AIIM/R/Diploma in ML in R/Resource 1/15834951762011630928/Complete ML in R/1. Linear Regression/House_Price.csv")
str(df)
summary(df)
hist(df$crime_rate)
#from executing above code we see that the values in later part of the histogram are not visible as most values are covered in first bar itself so we plot them separately in scatterplot

pairs(~price+crime_rate+n_hot_rooms+rainfall, data = df)
#we can see which variables have linear relationship with price or not and also about the presence of any outliers

barplot(table(df$airport))
barplot(table(df$waterbody))
barplot(table(df$bus_ter))
#here we can see that all samples or data selected has bus terminals so it won't be considered in further decision making

#Observations
# 1 n_hot_roomd and rainfall has outliers
# 2 n_hos_beds has missing values
# 3 bus_ter is useless variable
# 4 Crime_rate has some other functional relationship with price

quantile(df$n_hot_rooms,0.99)
uv = 3*quantile(df$n_hot_rooms,0.99)

df$n_hot_rooms[df$n_hot_rooms>uv] <- uv
#through this above mentioned script the maximum value observable will be changed it is falls above the mentioned upper limit criteria of uv to the max. uv value prescribed

summary(df$n_hot_rooms)


quantile(df$rainfall,0.01)
lv = 0.3*quantile(df$rainfall,0.01)

df$rainfall[df$rainfall<lv] <- lv

summary(df$rainfall)


mean(df$n_hos_beds)
mean(df$n_hos_beds, na.rm = TRUE)
#in above script the NA values are removed totally while calculating mean

which(is.na(df$n_hos_beds))

df$n_hos_beds[is.na(df$n_hos_beds)] <-mean(df$n_hos_beds, na.rm = TRUE)
#in above script missing values are replaced by mean value

summary(df$n_hos_beds)
which(is.na(df$n_hos_beds))
#this above script shows that we have successfully imputated the dataset and it has no NA figures in it

pairs(~price+crime_rate, data = df)
#The above script can be used to plot 2 or more variables, or for 2 variables following function can be used

plot(df$price,df$crime_rate)
#to formulate a more linear relationship of crime rate with price & also several values of Crime rate are at 0 and log(0) would be infinity,so  1 to crime rate is added followed by a log

df$crime_rate=log(1+df$crime_rate)
plot(df$price,df$crime_rate)
#Now running this version would give a much better perspective


df$avg_dist = (df$dist1+df$dist2+df$dist3+df$dist4)/4
#This above script is to ensure that Distance of property to place of employment is not overemphasised by giving multiple weights and so average is used

df2 <- df[, -7:-10]
#The above script will be used to replace the dist. columns from the dataset with avg. dist... df[1st , is for rows when no change required; 2nd is for columns and here as we want to remove them we put "-" sign before those column nos. ]

df <- df2
#now we assign df2 to df to ensure no confusion in future and then we will remove df2 also below
rm(df2)

df <- df[,-14] 
#Here we now remove bus terminal variable which was not useful






install.packages("dummies")
#to install the dummy package for creation of dummy variables
df <- dummy.data.frame(df)
#this creates dummy variable for all categorical variables into 0 or 1 which can be seen for Airport and also in case of Waterbodies
View(df)

df <- df[,-9]
df <- df[,-14]
#Only one dummy variable can serve the purpose i.e. n-1 as the other would mean the obvious other answer and so deleted, first 9th column and then 15th column which is post deletion of 9th column is shifted to 14th column




cor(df)
round(cor(df),2)
#The above script provides results on the correlation between variables

df <- df[,-16]
#parks variable has been removed as it is non significant + it has high correlation with Air quality this will help to reduce the issues pertaining to multi-colinearity

simple_model <- lm(price~room_num, data = df)
#Lineear regression function above, variable before or left of ~ is dependent variable and that on right is independent variable
summary(simple_model)
plot(df$room_num,df$price)
abline(simple_model)
#the above function would give a simple regression (model) line




multiple_model <- lm(price~., data = df)
#this above script would be used for multiple regression anakysis. The "." after price~ is for our selection to go along with all other variables available. Alternatively specific mentioning of varibales is also possible
summary(multiple_model)
# *** 0.001 means we are 99.99% sure or confident of given Beta being non-zero, Similarly ** would be 99% of confidence and * means 95% sure.