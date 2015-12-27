# Code book

The code book for the tidy HAR data set that includes information about the variables and how the source data set has been cleaned & transformed.

## Experimental Study Design

See the description for the source data set here: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Tidy HAR Data Set

The tidy data set includes the following file:

- `clean_and_tidy_avg.txt` - a space-delimted text file that contains the average of the mean & standard deviation variables for each subject and activity

## Variables

The tidy HAR data set includes the following variables:

- `Subject` The subject identifier (number) contains the 30 subjects of the experiment from the source data set

- `Activity` The activity (string) that the subject of the experiment did. The activity variable include the following values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING & LAYING.

- `Features` The average of the mean (float) & standard deviation (float) feature vectors for each subject & activity calculated from the accelerometer & gyroscope of the smartphone sensors. See a list of the feature vectors below.


### Feature vectors

* "tBodyAcc-mean()-X"
* "tBodyAcc-mean()-Y"
* "tBodyAcc-mean()-Z"
* "tBodyAcc-std()-X"
* "tBodyAcc-std()-Y"
* "tBodyAcc-std()-Z"
* "tGravityAcc-mean()-X"
* "tGravityAcc-mean()-Y"
* "tGravityAcc-mean()-Z"
* "tGravityAcc-std()-X"
* "tGravityAcc-std()-Y"
* "tGravityAcc-std()-Z"
* "tBodyAccJerk-mean()-X"
* "tBodyAccJerk-mean()-Y"
* "tBodyAccJerk-mean()-Z"
* "tBodyAccJerk-std()-X"
* "tBodyAccJerk-std()-Y"
* "tBodyAccJerk-std()-Z"
* "tBodyGyro-mean()-X"
* "tBodyGyro-mean()-Y"
* "tBodyGyro-mean()-Z"
* "tBodyGyro-std()-X"
* "tBodyGyro-std()-Y"
* "tBodyGyro-std()-Z"
* "tBodyGyroJerk-mean()-X"
* "tBodyGyroJerk-mean()-Y"
* "tBodyGyroJerk-mean()-Z"
* "tBodyGyroJerk-std()-X"
* "tBodyGyroJerk-std()-Y"
* "tBodyGyroJerk-std()-Z"
* "tBodyAccMag-mean()"
* "tBodyAccMag-std()"
* "tGravityAccMag-mean()"
* "tGravityAccMag-std()"
* "tBodyAccJerkMag-mean()"
* "tBodyAccJerkMag-std()"
* "tBodyGyroMag-mean()"
* "tBodyGyroMag-std()"
* "tBodyGyroJerkMag-mean()"
* "tBodyGyroJerkMag-std()"
* "fBodyAcc-mean()-X"
* "fBodyAcc-mean()-Y"
* "fBodyAcc-mean()-Z"
* "fBodyAcc-std()-X"
* "fBodyAcc-std()-Y"
* "fBodyAcc-std()-Z"
* "fBodyAccJerk-mean()-X"
* "fBodyAccJerk-mean()-Y"
* "fBodyAccJerk-mean()-Z"
* "fBodyAccJerk-std()-X"
* "fBodyAccJerk-std()-Y"
* "fBodyAccJerk-std()-Z"
* "fBodyGyro-mean()-X"
* "fBodyGyro-mean()-Y"
* "fBodyGyro-mean()-Z"
* "fBodyGyro-std()-X"
* "fBodyGyro-std()-Y"
* "fBodyGyro-std()-Z"
* "fBodyAccMag-mean()"
* "fBodyAccMag-std()"
* "fBodyBodyAccJerkMag-mean()"
* "fBodyBodyAccJerkMag-std()"  
* "fBodyBodyGyroMag-mean()"
* "fBodyBodyGyroMag-std()"
* "fBodyBodyGyroJerkMag-mean()"
* "fBodyBodyGyroJerkMag-std()"

## Transformations

* Test and training subject id's from the source data have been merged (`subject_*.txt`)
* Set the column name to `Subject`
* Test and training activities from the source data (`y_*.txt`) have been merged
* Set descriptive activity names by resolving the activity labels (`activity_labels.txt`)
* Set the column name to `Activity`
* Test and training data/features from the source data (`X_*.txt`) have been merged
* Filtered the feature measurements (using feature descriptions in `features.txt`) to contain only the mean & standard deviation feature vectors