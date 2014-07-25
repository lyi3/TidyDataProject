This is Human Activity Recognition Using Smartphones Data Set.

Souce:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws

A link to a full description can be obtained @ http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information:

THe experiments were conduct with 30 subjects identified with a subject ID from 1 to 30 in the data set. This information can be
found in the Y_train and Y_test files in their corresponding folders.

Each volunteer performed six activities - walking, walking_upstairs, walking_downstairs, sitting, standing, and laying.
These six activities are correpsonding to the following activity code.

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Each subject wore a smartphone on their waist. The embedded accelerometer and gyroscrope captured 3-axial linear acceleration and
3-axial angular velocity at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body
motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is
assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector
of features was obtained by calculating variables from the time and frequency domain.

"-XYZ" is used to denote 3-axial signals in the X, Y and Z directions

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The data set also includes the following statistics:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

The complete list of measurement variables can be found in the features.txt file.

The original data sets divide the subjects randomly into the training group (70%) and the test group (30%). The tidy data set
was created by combining the training group and the test group, therefore the data covers all 30 volunteers.

First, three training files are column combined in the order of subject_train, Y_train, and X_train.
Similarly, the three test files are column combined in the order of subject_test, Y_test, and X_test.

Then the training data and the test data are combined again and named combinedData. The first and second column are renamed
"subjectId" and "activityId".

Then the 361 variables for each measurement are reduced to 79, keeping only the mean and the standard deviation variables.
This is done by using function grepl(). Because all the mean and std variables have either mean() or std() in their names,
using grepl() function to search for these two substrings in all the variables listed in features.txt gives us an index for
retrieving the mean and std variables. The subset data is called subsetData.

After subsetting only these variables, the column names are renamed with the corresponding variable names.

Next, the activityId is replaced by the activity labels. This is done by first merging the subsetData with the activity_label
data. Then the activityId is removed.

Last requirement is to create a separate tidy data set for the average of all variables for each subject and each activity.
This requires to use combinedData again. "plyr" package needs to be installed in order to use ddply() function.

The average for each variable is calculated for each subject and each activity. The data is named avgData.





