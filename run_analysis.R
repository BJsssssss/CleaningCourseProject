## Use plyr library, less steps required to solve

library(plyr)

## Merge training and test sets provided to create one data set

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## create data set for x from provided
x_data <- rbind(x_train, x_test)

## create data set for y from provided
y_data <- rbind(y_train, y_test)

## create the "subject" data set
subject_data <- rbind(subject_train, subject_test)

## Now extract only the measurements on the mean and standard deviation 
features <- read.table("features.txt")

## get only columns with mean() or std() in their names
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

## subset the required columns
x_data <- x_data[, mean_std_features]

## change column names
names(x_data) <- features[mean_std_features, 2]

## As required, use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

## update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

## changing labels for more description and column name
names(y_data) <- "activity"

## correct column name and bind all the data in a single data set

names(subject_data) <- "subject"
all_data <- cbind(x_data, y_data, subject_data)

## Create a second, independent tidy data set with the average of each variable
## 66 columns in total
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
