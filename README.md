#  Getting and Cleaning Data Course Project


#  Script Description

The script run_analysis.R performs the following operations:
1 )  Installs and loads plyr and dplyr packages.
2 )  Downloads and unzips Samsung compressed data file into working directory.
3 )  Reads data from activity_labels.txt file into dataframe "Activities".
4 )  Reads data from features.txt file into vector called "Features".
5 )  Reads data from subject_train.txt, y_train.txt, and x_train.txt files and combines data into dataframe called
     "Training".
6 )  Reads data from subject_test.txt, y_test.txt, and x_test.txt files and combines data into dataframe called "Testing".
7 )  Combines Training and Testing datasets into a single dataframe called "MergedDataset".
8 )  Removes unnecessary variable columns from MergedDataset to create the first of two outputs called "FirstDataset".
9 )  Calculates the average for each variable by Subject and Activity from FirstDataset to create the second of two outputs
     called "SecondDataset".
10)  Saves FirstDataset and SecondDataset to the working directory in both csv and txt file formats.


#  Code Book

Descriptions of the variables contained in the FirstDataset are as follows:

1 )  Subject: Unique identifier used for each of the 30 volunteers.  Preset Integer Values: 1 - 30.
2 )  Activity: type of activity performed by each subject.  Preset Character Values: WALKING, WALKING_UPSTAIRS,
     WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. 
3 ) 	tBodyAcc-std()-X:  
4 ) 	tBodyAcc-std()-Y:  
5 ) 	tBodyAcc-std()-Z:  
6 ) 	tGravityAcc-std()-X:  
7 ) 	tGravityAcc-std()-Y:  
8 ) 	tGravityAcc-std()-Z:  
9 ) 	tBodyAccJerk-std()-X:  
10) 	tBodyAccJerk-std()-Y:  
11) 	tBodyAccJerk-std()-Z:  
12) 	tBodyGyro-std()-X:  
13) 	tBodyGyro-std()-Y:  
14) 	tBodyGyro-std()-Z:  
15) 	tBodyGyroJerk-std()-X:  
16) 	tBodyGyroJerk-std()-Y:  
17) 	tBodyGyroJerk-std()-Z:  
18) 	tBodyAccMag-std():  
19) 	tGravityAccMag-std():  
20) 	tBodyAccJerkMag-std():  
21) 	tBodyGyroMag-std():  
22) 	tBodyGyroJerkMag-std():  
23) 	fBodyAcc-std()-X:  
24) 	fBodyAcc-std()-Y:  
25) 	fBodyAcc-std()-Z:  
26) 	fBodyAccJerk-std()-X:  
27) 	fBodyAccJerk-std()-Y:  
28) 	fBodyAccJerk-std()-Z:  
29) 	fBodyGyro-std()-X:  
30) 	fBodyGyro-std()-Y:  
31) 	fBodyGyro-std()-Z:  
32) 	fBodyAccMag-std():  
33) 	fBodyBodyAccJerkMag-std():  
34) 	fBodyBodyGyroMag-std():  
35) 	fBodyBodyGyroJerkMag-std():  
36) 	tBodyAcc-mean()-X:  
37) 	tBodyAcc-mean()-Y:  
38) 	tBodyAcc-mean()-Z:  
39) 	tGravityAcc-mean()-X:  
40) 	tGravityAcc-mean()-Y:  
41) 	tGravityAcc-mean()-Z:  
42) 	tBodyAccJerk-mean()-X:  
43) 	tBodyAccJerk-mean()-Y:  
44) 	tBodyAccJerk-mean()-Z:  
45) 	tBodyGyro-mean()-X:  
46) 	tBodyGyro-mean()-Y:  
47) 	tBodyGyro-mean()-Z:  
48) 	tBodyGyroJerk-mean()-X:  
49) 	tBodyGyroJerk-mean()-Y:  
50) 	tBodyGyroJerk-mean()-Z:  
51) 	tBodyAccMag-mean():  
52) 	tGravityAccMag-mean():  
53) 	tBodyAccJerkMag-mean():  
54) 	tBodyGyroMag-mean():  
55) 	tBodyGyroJerkMag-mean():  
56) 	fBodyAcc-mean()-X:  
57) 	fBodyAcc-mean()-Y:  
58) 	fBodyAcc-mean()-Z:  
59) 	fBodyAcc-meanFreq()-X:  
60) 	fBodyAcc-meanFreq()-Y:  
61) 	fBodyAcc-meanFreq()-Z:  
62) 	fBodyAccJerk-mean()-X:  
63) 	fBodyAccJerk-mean()-Y:  
64)  fBodyAccJerk-mean()-Z:  
65) 	fBodyAccJerk-meanFreq()-X:  
66) 	fBodyAccJerk-meanFreq()-Y:  
67) 	fBodyAccJerk-meanFreq()-Z:  
68) 	fBodyGyro-mean()-X:  
69) 	fBodyGyro-mean()-Y:  
70) 	fBodyGyro-mean()-Z:  
71) 	fBodyGyro-meanFreq()-X:  
72) 	fBodyGyro-meanFreq()-Y:  
73) 	fBodyGyro-meanFreq()-Z:  
74) 	fBodyAccMag-mean():  
75) 	fBodyAccMag-meanFreq():  
76) 	fBodyBodyAccJerkMag-mean():  
77) 	fBodyBodyAccJerkMag-meanFreq():  
78) 	fBodyBodyGyroMag-mean():  
79) 	fBodyBodyGyroMag-meanFreq():  
80) 	fBodyBodyGyroJerkMag-mean():  
81) 	fBodyBodyGyroJerkMag-meanFreq():  


#   Getting and Cleaning Data Course 
#   Week #3 Project: The goal is to prepare tidy data that can be used for later
#   analysis.

