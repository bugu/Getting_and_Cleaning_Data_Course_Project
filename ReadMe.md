# Getting and Cleaning Data --Course 3 of Data Analysis Specialization on Coursera--

## Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script details

1. Download the data source from the link which is provided in the codebook and unzip it. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```.
3. In R give the command : ```source("run_analysis.R")```, then it will generate a new file ```tidy_data.txt``` in your working directory.

## Project transformation details


* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How run_analysis.R script works:

* Require "reshape2" and "data.table" packages.
* Loading necessary datas to temporary variables
* Process x_test and y_test datasets
* Process X_train and y_train datasets
* Extracts the mean and standard deviation column names and data.
* Binds the data.
* Merging data set.
* Exporting final tidy data as a text file
