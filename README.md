# getdata-031/human_grading

Hello, thanks you for review my project.

As a Chinese student, i'm not well at English writing, so this doucument maybe fill with spell and grammer error, sorry about it.


# requirements

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# my step record

For this project, firstly should download the data.zip and extract it in the floder.

### prepare read data

In `run_analysis.R`, i firstly define a function called `get_path` to deal with the file path of different platflorm.

Then, i use `read.table` to read all of data, features and labels.

### step 1

I use `rbind` and `cbind` to merge the training and the test sets.

### step 2

This step, firstly i notice there are many columns include `mean` and `std`, so i just list all index about these columns to get `mean` and `standard deviation`.

But it isn't a elegant implement, so i change to use `Regular Expression` to extract them.

### step 3

In this step, just need to change the activity from numeric to string.

### step 4

Like step 3, but be careful the first two column are `subject` and `activity`.

### step 5

I use `aggregate` to split the data into 180 parts and compute mean for each.

### write data

I use `write.table` to write the data into `tidy.txt`, so you can read it by use `read.table`.


# 

Thanks you for read this. (*´∀`)~♥
