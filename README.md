# CleaningCourseProject
Course project for data cleaning
The dataset being used is: Human Activity Recognition Using Smartphones



Files
The code uses the Samsung data that should be present in the same run folder.

The script  run_analysis.R performs the steps required in the course project.
rbind()  function is used to merge corresponding datasets. 
Columns with the mean and standard deviation measures are taken from the whole dataset. Names taken from  features.txt are used to substitute for the corresponding names previously extracted.
Activity names and IDs are taken from  activity_labels.txt  and they are provided in the dataset.
More descriptive names have been added for the columns.
A new dataset is generated with all the average measures for each subject and activity type. The output file is called  averages_data.txt.

Variables used:  x_train ,  y_train ,  x_test ,  y_test ,  subject_train  and  subject_test  contain the data from the provided files.
x_data ,  y_data  and  subject_data  merge the provided datasets for x, y and subject.
features  contains the correct names for the  x_data  dataset, which are applied to the column names stored in  mean_std_features data.
A similar approach is taken with activity names through the  activities  variable.
all_data  merges  x_data ,  y_data  and  subject_data  in a big dataset.
Finally,  averages_data  contains the relevant averages which will be later stored in a  .txt  file.  ddply()  from the plyr package is used to apply  colMeans()  and ease the development.
The output of the 5th step is called  averages_data.txt and is uploaded previously from the run on the Samsung data.

