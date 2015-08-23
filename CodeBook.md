Hello, thans you for review my project.

As a Chinese student, i'm not well at English writing, so this doucument maybe fill with spell and grammer error, sorry about it.

#

For this project, firstly should download the data.zip and extract it in the floder.

You can execute `run_analysis.R` to view result.

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
