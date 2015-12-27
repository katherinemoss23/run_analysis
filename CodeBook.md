# CodeBook.md

##Variables for summaryData.txt

####subject	
	Index of subject (person) carrying out the activity
	integer 1..30

####activity.description
	Description of activity
	character - 6 possibilities:
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

The following variables are all normalized Numerics and bounded within [-1,1]:
####tBodyAcc.mean...X          
####tBodyAcc.mean...Y
####tBodyAcc.mean...Z
####tGravityAcc.mean...X
####tGravityAcc.mean...Y
####tGravityAcc.mean...Z
####tBodyAccJerk.mean...X
####tBodyAccJerk.mean...Y
####tBodyAccJerk.mean...Z
####tBodyGyro.mean...X
####tBodyGyro.mean...Y
####tBodyGyro.mean...Z
####tBodyGyroJerk.mean...X
####tBodyGyroJerk.mean...Y
####tBodyGyroJerk.mean...Z
####tBodyAccMag.mean..
####tGravityAccMag.mean..
####tBodyAccJerkMag.mean..
####tBodyGyroMag.mean..
####tBodyGyroJerkMag.mean..
####fBodyAcc.mean...X
####fBodyAcc.mean...Y
####fBodyAcc.mean...Z
####fBodyAccJerk.mean...X
####fBodyAccJerk.mean...Y
####fBodyAccJerk.mean...Z
####fBodyGyro.mean...X
####fBodyGyro.mean...Y
####fBodyGyro.mean...Z
####fBodyAccMag.mean..
####fBodyBodyAccJerkMag.mean..
####fBodyBodyGyroMag.mean..
####fBodyBodyGyroJerkMag.mean..
####tBodyAcc.std...X
####tBodyAcc.std...Y
####tBodyAcc.std...Z
####tGravityAcc.std...X
####tGravityAcc.std...Y
####tGravityAcc.std...Z
####tBodyAccJerk.std...X
####tBodyAccJerk.std...Y
####tBodyAccJerk.std...Z
####tBodyGyro.std...X
####tBodyGyro.std...Y
####tBodyGyro.std...Z
####tBodyGyroJerk.std...X
####tBodyGyroJerk.std...Y
####tBodyGyroJerk.std...Z
####tBodyAccMag.std..
####tGravityAccMag.std..
####tBodyAccJerkMag.std..
####tBodyGyroMag.std..
####tBodyGyroJerkMag.std..
####fBodyAcc.std...X
####fBodyAcc.std...Y
####fBodyAcc.std...Z
####fBodyAccJerk.std...X
####fBodyAccJerk.std...Y
####fBodyAccJerk.std...Z
####fBodyGyro.std...X
####fBodyGyro.std...Y
####fBodyGyro.std...Z
####fBodyAccMag.std..
####fBodyBodyAccJerkMag.std..
####fBodyBodyGyroMag.std..
####fBodyBodyGyroJerkMag.std..

The variables selected for this database come from the accelerometer and gyroscope 3-axial 
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove 
noise. Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth 
filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to 
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


##Study Design

The raw data used in the 'summaryData.txt' file was obtained from the
Human Activity Recognition Using Smartphones Dataset
Version 1.0, which can be downloaded from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Human Activity Recognition Using Smartphones Dataset
###Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually.  In the original data the dataset was 
randomly partitioned into two sets, where 70% of the volunteers were selected for 
generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and body 
motion components, was separated using a Butterworth low-pass filter into body acceleration 
and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 
variables was obtained by calculating variables from the time and frequency domain. See 
'Variables' for more details. 

The original data provided the following information for each record:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body 
acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


##Production of 'summaryData.txt' file

The summaryData.txt file is a tidy data set combining data from the Test and Training
subjects.  Descriptive column labels, subject index and activity description have been 
added into the original dataset.
Only the subset of variables (features) relating to mean and std have been retained.
The average of each variable for each activity and each subject was calculated.

###Instruction List

The original data was processed with an R script in order to obtain the summaryData.
The following process should be followed to obtain the 'summaryData.txt' file.

1.  Download the original data from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unzip all files into the current working directory for R

2.  Download and load the R script 'run_analysis.R' from
???github link
into the current working directory for R

3.  Type run_analysis() in current working directory

4.  The 'summaryData.txt' file will be created in the current working directory


##The dataset includes the following files:

- 'README.md':  Explains how the script works, inputs and outputs

- 'CodeBook.md':  Describes variables, original study design, process and information on
	production of 'summaryData.txt' file

- 'summaryData.txt': Comma delimited text file giving average data for mean and std
	variables for each subject and activity


For more information about the original dataset contact: 
activityrecognition@smartlab.ws


##License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
