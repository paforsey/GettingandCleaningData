#   Getting & Cleaning Data Course Project


##  Script Description

The script run_analysis.R performs the following operations:  
1 )  Installs and loads plyr and dplyr packages.  
2 )  Downloads and unzips Samsung compressed data file into working directory.  
3 )  Reads data from activity_labels.txt file into dataframe "Activities".  
4 )  Reads data from features.txt file into vector called "Features".  
5 )  Reads data from subject_train.txt, y_train.txt, and x_train.txt files and combines data into dataframe called "Training".  
6 )  Reads data from subject_test.txt, y_test.txt, and x_test.txt files and combines data into dataframe called "Testing".  
7 )  Combines Training and Testing datasets into a single dataframe called "MergedDataset".  
8 )  Removes unnecessary variable columns from MergedDataset to create the first of two outputs called "FirstDataset".  
9 )  Calculates the average for each variable by Subject and Activity from FirstDataset to create a second dataset called "SecondDataset".    
10)  Saves FirstDataset and SecondDataset to the working directory in both csv and txt file formats.  


##  Code Book

Descriptions of the variables contained in the FirstDataset are as follows:

1 )  Subject: Unique identifier used for each of the 30 volunteers.  Preset Integer Values: 1 - 30.  
2 )  Activity: Type of activity performed by each subject.  Preset Character Values: WALKING, WALKING_UPSTAIRS,  
     WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.  