#   Create one R script called run_analysis.R that does the following:
#   1.  Merges the training and the test sets to create one data set.
#   2.  Extracts only the measurements on the mean and standard deviation for
#       each measurement.
#   3.  Uses descriptive activity names to name the Activities in the data set.
#   4.  Appropriately labels the data set with descriptive variable names. 
#   5.  From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject.


#   Install & Load Packages
    if(!is.element("plyr", installed.packages()[, 1])){
        install.packages("plyr")}
    library(plyr)

    if(!is.element("dplyr", installed.packages()[, 1])){
        install.packages("dplyr")}
    library(dplyr)


#   Download & Unzip Data Files
    file.location = paste("https://d396qusza40orc.cloudfront.net/",
        "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", sep="")
    file.name = "data.zip"

    if(!file.exists(file.name)){
        download.file(file.location, file.name, mode="wb")
        unzip("data.zip")
    }

    suppressWarnings(rm(file.location, file.name)) # Remove Unused Objects

    
#   Activities: Read Text File & Create Dataframe
    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/activity_labels.txt", sep="")
    Activities = read.table(file.name, header=F)
    colnames(Activities) <- c("ActivityId" ,"Activity") # Add Column Names


#   Features: Read Text File & Create Vector
    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/features.txt", sep="")
    Features = read.table(file.name, header=F)
    Features = as.vector(Features[, 2]) # Convert Dataframe to Vector


#   Training Data: Subjects, Features, & Training Datasets
    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/train/subject_train.txt", sep="")
    subject.train = read.table(file.name, header=F)
    colnames(subject.train) <- c("Subject") # Add Column Name
    subject.train = mutate(
        subject.train, id=rownames(subject.train)) # Add id Colmun
    subject.train = select(subject.train, id, Subject) # Reorder Columns

    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/train/y_train.txt", sep="")
    y.train = read.table(file.name, header=F)
    colnames(y.train) <- c("ActivityId") # Add Column Name
    y.train = join(x=y.train, y=Activities, by="ActivityId", type="left")
    y.train = mutate(y.train, id=rownames(y.train)) # Add id Colmun
    y.train = select(y.train, id, Activity) # Reorder Columns

    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/train/X_train.txt", sep="")
    x.train = read.table(file.name, header=F)
    x.train = mutate(x.train, id=rownames(x.train)) # Add id Colmun
    colnames(x.train) <- c(Features, "id") # Add Column Names
    x.train = x.train[, c(562, 1:561)] # Reorder Columns
    
    Training.List = list(subject.train, y.train, x.train) # List of Data Frames
    Training = join_all(Training.List) # Joining All Training Data

    
#   Test Data: Subjects, Features, & Test Datasets
    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/test/subject_test.txt", sep="")    
    subject.test = read.table(file.name, header=F)
    colnames(subject.test) <- c("Subject") # Add Column Name
    subject.test = mutate(
        subject.test, id=rownames(subject.test)) # Add id Colmun
    subject.test = select(subject.test, id, Subject) # Reorder Columns

    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/test/y_test.txt", sep="")   
    y.test = read.table(file.name, header=F)
    colnames(y.test) <- c("ActivityId") # Add Column Name
    y.test = join(x=y.test, y=Activities, by="ActivityId", type="left")
    y.test = mutate(y.test, id=rownames(y.test)) # Add id Colmun
    y.test = select(y.test, id, Activity) # Reorder Columns

    file.name = paste("~/Coursera/Getting and Cleaning Data - Johns Hopkins/",
        "UCI HAR Dataset/test/X_test.txt", sep="")   
    x.test = read.table(file.name, header=F)
    x.test = mutate(x.test, id=rownames(x.test)) # Add id Colmun
    colnames(x.test) <- c(Features, "id") # Add Column Names
    x.test = x.test[ ,c(562, 1:561)] # Reorder Columns
    
    Testing.List = list(
        subject.test, y.test, x.test) # Construct List of Data Frames
    Testing = join_all(Testing.List) # Joining All Training Data


#   Remove Unused Objects
    suppressWarnings(
        rm(list=setdiff(ls(), c("Training", "Testing")))
    )


#   Merge Training & Test to Create One Dataset
    MergedDataset = merge(Training, Testing, all=T)
    MergedDataset = MergedDataset[, -1] # Drop id Column

    
    #   Dataset #1
        FirstDataset = MergedDataset[,c(1,2,grep("std",colnames(MergedDataset)), 
            grep("mean", colnames(MergedDataset)))]
        
        FirstDataset = FirstDataset[ # Order Dataset by Subject & Activity
            order(FirstDataset$Subject, FirstDataset$Activity),] 
        rownames(FirstDataset) <- NULL # Remove Row Names
    
        write.csv(FirstDataset, "FirstDataset.csv", row.names=F) # Save Dataset #1
        write.table(FirstDataset, "FirstDataset.txt", row.names=F) # Save Dataset #1
    
    
    #   Dataset #2
        SecondDataset = ddply(FirstDataset, .(Subject, Activity), 
            .fun=function(x){colMeans(x[, -c(1:2)])})

        SecondDataset = SecondDataset[ # Order Dataset by Subject & Activity
            order(SecondDataset$Subject, SecondDataset$Activity),]
        rownames(SecondDataset) <- NULL # Remove Row Names
    
        write.csv(SecondDataset, "SecondDataset.csv", row.names=F) # Save Dataset #2
        write.table(SecondDataset, "SecondDataset.txt", row.names=F) # Save Dataset #2
    
    
#   Remove Unused Objects
    suppressWarnings(
        rm(list=setdiff(ls(), c("FirstDataset", "SecondDataset")))
    )
    
