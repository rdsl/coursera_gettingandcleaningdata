library(reshape2)

#Read tables. as.is = do not convert column to factor
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityClass", "ActivityName"), as.is=2)
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("FeatureClass", "FeatureLabel"), as.is=2)

#regexpr matches features$FeatureLabels containing 'mean()' or 'std()' returns position of match or -1 if no match
#> 0 creates logical vector representing regexpr matches
#ifelse creates a character vector with values 'numeric' if is match or 'NULL' if not
wanted_cols <- ifelse(regexpr('mean\\(|std\\(', features$FeatureLabel) > 0, "numeric", "NULL")

#reads only columns containing 'mean()' or 'std()' indicated by wanted_cols vector
measure_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses=wanted_cols, col.names=features$FeatureLabel)
label_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="ActivityClass")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="Subject")
measure_train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses=wanted_cols, col.names=features$FeatureLabel)
label_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="ActivityClass")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="Subject")

#fixes column names: replace one or multiple '.' by a single '_', replace final '_' by ''
colnames_fixed <- gsub('_$', '', gsub('\\.+', '_', colnames(measure_test)))
colnames(measure_test) <- colnames_fixed
colnames(measure_train) <- colnames_fixed

#column binds the tables, label_test represents ActivityClass
test <- cbind(label_test, subject_test, measure_test)
train <- cbind(label_train, subject_train, measure_train)

#merge activities with test or train tables by ActivityClass
test <- merge(activities, test)
train <- merge(activities, train)

#merge train and test data sets
dataset <- rbind(train, test)

#reshape dataset to a long table where each row represents a single measurement value for ActivityName, Subject, Measurement
#there will be multiple rows, representing different values measured, for the same ActivityName, Subject, Measurement set
molten <- melt(dataset, id=2:3, measure.vars=4:69, variable.name="Measurement", value.name="Value")

#create tidy wide data frame aggregated by applying the mean function on the Value column
#columns 3:69 represent the means of each measurement for each ActivityName + Subject combination
measurement_means_wide <- dcast(molten, ActivityName + Subject ~ Measurement,  mean, value.var="Value")

#NOT USED! create tidy long data frame
#measurement_means_long <- aggregate(Value ~ ActivityName + Subject + Measurement, FUN=mean, data=molten)
#colnames(measurement_means_long)[4] <- "Mean"

#writes table to disk
write.table(measurement_means_wide, "measurement_means.txt", row.name=FALSE)
