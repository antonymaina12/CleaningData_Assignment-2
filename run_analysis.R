## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.

## Getting the data
if(!file.exists("./data/smartphone.csv")){
    dir.create("./data")
    geturl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(geturl, "./data/smartphone.zip")
    unzip("./data/smartphone.zip", exdir = "./data")
}

## Reading in the variable names
labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
names(labels) <- c("id", "activity")

features <- read.table("./data/UCI HAR Dataset/features.txt")
names(features) <- c("id", "feature")

## Renaming the colomn names of the datasets.
testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    names(testx) <- features$feature

trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    names(trainx) <- features$feature
    
testy <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
        names(testy) <- c("id")
        
trainy <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
names(trainy) <- c("id")

## Merging the y sets to contain the activity labels.
trainy <- merge(trainy, labels, by = "id")
testy <- merge(testy, labels, by = "id")

## Creating complete test and training sets.
test <- cbind(testx, testy)
train <- cbind(trainx, trainy)