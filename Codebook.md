## CODE BOOK OF THE COURSE PROJECT

# Activities donee by 30 volunteers wearing a smartphone (Samsung Galaxy S II) on the waist. 
1. WALKING 
2. WALKING_UPSTAIRS 
3. WALKING_DOWNSTAIRS 
4. SITTING 
5. STANDING 
6. LAYING

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from smartphone accelerometer X-axis in standard gravity units 'g'.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample.  

## Step-by-step run through of R script:

1. Set the working directory after unzipping the files to the directory.
2. Read each data file into R.
3. Name the variables appropriately (Objective 4 in the given list)
4. Merge the training and the test sets to create one data set.
5. Extract only the measurements on the mean and standard deviation for each measurement. 
6. Use descriptive activity names to name the activities in the data set.
7. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
8. Save the new data set into a text file.
