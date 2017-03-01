library(plyr)

# Download and unzip the dataset in the working directory
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# The files in folder ‘UCI HAR Dataset’ that will be used are:
# SUBJECT FILES
# test/subject_test.txt
# train/subject_train.txt
# ACTIVITY FILES
# test/X_test.txt
# train/X_train.txt
# DATA FILES
# test/y_test.txt
# train/y_train.txt

# features.txt - Shows information about the variables used on the feature vector.
# activity_labels.txt - Links the class labels with their activity name.




# Step 1. Merge the train and test sets to create one data set

# Read the train tables
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read the test tables
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Create 'x' data set 
x_data <- rbind(x_train, x_test)

# Create 'y' data set
y_data <- rbind(y_train, y_test)

# Create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Step 2. Extract only the measurements of the mean and standard deviation 

# Get only columns with mean() or std() in their names
features <- read.table("UCI HAR Dataset/features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset the desired columns
x_data <- x_data[, mean_and_std_features]

# Correct the names
names(x_data) <- features[mean_and_std_features, 2]

# Step 3. Use descriptive names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# Correct column names
names(y_data) <- "activity"

# Step 4. Appropriately label the data set with descriptive variable names

# Correct column names
names(subject_data) <- "subject"

# Get all the data together in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# Step 5. Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "tidy_data.txt", row.name=FALSE)

str(averages_data)