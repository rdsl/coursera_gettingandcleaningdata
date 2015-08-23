#Study design

The data for this study is comprised of the UCI HAR Data Set, which was
downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The script run_analysis.R was used to read, process, summarize the data and
write the final tidy table to disk.

Columns from the files X_test.txt and X_train.txt whose names contained the
string sequences 'mean()' and 'std()' as defined by the file features.txt were
extracted. The two files were merged together and with subject_test.txt and
subject_train.txt and joined with activity_labels.txt. The final outputy table
summarizes the values of the measurement variables extracted by taking the mean
over the measurements values for each combination of ActivityName and Subject.

For further explanation and description on the exact processing steps taken,
please refer to the Readme.md file and the comments in the run_analysis.R file.


#Code book

####[1] ActivityName
**DESCRIPTION:** The original UCI HAR Database activity class names.</br>
**TYPE:** character</br>
**VALUES:** {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,</br>
LAYING}.


####[2] Subject
**DESCRIPTION:** The original UCI HAR Database subject label.</br>
**TYPE:** integer</br>
**VALUES:** 1:30</br>

####[3:69] 
 **"tBodyAcc_mean_X"           "tBodyAcc_mean_Y"          
 "tBodyAcc_mean_Z"           "tBodyAcc_std_X"           
 "tBodyAcc_std_Y"            "tBodyAcc_std_Z"           
 "tGravityAcc_mean_X"        "tGravityAcc_mean_Y"       
 "tGravityAcc_mean_Z"        "tGravityAcc_std_X"        
 "tGravityAcc_std_Y"         "tGravityAcc_std_Z"        
 "tBodyAccJerk_mean_X"       "tBodyAccJerk_mean_Y"      
 "tBodyAccJerk_mean_Z"       "tBodyAccJerk_std_X"       
 "tBodyAccJerk_std_Y"        "tBodyAccJerk_std_Z"       
 "tBodyGyro_mean_X"          "tBodyGyro_mean_Y"         
 "tBodyGyro_mean_Z"          "tBodyGyro_std_X"          
 "tBodyGyro_std_Y"           "tBodyGyro_std_Z"          
 "tBodyGyroJerk_mean_X"      "tBodyGyroJerk_mean_Y"     
 "tBodyGyroJerk_mean_Z"      "tBodyGyroJerk_std_X"      
 "tBodyGyroJerk_std_Y"       "tBodyGyroJerk_std_Z"      
 "tBodyAccMag_mean"          "tBodyAccMag_std"          
 "tGravityAccMag_mean"       "tGravityAccMag_std"       
 "tBodyAccJerkMag_mean"      "tBodyAccJerkMag_std"      
 "tBodyGyroMag_mean"         "tBodyGyroMag_std"         
 "tBodyGyroJerkMag_mean"     "tBodyGyroJerkMag_std"     
 "fBodyAcc_mean_X"           "fBodyAcc_mean_Y"          
 "fBodyAcc_mean_Z"           "fBodyAcc_std_X"           
 "fBodyAcc_std_Y"            "fBodyAcc_std_Z"           
 "fBodyAccJerk_mean_X"       "fBodyAccJerk_mean_Y"      
 "fBodyAccJerk_mean_Z"       "fBodyAccJerk_std_X"       
 "fBodyAccJerk_std_Y"        "fBodyAccJerk_std_Z"       
 "fBodyGyro_mean_X"          "fBodyGyro_mean_Y"         
 "fBodyGyro_mean_Z"          "fBodyGyro_std_X"          
 "fBodyGyro_std_Y"           "fBodyGyro_std_Z"          
 "fBodyAccMag_mean"          "fBodyAccMag_std"          
 "fBodyBodyAccJerkMag_mean"  "fBodyBodyAccJerkMag_std"  
 "fBodyBodyGyroMag_mean"     "fBodyBodyGyroMag_std"     
 "fBodyBodyGyroJerkMag_mean" "fBodyBodyGyroJerkMag_std"**</br>
**DESCRIPTION:** The mean for each ActivityName and Subject of the UCI HAR Dataset</br>
measurements on the mean and standard deviation. See Readme.md and comments in</br>
run_analysis.md.</br>
**TYPE:** numeric</br>
**VALUES:** -1:1</br>
