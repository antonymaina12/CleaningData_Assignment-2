## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, 
##    independent tidy data set with the average of each variable for each activity and each subject.

## Getting the data
if(!dir.exists("./data/UCI HAR Dataset/")){
    dir.create("./data")
    geturl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(geturl, "./data/smartphone.zip")
    unzip("./data/smartphone.zip", exdir = "./data")
}

require(dplyr)

## Reading in the variable names
labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
names(labels) <- c("id", "activity")

features <- read.table("./data/UCI HAR Dataset/features.txt")
names(features) <- c("id", "feature")
features$feature <- make.names(features$feature, unique = TRUE)

## Reading in the test and train data and renaming the column names of the datasets.
testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    names(testx) <- features$feature

trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    names(trainx) <- features$feature
    
testy <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
        names(testy) <- c("id")
        
trainy <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
names(trainy) <- c("id")

trainsub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
testsub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

## Merging the y sets to contain the activity labels.
trainy <- trainy %>% 
    left_join(labels, by = "id")
testy <- testy %>%
    left_join(labels, by = "id") 

## Creating complete test and training sets.
test <- bind_cols(testx, testy)
test <- bind_cols(test, testsub)

train <- bind_cols(trainx, trainy)
train <- bind_cols(train, trainsub)
## Extracts only variables containing the mean and standard deviation, and adding a new variable 
## to show if the subject is from the training group or test group.
test <- test %>%
        select(contains("mean"), contains("std"), subject, activity)

train <- train %>% 
        select(contains("mean"), contains("std"), subject, activity) 

## Creating the complete dataset
data <- bind_rows(test, train)

## Creating the tidy dataset
tidydata <- data %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

write.table(tidydata, file = "tidydata.txt")