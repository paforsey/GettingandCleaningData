#  GettingandCleaningData
 Getting and Cleaning Data Course Project


Script Description

The script run_analysis.R performs the following operations:
1 )  Installs and loads plyr and dplyr packages.
2 )  Downloads and unzips Samsung compressed data file into working directory.
3 )  Reads data from activity_labels.txt file into dataframe "Activities".
4 )  Reads data from features.txt file into vector called "Features".
5 )  Reads data from subject_train.txt, y_train.txt, and x_train.txt files and combines data into dataframe called "Training".
6 )  Reads data from subject_test.txt, y_test.txt, and x_test.txt files and combines data into dataframe called "Testing".
7 )  Combines Training and Testing datasets into a single dataframe called "MergedDataset".
8 )  Removes unnecessary variable columns from MergedDataset to create the first of two outputs called "FirstDataset".
9 )  Calculates the average for each variable by Subject and Activity from FirstDataset to create the second of two outputs
     called "SecondDataset".
10)  Saves FirstDataset and SecondDataset to the working directory in both csv and txt file formats.

