##########################################################################
##### 1.Merges the training and the test sets to create one data set.#####
##########################################################################

###read in the training data sets###

X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

###combine the training data sets###

trainData <- cbind(subject_train,Y_train,X_train)

###read in the test data sets###

X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

###combine the test data sets###

testData <- cbind(subject_test,Y_test,X_test)

###combine the training and test data sets###

combinedData <- rbind(trainData,testData)

colnames(combinedData)[1:2] <- c("subjectId","activityId")

###################################################################################################
#####2.Extracts only the measurements on the mean and standard deviation for each measurement.#####
###################################################################################################
###################################################################################################
#####4.Appropriately labels the data set with descriptive variable names.##########################
###################################################################################################

###read in the feactures file which will be used to find the mean and std variables for each measurement###

features <- read.table("features.txt")

###create an indicator for mean variables: TRUE is mean and FALSE is other###

meanIndicator <- grepl(pattern="mean()",x=features[,2])

###create an indicator for standard deviation variables: TRUE is std and FALSE is other###

stdIndicator <- grepl(pattern="std()",x=features[,2])

###create a subset of combinedData with variables of only the mean or std for each measurement###

subsetData <- combinedData[,c(1,2,which(meanIndicator+stdIndicator==TRUE)+2)]
#adding 2 is because the measurement variables are stored starting from the 3rd column#

###label the measurement variables###
numCol <- dim(subsetData)[2]
colnames(subsetData)[3:numCol] <- as.character(features[which(meanIndicator+stdIndicator==TRUE),2])


##################################################################################
#####3.Uses descriptive activity names to name the activities in the data set#####
##################################################################################

###read in the activity labels###

activity_labels <- read.table("activity_labels.txt")

###merge the subsetData set with the activity label###

subsetData <- merge(subsetData,activity_labels,by.x="activityId",by.y="V1",All.x=TRUE)

###remove the activityId variable and reorder columns starting with subjectId, activityLabel,and measurement variables###
numCol <- dim(subsetData)[2]
subsetData <- subsetData[,2:numCol]
write.table(subsetData,file="tidyData.txt",row.names=FALSE,col.names=TRUE)

#########################################################################################
#####5.Creates a second, independent tidy data set with the average of each variable#####
#####for each activity and each subject.#################################################
#########################################################################################

install.packages("plyr")
library(plyr)

avgData <- ddply(combinedData,.(subjectId,activityId),numcolwise(mean))

