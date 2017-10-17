Code Book - tidydata.txt

The data table saved in "tidydata.txt" has 40 rows and 69 columns. The first three columns represent data assigned to a particular activity/type/subject.

activity - The activity corresponds to the action observed. These actions are listed below.
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

type - The type of data presented here represents whether the subject observed is from the training group or the test group.

subject - The subject is an ID value that identifies each subject from each type.

The additional 66 variables are the average mean and standard deviation of each of the 33 variables listed below grouped by activity/type/subject. The column name contains one of the variables below with mean() or std() appended to it in order to identify the measurement being taken. An example is "tBodyAcc-mean()-X" which represents the average of the means of the variable tBodyAcc-X.

Note - Taken from features_info.txt within the "UCI HAR Dataset" folder

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
