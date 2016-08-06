library(reshape2) ##load the required packages 
filename <- "getdata_projectfiles_Dataset.zip"
# Download the files 
if (!file.exists(filename)) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method = 'curl')
}
# unzip the file 
if (!file.exists("UCI HAR Dataset")) {
        unzip(filename)
}
# Load activity labels 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names= c("activity_id", "activity_name"))
activityLabels[,2] <- as.character(activityLabels[,2])
# Load features 
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Load the datasets 
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
 colnames(test_x) <- features[,2]
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
 colnames(test_y) <- "activity_id"
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
 colnames(subject_test) <- "subject_id"
test <- cbind(test_x, test_y, subject_test)
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
 colnames(train_x) <- features[,2]
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
 colnames(train_y) <- "activity_id"
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
 colnames(subject_train) <- "subject_id"
train <- cbind(train_x, train_y, subject_train)

# Combine test and train data into one dataset
allData <- rbind(test, train)

# Extracts only the measurements on the mean and standard deviation for each measurement 
mean_col_idx <- grep("mean", names(allData), ignore.case=T)
mean_col_names <- names(allData)[mean_col_idx]
std_col_idx <- grep("std", names(allData), ignore.case= T)
std_col_names <- names(allData)[std_col_idx]
meanstddata <- allData[,c("subject_id", "activity_id", mean_col_names, std_col_names)]

# Merge the datasets to get one datasat with descriptive activity names 
desNames <- merge(activityLabels, meanstddata, by.x="activity_id", by.y="activity_id", all= T)

# Melt the dataset 
data_melt <- melt(desNames, id= c("activity_id", "activity_name", "subject_id"))

# cast the dataset according to the mean of each variable for each subject and activity
mean_data <- dcast(data_melt, activity_id + activity_name + subject_id ~ variable, mean)

# create a second file for the tidy dateset 
write.table(mean_data, "./tidy.txt")



