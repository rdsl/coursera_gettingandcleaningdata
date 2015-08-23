# coursera_gettingandcleaningdata
Coursera Getting and Cleaning Data course project repository

SUMMARY
run_analysis.R readS data from the UCI HAR Dataset, generates and writes to a
file a table containing the mean values for several measurements grouped by
Activity and Subject.

SCRIPT: run_analysis.R
DIRECTORY: The working directory must containg the "UCR HAR Dataset" directory.
INPUT: UCI HAR Dataset/activity_labels.txt
       UCI HAR Dataset/features.txt
       UCI HAR Dataset/test/X_test.txt
       UCI HAR Dataset/test/y_test.txt
       UCI HAR Dataset/test/subject_test.txt
       UCI HAR Dataset/train/X_train.txt
       UCI HAR Dataset/train/y_train.txt
       UCI HAR Dataset/train/subject_train.txt
OUTPUT: measurement_means.txt

1. The activity_labels (6, 2) and features (561, 2) tables are read with the
parameter as.is=2 to preserve the column containing activity names as character
and not factor. Table columns receive names ActivityClass and ActivityName
through the col.names parameter. activities will be used the merge the
observations, which contain the numeric ativity class, with the descriptive name
of the activity. features will be used to give names to the columns of the
observations tables and to select which columns to extract.

2. A character vector wanted_cols (561) containing the strings "NULL" or
"numeric" is created to select the columns to be read from the data tables.
regexpr is used to select the features whose names contain 'mean()' or 'std()'.

3. Each row of the X_test (2947, 561) and X_train (7352, 561) tables represents
a set of measurements defined bye the column FeatureLabel of the features table.
By passing colClasses=wanted_cols only the columns (66) containing 'mean()' or
'std()' are extracted.
measure_test (2947, 66) and measure_train (7352, 66) represent test and train
data - feature measurements, respectively.
label_test (2947, 1) and label_train (7352, 1) are lists containing the activity
classes for each observation.
subject_test (2947, 1) and subject_train (7352, 1) are lists containing the
subject for each observation.

4. make.names in read.table generates names containing one or multiple '.'.
Those are replaced by '_' and subsequently final '_' are trimmed from the
column names of the measure_test and measure_train data frames. This generates
descriptive - from the original dataset - and comprehensive names for the
varibles.

5. test (2947, 69) data frame is created by column biding label_test,
subject_test and measure_test. The same for train (7352, 69).

6. test is reassigned by merging activities and test by ActivityClass. Same for
train.

7. Complete dataset (10299, 69) containing train and test data is created by row
binding.

8. dataset is reshaped into a long table molten (679734, 4) excluding
ActivityClass column and casting the columns other than Subject and ActivityName
as measurement variables.

9. A tidy wide data frame measurement_means_wide (180, 68) is created by
aggregating over the Value column of dataset with the mean function. Each row
represents one observation of each of the measurement variables for a single
group of ActivityName and Subject combination.
The data frame is tidy because 1. each variables is in one column, 2. each
different observation for the combination of ActivityName an Subject is in a
different row, 3. there is just one table for each kind - sensors readings - of
variable, 4. does not apply.

10. Final table is written to disk.

