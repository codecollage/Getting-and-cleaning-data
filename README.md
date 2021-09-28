Project assignment for Getting and Cleaning Data Course week 4
Purpose: prepare tidy data that can be used for later analysis.

Data Source
===========
Human Activity Recognition Using Smartphones Dataset downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 
Full description: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.


Files:
======
- CodeBook.md: describes the variables.

- download_extract.R : an R script to download dataset

- run_analysis.R: an R script to clean up the dataset and summarize data with output files saved to "output" folder.

Dependencies
============
run_analysis.R uses dplyr package. To install run:
`install.packages("dplyr")`


Download and Extract Original Dataset
=====================================
If dataset is not downloaded yet, do this steps:
1. To download raw data and extract the zip file run the this script on R console:

`source(download_extract.R)`

2. Dataset will be extracted to folder "UCI HAR Dataset".

Clean up and Analysis
=====================
1. Running the `source(download_extract.R)` will merge and clean up the datasets with following transformations:
  - read train and test data from "UCI HAR Dataset" folder
  - Merge train and test dataset.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set by mapping numeric label from y_train and y_test to the activity_labels data.
  - Appropriately labels the data set with descriptive variable names with following criteria: all lowercase, descriptive (t: time, f: freq, acc: acceleration, mag: magnitude), contain no underscores/dot/space.
2. From the tidy dataset above, a second, independent tidy data set with the average of each variable for each activity and each subject is created.
3. Output files are saved into txt format in the "output" folder.

Outputs:
========
1. "x.txt" is the merged and tidied dataset from train and test dataset. Read CodeBook.md  that describes the variables, the data, and any transformations or work performed to clean up the data.
2. "xmean.txt" is a summary of the average of each variable accross activities group.


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
