# Coursera Getting and Cleaning Data Course Project
1. Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into your RStudio Working Directory.
2. Do not rename the unzipped folder, which is "UCI HAR Dataset".
3. Make sure the run_analysis.R file is in the same Working Directory with "UCI HAR Dataset" folder.
4. execute source("run_analysis.R") command in RStudio.
5. You will get the output file "assignment2_results.txt" in the Working Directory. 
6. Finally, use data <- read.table("assignment2_results.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.
