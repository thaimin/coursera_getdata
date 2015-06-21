# Code Book for Coursera Getting and Cleaning Data Course Project
The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:
1. Read X_train.txt, y_train.txt and subject_train.txt from the "./UCI HAR Dataset/train" folder and store them into trainDataset, trainLabels and trainSubject variables respectively.

2. Read X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/test" folder and store them into testDataset, testLabels and testSubject variables respectively. 

3. Merge the train and test data into mergeDataset, mergeLabels and mergeSubject.

5. Read the features.txt file from the "./UCI HAR Dataset" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation for each measurement, then store them into meanStdDataset.

6. Read the activity_labels.txt file from the "./UCI HAR Dataset" folder and store the data in a variable called activityNames. Then merge the activity names into the mergeLabels according to the identifier number.

7. Appropriately labels the data set with descriptive variable names by combining mergeSubject, Activity Names of mergeLabels and meanStdDataset.

8. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.

9. Write the result out to "assignment2_results.txt" file in current working directory.