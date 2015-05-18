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

### Background Information
  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
  
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
  
  
The following was provided for each record in the original dataset:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables.
* Its activity label. 
* An identifier of the subject who carried out the experiment.
  
  
### Feature Selection
  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  
  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  
  
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  
  
These signals were used to estimate variables of the feature vector for each pattern: ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. )  
* tBodyAcc-XYZ  
* tGravityAcc-XYZ  
* tBodyAccJerk-XYZ  
* tBodyGyro-XYZ  
* tBodyGyroJerk-XYZ  
* tBodyAccMag  
* tGravityAccMag  
* tBodyAccJerkMag  
* tBodyGyroMag  
* tBodyGyroJerkMag  
* fBodyAcc-XYZ  
* fBodyAccJerk-XYZ  
* fBodyGyro-XYZ  
* fBodyAccMag  
* fBodyAccJerkMag  
* fBodyGyroMag  
* fBodyGyroJerkMag  
  
The set of variables that were estimated from these signals are: 
* mean(): Mean value  
* std(): Standard deviation  
* mad(): Median absolute deviation   
* max(): Largest value in array  
* min(): Smallest value in array  
* sma(): Signal magnitude area  
* energy(): Energy measure. Sum of the squares divided by the number of values.   
* iqr(): Interquartile range   
* entropy(): Signal entropy  
* arCoeff(): Autorregresion coefficients with Burg order equal to 4  
* correlation(): correlation coefficient between two signals  
* maxInds(): index of the frequency component with largest magnitude  
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
* skewness(): skewness of the frequency domain signal   
* kurtosis(): kurtosis of the frequency domain signal   
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
* angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  
* gravityMean  
* tBodyAccMean  
* tBodyAccJerkMean  
* tBodyGyroMean  
* tBodyGyroJerkMean  
  
The complete list of the 81 variables of each feature vector used in the final dataset is available in in the next section: "Variable Descriptions."  
  
### Variable Descriptions
  
Descriptions of the variables contained in the FirstDataset are as follows:  
  
1 )  Subject: Unique identifier used for each of the 30 volunteers.  Preset Integer Values: 1 - 30.  
2 )  Activity: Type of activity performed by each subject.  Preset Character Values: WALKING, WALKING_UPSTAIRS,  
     WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.  
