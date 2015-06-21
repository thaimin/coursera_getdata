# 1. Merges the training and the test sets to create one data set.
trainDir = "./UCI HAR Dataset/train"
testDir = "./UCI HAR Dataset/test"

trainDataset <- read.table(paste(trainDir,"/X_train.txt", sep = ""))
trainLabels <- read.table(paste(trainDir,"/y_train.txt", sep = ""))
trainSubject <- read.table(paste(trainDir,"/subject_train.txt", sep = ""))

testDataset <- read.table(paste(testDir,"/X_test.txt", sep = ""))
testLabels <- read.table(paste(testDir,"/y_test.txt", sep = ""))
testSubject <- read.table(paste(testDir,"/subject_test.txt", sep = ""))

mergeDataset <- rbind(trainDataset, testDataset)
mergeLabels <- rbind(trainLabels, testLabels)
mergeSubject <- rbind(trainSubject, testSubject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt")
meanStdIdx <- grep("mean\\(\\)|std\\(\\)", features[,2])
meanStdDataset <- mergeDataset[, meanStdIdx]
colnames(meanStdDataset) <- features[meanStdIdx,2]

# 3. Uses descriptive activity names to name the activities in the data set
activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityNames) <- c("ID","Activity")
names(mergeLabels) <- "ID"
mergeLabels <- merge(mergeLabels,activityNames)

# 4. Appropriately labels the data set with descriptive variable names. 
meanStdLabels <- mergeLabels[meanStdIdx,]
names(mergeSubject) <- "Subject"
meanStdDataset <- cbind(Subject = mergeSubject, Activity = mergeLabels$Activity, meanStdDataset)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
sortedUniqueSubjects <- sort(unique(mergeSubject)[, 1]);
subjectLen <- length(sortedUniqueSubjects)
activityLen <- dim(activityNames)[1]
columnLen <- dim(meanStdDataset)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(meanStdDataset)

row <- 1
for (i in 1:subjectLen){
  for (j in 1:activityLen){
    result[row, 1] <- sortedUniqueSubjects[i]
    result[row, 2] <- activityNames[j, 2]
    bool1 <- i == meanStdDataset$Subject
    bool2 <- activityNames[j, 2] == meanStdDataset$Activity
    result[row, 3:columnLen] <- colMeans(meanStdDataset[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}

write.table(result, "assignment2_results.txt", row.names = F)
