# Import dplyr
library(dplyr)

#Set dataset path and read data
datapath <- ".//UCI HAR Dataset"
xtest <- read.table(paste(datapath, "test", "X_test.txt", sep = "\\"))
ytest <- read.table(paste(datapath, "test", "y_test.txt", sep = "\\"))
xtrain <- read.table(paste(datapath, "train", "X_train.txt", sep = "\\"))
ytrain <- read.table(paste(datapath, "train", "y_train.txt", sep = "\\"))

# 1. Merge dataset
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)

# Remove unused data
rm(xtest, ytest, xtrain, ytrain)


# 2. Extracts mean and SD measurement

# Get features name data
features <- read.table(paste(datapath, "features.txt", sep = "\\"))

# Replace variable names with descriptive features name
names(x) <- features$V2

# Remove unused data
rm(features)
    
# Extract variables
x <- select(x, contains(c("mean()", "std")))

# 3. Uses descriptive activity names to name the activities in the data set

#read activity labels data
activitylabels <- read.table(paste(datapath, "activity_labels.txt", sep = "\\"))

#map activity numeric label to the descriptive activity names
x$activity <- activitylabels[y$V1, 2]

    # Remove unused data
rm(activitylabels, y)

# 4. Appropriately labels the data set with descriptive variable names

# all lowercase
names(x) <- tolower(names(x))

# descriptive
names(x) <- sub("tbody", "timebody", names(x))
names(x) <- sub("tgravity", "timegravity", names(x))
names(x) <- sub("fbody", "freqbody", names(x))
names(x) <- sub("fgravity", "freqgravity", names(x))
names(x) <- gsub("acc", "acceleration", names(x))
names(x) <- gsub("mag", "magnitude", names(x))

# contain no underscores/dot/space
names(x) <- gsub("-", "", names(x))
names(x) <- gsub("\\()", "", names(x))

# 5. Independent tidy data set with the average of each variable 

#    for each activity and each subject
xmean <- aggregate(x[, !names(x) %in% "activity"], list(x$activity), mean)

# Write tidy data and mean summary to the csv files
dir.create(file.path(".\\output"), showWarnings = FALSE)
write.table(x, ".\\output\\x.txt", row.names = FALSE)
write.table(xmean, ".\\output\\xmean.txt", row.names = FALSE)
