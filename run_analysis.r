## Download and unzip the datafile
library(data.table)
library(dplyr)
library(zip)

setwd("D:/My_Files/Documents/Coursera/Getting and Cleaning data/Week 4/")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("./data/dataset.zip")) {
        download.file(fileUrl,destfile="./data/dataset.zip", mode = "wb")}

if(!file.exists("UCI HAR Dataset/")) {
        unzip("./data/dataset.zip", exdir = "D:/My_Files/Documents/Coursera/Getting and Cleaning data/Week 4"  )
        }
        

## Read the data tables


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


## adding column names to the tables


# Test data
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

# Train data
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"
colnames(activity_labels) <- c('activityID', 'activityType')


## Merge the Data into one set


testdata <- cbind(y_test, subject_test, x_test)
traindata <- cbind(y_train, subject_train, x_train)
alldata <- rbind(testdata, traindata)


## creating a column name vector with only mean and standard deviation data (std)


ColumnNames <- colnames(alldata)

# selecting the mean and std values from the vector ColumnNames

ChosenCol <- (grepl("activityID" , ColumnNames) | 
                      grepl("subjectID" , ColumnNames) | 
                      grepl("mean.." , ColumnNames) | 
                      grepl("std.." , ColumnNames) 
                )

# subsetting "alldata"  with the logical vector "ChosenCol"

selectedData <- alldata[, ChosenCol == TRUE]


## Making descriptive names for the data


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


## Creating a tidy dataset with the average of each variable for activity and subject

allTidy <- aggregate(. ~subjectID + activityType, selectedData, mean)

# clean up and order the data based on SubjectID and Activity

allTidy <- allTidy[order(allTidy$subjectID, allTidy$activityID),]

# remove activityID column as it is irrelevant to the final data set

allTidy<- allTidy[, c(1:2, 4:82)]



## Write the allTidy data to a text file


write.table(allTidy, "allTidy.txt", row.names = FALSE)

