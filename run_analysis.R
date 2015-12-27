library(plyr)

unzipFolder = "./downloaded/UCI HAR Dataset"
fileName = "./downloaded/Dataset.zip"
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


## download the file if not already downloaded

if(!file.exists(fileName)){
  if(!file.exists("./downloaded")){
    dir.create("./downloaded")
  }
  download.file(url = url, destfile = fileName)
}

## unzip the file if not already unzipped

if(!file.exists(unzipFolder)){
  unzip(fileName, exdir = "./downloaded")
}

# 1. Merge training & test data sets
# Measurements (X_*txt)
test <- read.table(paste(unzipFolder, "test/X_test.txt", sep="/"))
train <- read.table(paste(unzipFolder, "train/X_train.txt", sep="/"))
data <- rbind(test, train)

# Activities (y_*.txt)
test <- read.table(paste(unzipFolder, "test/y_test.txt", sep="/"))
train <- read.table(paste(unzipFolder, "train/y_train.txt", sep="/"))
activities <- rbind(test, train)

# Subjects (subject_*.txt)
test <- read.table(paste(unzipFolder, "test/subject_test.txt", sep="/"))
train <- read.table(paste(unzipFolder, "train/subject_train.txt", sep="/"))
subjects <- rbind(test, train)

rm(test, train)

# 2. Extract the mean and standard deviation for each measurement
features <- read.table(paste(unzipFolder, "features.txt", sep="/"))
colnames(data) <- features[, 2]

# subset measurements with only mean & std columns
data <- data[, grep("-mean\\(\\)|-std\\(\\)", features[, 2])]

#rm(features)


# 3. Descriptive activity names
activityLabels <- read.table(paste(unzipFolder, "activity_labels.txt", sep="/"))

# Lookup activity label by id
activities[, 1] <- activityLabels[activities[, 1], 2]


# 4. Appropriately labels the data set with descriptive variable names

colnames(subjects) <- "Subject"
colnames(activities) <- "Activity"


# merge into one data set
tidyData <- cbind(subjects, activities, data)

# 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.
excludedCols <- which(names(tidyData) %in% c("Subject", "Activity"))

# Calculate mean for all columns except Subject & Activity
tidyDataAvg <- ddply(tidyData, .(Subject, Activity), .fun=function(x){ colMeans(x[, -excludedCols]) })

write.table(tidyDataAvg, "clean_and_tidy_avg.txt", row.names=FALSE)

