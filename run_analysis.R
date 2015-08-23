library(data.table)

# step 4:
# Appropriately labels the data set with descriptive variable names. 
a <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)[, 2]


# read data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
            stringsAsFactor = FALSE, col.names = a)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
            stringsAsFactor = FALSE, col.names = "active")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
            stringsAsFactor = FALSE, col.names = "subject")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
            stringsAsFactor = FALSE, col.names = a)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
            stringsAsFactor = FALSE, col.names = "active")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
            stringsAsFactor = FALSE, col.names = "subject")


# step 1:
# Merges the training and the test sets to create one data set.
y <- cbind(rbind(X_train, X_test),
           rbind(y_train, y_test),
           rbind(subject_train, subject_test))


# step 3:
# Uses descriptive activity names to name the activities in the data set
y$active <- factor(y$active, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


# step 2:
# Extracts only the measurements on the mean and standard deviation for each measurement. 
#k <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240, 241, 253:254, 266:271, 294:296, 345:350, 373:375, 424:429, 452:454, 503:504, 513, 516:517, 526, 529:530, 539, 542:543, 552)
#yy = y[, k]

# i am confused about these question, which col is the question asked
yy = y[, 1:6]


# step 5:
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(y[, 1:561],
                       by = list(active = y$active, subject = y$subject),
                       mean)
write.table(a, "tidy.txt", row.name = FALSE)
