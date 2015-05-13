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
