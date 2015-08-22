# read data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
            stringsAsFactor = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
            stringsAsFactor = FALSE, col.names = "y")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
            stringsAsFactor = FALSE, col.names = "subject")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
            stringsAsFactor = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
            stringsAsFactor = FALSE, col.names = "y")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
            stringsAsFactor = FALSE, col.names = "subject")

# merge them
y <- cbind(rbind(X_train, X_test),
           rbind(y_train, y_test),
           rbind(subject_train, subject_test))

