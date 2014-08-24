#
# Getting and Cleaning Data Course Project 
# Version 1.0
# 
# The following script does the following: 
#
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#

#getwd()
library(plyr)

# Read the training set
trainingSetX <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
trainingSety <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
trainingSetSubject <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
trainingSet <- cbind(cbind(trainingSetX,trainingSety), trainingSetSubject)

# Read the testing set
testSetX <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testSety <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
testSetSubject <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
testSet <- cbind(cbind(testSetX, testSety), testSetSubject)   

# Merges the training and the test sets to create one data set
allData <- rbind(trainingSet,testSet)  

# Extracting the measurements on the mean and standard deviation for each measurement
featuresData = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)[,2]
featuresMeanStd <- grep("mean|std", featuresData)
colsData <- c(featuresMeanStd,562,563)
allData <- allData[,colsData]
featuresDataMeanStd <-  featuresData[featuresMeanStd]

# Reading activities
activityData = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)[,2]

# Labels for columns
colnames(allData) <- c(as.character(featuresDataMeanStd), "Activity", "Subject")

# Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 
all_Data_avg <- ddply(allData, c("Subject","Activity"), numcolwise(mean))

# Using descriptive activity names to name the activities in the data set
convertActivity <- data.frame( labelActivity = 1:6, ActivityDescription = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
all_Data_avg$Activity <- as.character(convertActivity[all_Data_avg$Activity,2])
# This step can also be done using the following line for each activity 
# all_Data_avg$Activity[all_Data_avg$Activity == "1"]<-"WALKING"

# Renaming the column names
names(all_Data_avg) <- gsub("()", "", names(all_Data_avg), fixed="TRUE")
names(all_Data_avg) <- gsub("-", "", names(all_Data_avg))

# Writing a tidy data with the merged data
write.table(all_Data_avg, file = "tidyData.txt", sep = " ", row.names = FALSE,
            qmethod = "double")


