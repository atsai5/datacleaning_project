library(dplyr)

# save data URL
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# set working directory

# check to see if the directory exists - if not then download the zip file and extract to the working directory
if(!file.exists("UCI HAR Dataset")) {
    download.file(URL, "raw.zip")
    unzip("raw.zip")
}

# read in training and test data - x, y, and subject data
xtrain <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt"))
ytrain <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt"))
sbjt <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt"))
xtest <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt"))
ytest <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt"))
sbjt_test <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt"))

# read in feature data and activity data
features <- tbl_df(read.table("./UCI HAR Dataset/features.txt"))
activity <- tbl_df(read.table("./UCI HAR Dataset/activity_labels.txt"))

# create column labels based on feature data and appended subject and activity columns
labels <- c("subject","activity") %>% append(as.character(unlist(features[,2]))) %>% append("type")

# add column to identify training and test datasets (i.e. xtrain, xtest) before data merge
xtrain <- mutate(xtrain, type = "training")
xtest <- mutate(xtest, type = "test")

# match activities to training and test labels (i.e. ytrain, ytest)
ytrain <- left_join(ytrain, activity, by = "V1")
ytest <- left_join(ytest, activity, by = "V1")

# bind subject column, activity column, and training and test datasets and add column labels representing the variables
train <- cbind(sbjt, ytrain[,2], xtrain)
colnames(train) <- labels

test <- cbind(sbjt_test, ytest[,2], xtest)
colnames(test) <- labels

# combine training and test datasets
total <- rbind(train, test)

# remove tables merged into "total" table
rm(xtrain, ytrain, sbjt, xtest, ytest, sbjt_test, features, activity, labels, train, test)

# extract only the measurements on the mean and standard deviation for each measurement
stdmeanonly <- total[,grep("std()|mean()", colnames(total))]
stdmeanonly <- stdmeanonly[-grep("meanFreq()", colnames(stdmeanonly))]
stdmeanonly <- tbl_df(cbind(subject = total$subject, activity = total$activity, type = total$type, stdmeanonly))

# group by each activity, subject, and type (i.e. test or training)
avgs <- stdmeanonly %>% group_by(activity, type, subject) %>% summarize_all(funs(mean)) %>% arrange(activity, type, subject)

# output tidy data set - avgs
write.table(avgs, "tidydata.txt", row.names = FALSE)
