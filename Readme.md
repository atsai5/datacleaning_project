# datacleaning_project
Coursera - Getting and Cleaning Data - Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

Review criteria
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

-----------------------------------------------------------------------------------------------------

The script run_analysis.R gets the data needed for this analysis and performs the actions and transformations to export a tidy data set with the average of each variable for each activity and each subject.

(Rows 4-13)
First the script checks to see if the data exists in the working directory as an unzipped folder. If not, it downloads a copy of the zip file and unzips it to the working directory.

(Rows 15-25)
The next step is to read in the training and test data, present in the "test" and "train" folders in the unzipped directory. 
The README.txt file present in the directory identifies the purpose of each of the data tables present in the unzipped directory.
The data contained in the train/X_train.txt and test/X_test.txt sets are the individual values of each of the features present in feature.txt measured for each of the subjects and activities in the subject_train/test txt files and ytrain/ytest txt files, respectively.
The ytrain and ytest txt files contain activity ids that correspond to the ids present in activity_labels.txt.

To create the overall tidy dataset, a number of activities must be completed.
1. A type column will be added to the test/training datasets to identify if the row of data is from either the test or training groups. (Rows 30-32)
2. The activity column must be decoded using activity_labels.txt (Rows 34-36)
3. The subject (subject_test.txt and subject_train.txt) and activity (y_test.txt and y_train.txt) columns must be appended to both the test/training datasets (X_test.txt and X_train.txt). (Rows 39, 42)
4. Columns of the training and test sets will be labeled with the labels present in features.txt, with additional labels present for the subject column, activity column, and type column. (Rows 40, 43)
5. The two training and test datasets will be appended to each other to create a the full dataset named "total". (Rows 45-46)

(Rows 48-49)
All data tables except the complete data table are removed from memory.

(Rows 51-54)
As detailed in 2. in the problem statement, only the measurements on the mean (mean()) and standard deviation (std()) are to be extracted. Looking at the dataset, we're only interested in the "mean()" and "std()" values from the variables below.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Row 52 separates all columns with "std" or "mean" in the column names and assigns them to the data table stdmeanonly. By pulling all columns with "mean" present in the name, we also end up with the columns with "meanFreq" in the name - we are not interested in these. Row 53 identifies these columns and removes them from stdmeanonly.
Row 54 carries over the subject, activity, and type columns from total to stdmeanonly.

(Rows 56-57)
A new data table named avgs is established to hold the data requested in 5. in the problem statement. stdmeanonly is grouped by activity, type, and subject and the average of each variable for each activity/type/subject combination is produced.

(Rows 59-60)
The cleaned dataset from 5. in the problem statement, avgs, is written to a text file named tidydata.txt in the working directory.
