#Getting and Cleaning Data Course at Coursera - Final Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
###About the data
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the Getting and Cleaning Data course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

And here is the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###About this repository
In this repository you will find:

1. A file called **CodeBook.md** that describes the variables, the data, and any transformations or work that was performed to clean up the data.
2. The script **run_analysis.R**, that can be launched in RStudio by just importing the file. This file contains code that does the following:
  - Downloads the dataset if it doesn't already exist in the working directory. 
  - Merges the training and the test sets to create one data set. 
  - Extracts only the measurements on the mean and standard deviation for each measurement. 
  - Uses descriptive activity names to name the activities in the data set 
  - Appropriately labels the data set with descriptive variable names. The output is stored in a text file named tidy_data.txt.
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
3. The file **tidy_data.txt**, obtained as a result of running *run_analysis.R*.
