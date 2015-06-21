## --This script needs data.table and reshape2 packages--
## Also this script created for tidying up the dataset which is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## This script extracts only the measurements on the mean and standard deviation for each measurement
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names
## Merges the training and the test sets to create one data set and finally creates a second independent tidy data set with the average of each variable for each activity and each subject.

require("data.table")
require("reshape2")

# Loading necessary datas to temporary variables. 
features <- read.table("./UCI HAR Dataset/features.txt")[,2] # Column Names
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt") #loading x_test
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") #loading y_test
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt") #loading x_train
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") #loading y_train
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2] # Activity Labels
extract_features <- grepl("mean|std", features) # mean and standard deviations

## X_test and y_test dataset

names(x_test) = features #loading features to x_test
x_test = x_test[,extract_features]# mean and standard deviations
y_test[,2] = activity_labels[y_test[,1]] #activity labels loading to y_test
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

## x_train and y_train dataset

names(x_train) = features #loading features to x_train
x_train = x_train[,extract_features] # mean and standard deviations
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

## Binding
test_data <- cbind(as.data.table(subject_test), y_test, x_test) # cbind data
train_data <- cbind(as.data.table(subject_train), y_train, x_train) # cbind data

## Merging both test and train datas
data = rbind(test_data, train_data) #rbinds data
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels) # melts data
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean) # dcast on melt_data

## exporting final tidy data as a text file
write.table(tidy_data, file = "./tidy_data.txt",row.name=FALSE)