3 ) 	tBodyAcc-std()-X: Standard deviation estimated from signal.  
4 ) 	tBodyAcc-std()-Y: Standard deviation estimated from signal.  
5 ) 	tBodyAcc-std()-Z: Standard deviation estimated from signal.  
6 ) 	tGravityAcc-std()-X: Standard deviation estimated from signal.  
7 ) 	tGravityAcc-std()-Y: Standard deviation estimated from signal.  
8 ) 	tGravityAcc-std()-Z: Standard deviation estimated from signal.  
9 ) 	tBodyAccJerk-std()-X: Standard deviation estimated from signal.  
10) 	tBodyAccJerk-std()-Y: Standard deviation estimated from signal.  
11) 	tBodyAccJerk-std()-Z: Standard deviation estimated from signal.  
12) 	tBodyGyro-std()-X: Standard deviation estimated from signal.  
13) 	tBodyGyro-std()-Y: Standard deviation estimated from signal.  
14) 	tBodyGyro-std()-Z: Standard deviation estimated from signal.  
15) 	tBodyGyroJerk-std()-X: Standard deviation estimated from signal.  
16) 	tBodyGyroJerk-std()-Y: Standard deviation estimated from signal.  
17) 	tBodyGyroJerk-std()-Z: Standard deviation estimated from signal.  
18) 	tBodyAccMag-std(): Standard deviation estimated from signal.  
19) 	tGravityAccMag-std(): Standard deviation estimated from signal.  
20) 	tBodyAccJerkMag-std(): Standard deviation estimated from signal.  
21) 	tBodyGyroMag-std(): Standard deviation estimated from signal.  
22) 	tBodyGyroJerkMag-std(): Standard deviation estimated from signal.  
23) 	fBodyAcc-std()-X: Standard deviation estimated from signal.  
24) 	fBodyAcc-std()-Y: Standard deviation estimated from signal.  
25) 	fBodyAcc-std()-Z: Standard deviation estimated from signal.  
26) 	fBodyAccJerk-std()-X: Standard deviation estimated from signal.  
27) 	fBodyAccJerk-std()-Y: Standard deviation estimated from signal.  
28) 	fBodyAccJerk-std()-Z: Standard deviation estimated from signal.  
29) 	fBodyGyro-std()-X: Standard deviation estimated from signal.  
30) 	fBodyGyro-std()-Y: Standard deviation estimated from signal.  
31) 	fBodyGyro-std()-Z: Standard deviation estimated from signal.  
32) 	fBodyAccMag-std(): Standard deviation estimated from signal.  
33) 	fBodyBodyAccJerkMag-std(): Standard deviation estimated from signal.  
34) 	fBodyBodyGyroMag-std(): Standard deviation estimated from signal.  
35) 	fBodyBodyGyroJerkMag-std(): Standard deviation estimated from signal.  
36) 	tBodyAcc-mean()-X: Mean value estimated from signal.  
37) 	tBodyAcc-mean()-Y: Mean value estimated from signal.  
38) 	tBodyAcc-mean()-Z: Mean value estimated from signal.  
39) 	tGravityAcc-mean()-X: Mean value estimated from signal.  
40) 	tGravityAcc-mean()-Y: Mean value estimated from signal.  
41) 	tGravityAcc-mean()-Z: Mean value estimated from signal.  
42) 	tBodyAccJerk-mean()-X: Mean value estimated from signal.  
43) 	tBodyAccJerk-mean()-Y: Mean value estimated from signal.  
44) 	tBodyAccJerk-mean()-Z: Mean value estimated from signal.  
45) 	tBodyGyro-mean()-X: Mean value estimated from signal.  
46) 	tBodyGyro-mean()-Y: Mean value estimated from signal.  
47) 	tBodyGyro-mean()-Z: Mean value estimated from signal.  
48) 	tBodyGyroJerk-mean()-X: Mean value estimated from signal.  
49) 	tBodyGyroJerk-mean()-Y: Mean value estimated from signal.  
50) 	tBodyGyroJerk-mean()-Z: Mean value estimated from signal.  
51) 	tBodyAccMag-mean(): Mean value estimated from signal.  
52) 	tGravityAccMag-mean(): Mean value estimated from signal.  
53) 	tBodyAccJerkMag-mean(): Mean value estimated from signal.  
54) 	tBodyGyroMag-mean(): Mean value estimated from signal.  
55) 	tBodyGyroJerkMag-mean(): Mean value estimated from signal.  
56) 	fBodyAcc-mean()-X: Mean value estimated from signal.  
57) 	fBodyAcc-mean()-Y: Mean value estimated from signal.  
58) 	fBodyAcc-mean()-Z: Mean value estimated from signal.  
59) 	fBodyAcc-meanFreq()-X: Mean value estimated from signal.  
60) 	fBodyAcc-meanFreq()-Y: Mean value estimated from signal.  
61) 	fBodyAcc-meanFreq()-Z: Mean value estimated from signal.  
62) 	fBodyAccJerk-mean()-X: Mean value estimated from signal.  
63) 	fBodyAccJerk-mean()-Y: Mean value estimated from signal.  
64)  fBodyAccJerk-mean()-Z: Mean value estimated from signal.  
65) 	fBodyAccJerk-meanFreq()-X: Mean value estimated from signal.  
66) 	fBodyAccJerk-meanFreq()-Y: Mean value estimated from signal.  
67) 	fBodyAccJerk-meanFreq()-Z: Mean value estimated from signal.  
68) 	fBodyGyro-mean()-X: Mean value estimated from signal.  
69) 	fBodyGyro-mean()-Y: Mean value estimated from signal.  
70) 	fBodyGyro-mean()-Z: Mean value estimated from signal.  
71) 	fBodyGyro-meanFreq()-X: Mean value estimated from signal.  
72) 	fBodyGyro-meanFreq()-Y: Mean value estimated from signal.  
73) 	fBodyGyro-meanFreq()-Z: Mean value estimated from signal.  
74) 	fBodyAccMag-mean(): Mean value estimated from signal.  
75) 	fBodyAccMag-meanFreq(): Mean value estimated from signal.  
76) 	fBodyBodyAccJerkMag-mean(): Mean value estimated from signal.  
77) 	fBodyBodyAccJerkMag-meanFreq(): Mean value estimated from signal.  
78) 	fBodyBodyGyroMag-mean(): Mean value estimated from signal.  
79) 	fBodyBodyGyroMag-meanFreq(): Mean value estimated from signal.  
80) 	fBodyBodyGyroJerkMag-mean(): Mean value estimated from signal.  
81) 	fBodyBodyGyroJerkMag-meanFreq(): Mean value estimated from signal.  

