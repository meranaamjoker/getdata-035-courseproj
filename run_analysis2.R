library(plyr)

if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile="data.zip")
  unzip("data.zip")  
}

baseDir <- "UCI HAR Dataset"

# 1. Merge training & test data sets

# Measurements (X_*txt)
test <- read.table(paste(baseDir, "test/X_test.txt", sep="/"))
train <- read.table(paste(baseDir, "train/X_train.txt", sep="/"))
data <- rbind(test, train)

# Activities (y_*.txt)
test <- read.table(paste(baseDir, "test/y_test.txt", sep="/"))
train <- read.table(paste(baseDir, "train/y_train.txt", sep="/"))
activities <- rbind(test, train)

# Subjects (subject_*.txt)
test <- read.table(paste(baseDir, "test/subject_test.txt", sep="/"))
train <- read.table(paste(baseDir, "train/subject_train.txt", sep="/"))
subjects <- rbind(test, train)

rm(test, train)

# 2. Extract the mean and standard deviation for each measurement

features <- read.table(paste(baseDir, "features.txt", sep="/"))
colnames(data) <- features[, 2]

# subset measurements with only mean & std columns
data <- data[, grep("-mean\\(\\)|-std\\(\\)", features[, 2])]

#rm(features)

# 3. Descriptive activity names
activityLabels <- read.table(paste(baseDir, "activity_labels.txt", sep="/"))

# Lookup activity label by id
activities[, 1] <- activityLabels[activities[, 1], 2]

# 4. Appropriately labels the data set with descriptive variable names

colnames(subjects) <- "Subject"
colnames(activities) <- "Activity"

# merge into one data set
tidyData <- cbind(subjects, activities, data)
#write.table(tidyData, "har_tidy.txt")

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
excludedCols <- which(names(tidyData) %in% c("Subject", "Activity"))

# Calculate mean for all columns except Subject & Activity
tidyAvgData <- ddply(tidyData, .(Subject, Activity), .fun=function(x){ colMeans(x[, -excludedCols]) })
write.table(tidyAvgData, "tidydata.txt", row.names=FALSE)