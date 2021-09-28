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
3. Output files are saved into csv format in the "output" folder.


Variables
=========
1. activity: char with 6 categories of activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
2. 66 variables of only mean and standard deviation measurements extracted from original dataset measurements:
    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    - Triaxial Angular velocity from the gyroscope. 
    - The variables are categorised further to time and frequency (freq). 
    - An identifier of the subject who carried out the experiment.
    
Notes: read the "features_info.txt" on the original dataset in folder "UCI HAR Dataset" for full features description.
