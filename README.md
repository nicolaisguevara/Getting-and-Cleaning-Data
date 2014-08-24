
  #Getting and Cleaning Data Project 
  
  ##Introduction

  This repository contain an script to generate a tidy data from the Human Activity Recognition Using Smartphones Data Set available at
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

  ##About the script

  The script run_analysis.R does the following: 
 
  1) Merges the training and the test sets to create one data set. 
  2) Extracts only the measurements on the mean and standard deviation for each measurement.
  3) Uses descriptive activity names to name the activities in the data set   
  4) Appropriately labels the data set with descriptive variable names.    
  5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 

## About the tidy data
If you want to read only few lines and columns of the tidy data set (tidyData.txt) you can use the following command line:

cat  tidyData.txt | awk '{print $1, $2, $3 , $4}' | head -n 25

This command line will show you the first 25 lines of the first 4 columns of tidyData.txt.
The tidy data can also be found in this repository.


## About the Code book
The data used in this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone (for details, see link above).
A full description of variables can be found at the codebook.md



