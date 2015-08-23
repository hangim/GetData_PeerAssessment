library(data.table)


# get data path, in order to cross platform
get_path <- function(...) {
    file.path("UCI HAR Dataset", ...)
}


# read data
train.subject <- read.table(get_path("train", "subject_train.txt"),
                            stringsAsFactor = FALSE, col.names = "subject")
train.y       <- read.table(get_path("train", "y_train.txt"),
                            stringsAsFactor = FALSE, col.names = "activity")
train.X       <- read.table(get_path("train", "X_train.txt"),
                            stringsAsFactor = FALSE)

test.subject  <- read.table(get_path("test", "subject_test.txt"),
                            stringsAsFactor = FALSE, col.names = "subject")
test.y        <- read.table(get_path("test", "y_test.txt"),
                            stringsAsFactor = FALSE, col.names = "activity")
test.X        <- read.table(get_path("test", "X_test.txt"),
                            stringsAsFactor = FALSE)

features      <- read.table(get_path("features.txt"),
                            stringsAsFactors = FALSE)
labels        <- read.table(get_path("activity_labels.txt"),
                            stringsAsFactors = FALSE)


# step 1:
# Merges the training and the test sets to create one data set.
HAR.data <- cbind(rbind(train.subject, test.subject),
                  rbind(train.y, test.y),
                  rbind(train.X, test.X))


# step 2:
# Extracts only the measurements on the mean and standard deviation for each measurement. 
features.sub <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
HAR.data.sub <- HAR.data[, c(1:2, features.sub$V1 + 3)]


# step 3:
# Uses descriptive activity names to name the activities in the data set
HAR.data.sub$activity <- labels[HAR.data.sub$activity, 2]


# step 4:
# Appropriately labels the data set with descriptive variable names. 
colnames(HAR.data.sub) <- c("subject", "activity", features.sub$V2)


# step 5:
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
HAR.data.tidy <- aggregate(HAR.data.sub[, 3:ncol(HAR.data.sub)],
                           by = list(subject = HAR.data.sub$subject,
                                     activity = HAR.data.sub$activity),
                           mean)


# write the tidy data to file
write.table(HAR.data.tidy, get_path("tidy.txt"), row.name = FALSE)