3 )  tBodyAcc-std()-X: Standard deviation estimated from signal.  
4 )  tBodyAcc-std()-Y: Standard deviation estimated from signal.  
5 )  tBodyAcc-std()-Z: Standard deviation estimated from signal.  
6 )  tGravityAcc-std()-X: Standard deviation estimated from signal.  
7 )  tGravityAcc-std()-Y: Standard deviation estimated from signal.  
8 )  tGravityAcc-std()-Z: Standard deviation estimated from signal.  
9 )  tBodyAccJerk-std()-X: Standard deviation estimated from signal.  
10)  tBodyAccJerk-std()-Y: Standard deviation estimated from signal.  
11)  tBodyAccJerk-std()-Z: Standard deviation estimated from signal.  
12)  tBodyGyro-std()-X: Standard deviation estimated from signal.  
13)  tBodyGyro-std()-Y: Standard deviation estimated from signal.  
14)  tBodyGyro-std()-Z: Standard deviation estimated from signal.  
15)  tBodyGyroJerk-std()-X: Standard deviation estimated from signal.  
16)  tBodyGyroJerk-std()-Y: Standard deviation estimated from signal.  
17)  tBodyGyroJerk-std()-Z: Standard deviation estimated from signal.  
18)  tBodyAccMag-std(): Standard deviation estimated from signal.  
19)  tGravityAccMag-std(): Standard deviation estimated from signal.  
20)  tBodyAccJerkMag-std(): Standard deviation estimated from signal.  
21)  tBodyGyroMag-std(): Standard deviation estimated from signal.  
22)  tBodyGyroJerkMag-std(): Standard deviation estimated from signal.  
23)  fBodyAcc-std()-X: Standard deviation estimated from signal.  
24)  fBodyAcc-std()-Y: Standard deviation estimated from signal.  
25)  fBodyAcc-std()-Z: Standard deviation estimated from signal.  
26)  fBodyAccJerk-std()-X: Standard deviation estimated from signal.  
27)  fBodyAccJerk-std()-Y: Standard deviation estimated from signal.  
28)  fBodyAccJerk-std()-Z: Standard deviation estimated from signal.  
29)  fBodyGyro-std()-X: Standard deviation estimated from signal.  
30)  fBodyGyro-std()-Y: Standard deviation estimated from signal.  
31)  fBodyGyro-std()-Z: Standard deviation estimated from signal.  
32)  fBodyAccMag-std(): Standard deviation estimated from signal.  
33)  fBodyBodyAccJerkMag-std(): Standard deviation estimated from signal.  
34)  fBodyBodyGyroMag-std(): Standard deviation estimated from signal.  
35)  fBodyBodyGyroJerkMag-std(): Standard deviation estimated from signal.  
36)  tBodyAcc-mean()-X: Mean value estimated from signal.  
37)  tBodyAcc-mean()-Y: Mean value estimated from signal.  
38)  tBodyAcc-mean()-Z: Mean value estimated from signal.  
39)  tGravityAcc-mean()-X: Mean value estimated from signal.  
40)  tGravityAcc-mean()-Y: Mean value estimated from signal.  
41)  tGravityAcc-mean()-Z: Mean value estimated from signal.  
42)  tBodyAccJerk-mean()-X: Mean value estimated from signal.  
43)  tBodyAccJerk-mean()-Y: Mean value estimated from signal.  
44)  tBodyAccJerk-mean()-Z: Mean value estimated from signal.  
45)  tBodyGyro-mean()-X: Mean value estimated from signal.  
46)  tBodyGyro-mean()-Y: Mean value estimated from signal.  
47)  tBodyGyro-mean()-Z: Mean value estimated from signal.  
48)  tBodyGyroJerk-mean()-X: Mean value estimated from signal.  
49)  tBodyGyroJerk-mean()-Y: Mean value estimated from signal.  
50)  tBodyGyroJerk-mean()-Z: Mean value estimated from signal.  
51)  tBodyAccMag-mean(): Mean value estimated from signal.  
52)  tGravityAccMag-mean(): Mean value estimated from signal.  
53)  tBodyAccJerkMag-mean(): Mean value estimated from signal.  
54)  tBodyGyroMag-mean(): Mean value estimated from signal.  
55)  tBodyGyroJerkMag-mean(): Mean value estimated from signal.  
56)  fBodyAcc-mean()-X: Mean value estimated from signal.  
57)  fBodyAcc-mean()-Y: Mean value estimated from signal.  
58)  fBodyAcc-mean()-Z: Mean value estimated from signal.  
59)  fBodyAcc-meanFreq()-X: Mean value estimated from signal.  
60)  fBodyAcc-meanFreq()-Y: Mean value estimated from signal.  
61)  fBodyAcc-meanFreq()-Z: Mean value estimated from signal.  
62)  fBodyAccJerk-mean()-X: Mean value estimated from signal.  
63)  fBodyAccJerk-mean()-Y: Mean value estimated from signal.  
64)  fBodyAccJerk-mean()-Z: Mean value estimated from signal.  
65)  fBodyAccJerk-meanFreq()-X: Mean value estimated from signal.  
66)  fBodyAccJerk-meanFreq()-Y: Mean value estimated from signal.  
67)  fBodyAccJerk-meanFreq()-Z: Mean value estimated from signal.  
68)  fBodyGyro-mean()-X: Mean value estimated from signal.  
69)  fBodyGyro-mean()-Y: Mean value estimated from signal.  
70)  fBodyGyro-mean()-Z: Mean value estimated from signal.  
71)  fBodyGyro-meanFreq()-X: Mean value estimated from signal.  
72)  fBodyGyro-meanFreq()-Y: Mean value estimated from signal.  
73)  fBodyGyro-meanFreq()-Z: Mean value estimated from signal.  
74)  fBodyAccMag-mean(): Mean value estimated from signal.  
75)  fBodyAccMag-meanFreq(): Mean value estimated from signal.  
76)  fBodyBodyAccJerkMag-mean(): Mean value estimated from signal.  
77)  fBodyBodyAccJerkMag-meanFreq(): Mean value estimated from signal.  
78)  fBodyBodyGyroMag-mean(): Mean value estimated from signal.  
79)  fBodyBodyGyroMag-meanFreq(): Mean value estimated from signal.  
80)  fBodyBodyGyroJerkMag-mean(): Mean value estimated from signal.  
81)  fBodyBodyGyroJerkMag-meanFreq(): Mean value estimated from signal.  
  
  
  
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.  

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
