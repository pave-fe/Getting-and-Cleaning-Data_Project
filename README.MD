---
title: "Week 4 Programming"
author: "Mike Hulin"
date: "April 20, 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Review criteria
* The submitted data set is tidy.
* The Github repo contains the required scripts.
* GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
* The README that explains the analysis files is clear and understandable.
* The work submitted for this project is the work of the student who submitted it.

## Getting and Cleaning Data Course Project 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

***

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!

***

## Process for completing the analysis

Download and unzip the datafile

```{r}
setwd("D:/My_Files/Documents/Coursera/Getting and Cleaning data/Week 4/")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/dataset.zip", mode = "wb")
unzip("./data/dataset.zip", exdir = "D:/My_Files/Documents/Coursera/Getting and Cleaning data/Week 4"  )

```

## Read the data tables

```{r}
## Read the data from the Test Directory
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

## read the data from the training Directory
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## Read Activity Labels

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
# [grep("-(mean|std)\\(\\)", read.table("./UCI HAR Dataset/features.txt")[, 2]), 2] 
```

## adding column names to the tables fromt he features dataset


```{r}
# Test data
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

# Train data
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(activity_labels) <- c('activityID', 'activityType')
```

## Merge the Data into one set

```{r}
testdata <- cbind(y_test, subject_test, x_test)
traindata <- cbind(y_train, subject_train, x_train)
alldata <- rbind(testdata, traindata)
```

## creating a column name vector with only mean and standard deviation data (std)

```{r}
# createing the column name vector

ColumnNames <- colnames(alldata)

# selecting the mean and std values from the vector ColumnNames

ChosenCol <- (grepl("activityID" , ColumnNames) | 
                grepl("subjectID" , ColumnNames) | 
                grepl("mean.." , ColumnNames) | 
                grepl("std.." , ColumnNames) 
                )

# subsetting "alldata"  with the logical vector "ChosenCol"

selectedData <- alldata[, ChosenCol == TRUE]
```

## Making descriptive names for the data

```{r}
selectedData <- merge(selectedData, activity_labels,
                      by = 'activityID',
                      all.x = TRUE)

names(selectedData) <- gsub('Acc',"Acceleration",names(selectedData))
names(selectedData) <- gsub('Mag',"Magnitude",names(selectedData))
names(selectedData) <- gsub('^t',"TimeDomain.",names(selectedData))
names(selectedData) <- gsub('mean',"Mean",names(selectedData))
names(selectedData) <- gsub('std',"StandardDeviation",names(selectedData))
names(selectedData) <- gsub('(F|f)req',"Frequency",names(selectedData))
names(selectedData) <- gsub('^f',"FrequencyDomain.",names(selectedData))
# removing BodyBody typos

names(selectedData) <- gsub('BodyBody', "Body", names(selectedData))
# names(selectedData)  Check names for completeness

# reorder columns to ensure subjectID and actitivityType are in the first 2 columns
refcols <- c("subjectID", "activityType")
selectedData <- selectedData[, c(refcols,  setdiff(names(selectedData), refcols))]

```

## Creating a tidy dataset with the average of each variable for activity and subject

```{r}
allTidy <- aggregate(. ~subjectID + activityType, selectedData, mean)

# clean up and order the data based on SubjectID and Activity

allTidy <- allTidy[order(allTidy$subjectID, allTidy$activityID),]

# remove activityID column as it is irrelevant to the final data set

allTidy<- allTidy[, c(1:2, 4:82)]

```

## Write the allTidy data to a text file

```{r}
write.table(allTidy, "allTidy.txt", row.names = FALSE)
```

