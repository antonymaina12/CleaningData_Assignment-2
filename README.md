# CleaningData_Assignment-2

The original dataset includes the following files:
---
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

---

To this dataset the following transformations were applied to merge and tidy the different datasets into one complete set.

- The training set and test set were merged into one dataset.
- Only the variables containing the means or standard deviations of a certain kind of measurement were exctracted.
- A variable was added with descriptive labels of the six activities. See the codebook for the different kinds of activites measured.
- Another variable containing the label for each different participant (subject), was added to match each participant to the appropriate measurement. 

Finally, code is included that creates a new tidy dataset containing the means of each measurement per activity per subject.
