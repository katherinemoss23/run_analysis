# run_analysis
Functionality to obtain summary mean data from UCI HAR Dataset

##Input data
The functionality provided by the run_analysis function requires the following input data
to be unzipped into the current working directory

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##run_analysis.R file
The run_analysis function is provided in the run_analysis.R file.
This function combines data from the Test and Training subjects.  It adds descriptive 
column labels, subject index and activity description into the original dataset.
Only the subset of variables (features) relating to mean and std are retained.
The function calculates the average of each variable for each activity and each subject 
and prints the resulting wide tidy data to summaryData.txt in the current working directory.

##summaryData.txt
summaryData.txt is the tidy data resulting from the run_analysis function on the Input data.
It is a comma delimited text file that is produced in the current working directory.
