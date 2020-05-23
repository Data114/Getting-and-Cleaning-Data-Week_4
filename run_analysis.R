# LISTING THE CURRENT WORKING DIRECTORY WHERE FILE WAS UNZIPPED:
list.files(gwd)

# READING THE TRAINING DATA:
xtrain <- read.table(file.path(gwd,"train","X_train.txt"),header = FALSE)
ytrain <- read.table(file.path(gwd,"train","y_train.txt"),header = FALSE)
subject_train <- read.table(file.path(gwd,"train","subject_train.txt"),header = FALSE)

# READING THE TESTING DATA
xtest <- read.table(file.path(gwd,"test","X_test.txt"),header = FALSE)
ytest <- read.table(file.path(gwd,"test","y_test.txt"),header = FALSE)
subject_test <- read.table(file.path(gwd,"test","subject_test.txt"),header = FALSE)

# READING THE FEATURES DATA:
features <- read.table(file.path(gwd,"features.txt"),header = FALSE)

# READING THE ACTIVITY LABELS DATA:
activity_labels <- read.table(file.path(gwd,"activity_labels.txt"),header = FALSE)

# TAGGING THE TRAIN AND TEST DATASETS:

# Create Sanity and Column Values to the Train Data:
colnames(xtrain) = features[,2]
colnames(ytrain) = "activityID"
colnames(subject_train) = "subjectID"

# Create Sanity and Column Values to the Test Data
colnames(xtest) = features[,2]
colnames(ytest) = "activityID"
colnames(subject_test) = "subjectID"

#Create sanity check for the activity labels value
colnames(activity_labels) <- c('activityID','activityType')

# OBJECTIVE 1: Merge the training and the test sets to create one data set.
mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)

# Create the main data table merging both table tables - this is the outcome of 1
setAllInOne = rbind(mrg_train, mrg_test)

# OBJECTIVE 2: Extract only the measurements on the mean and standard deviation for each measurement. 
colNames <- colnames(setAllInOne)

#Need to get a subset of all the mean and standards and the correspondongin activityID and subjectID 
mean_and_std = (grepl("activityID" , colNames) | grepl("subjectID" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

# OBJECTIVE 3: Use descriptive activity names to name the activities in the data set.
setWithActivityNames = merge(setForMeanAndStd, activity_labels, by='activityID', all.x=TRUE)

# OBJECTIVE 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
secTidySet <- aggregate(. ~subjectID + activityID, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectID, secTidySet$activityID),]

# SAVING THE NEW DATA:
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
