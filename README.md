TidyDataProject
===============

This is the course project for Getting and Cleaning Data on Coursera.

To replicate the work I've done, you need to do the following steps:

Step 1

Download the zipped file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once it's downloaded, unzip it. It will create a new folder in the directory where you download the file. The new folder is called "getdata-projectfiles-UCI HAR Dataset". Click it and you'll see a subfolder in there - "UCI HAR Dataset". This is the folder where you need to download the run_analysis.R script into.

Step 2

Download the run_analysis.R script to the directory ".\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset"

Step 3

Run the R script. The R code is as follows:



X_train <- read.table("./train/X_train.txt")

Y_train <- read.table("./train/Y_train.txt")

subject_train <- read.table("./train/subject_train.txt")

trainData <- cbind(subject_train,Y_train,X_train)

X_test <- read.table("./test/X_test.txt")

Y_test <- read.table("./test/Y_test.txt")

subject_test <- read.table("./test/subject_test.txt")

testData <- cbind(subject_test,Y_test,X_test)

combinedData <- rbind(trainData,testData)

colnames(combinedData)[1:2] <- c("subjectId","activityId")

features <- read.table("features.txt")

meanIndicator <- grepl(pattern="mean()",x=features[,2])

stdIndicator <- grepl(pattern="std()",x=features[,2])

subsetData <- combinedData[,c(1,2,which(meanIndicator+stdIndicator==TRUE)+2)]

numCol <- dim(subsetData)[2]

colnames(subsetData)[3:numCol] <- as.character(features[which(meanIndicator+stdIndicator==TRUE),2])

activity_labels <- read.table("activity_labels.txt")

subsetData <- merge(subsetData,activity_labels,by.x="activityId",by.y="V1",All.x=TRUE)

numCol <- dim(subsetData)[2]

subsetData <- subsetData[,2:numCol]

write.table(subsetData,file="tidyData.txt",row.names=FALSE,col.names=TRUE)

install.packages("plyr")

library(plyr)

avgData <- ddply(combinedData,.(subjectId,activityId),numcolwise(mean))


Step 4

To load in the tidy data set I created for the project, you can use write.table() function. The data set has column names but not row names and the columns are separated by space.

