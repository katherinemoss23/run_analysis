## run_analysis carries out the following steps:
##  1  reads the UCI HAR Dataset from copy in working directory
##  2  adds variable descriptions, activity index and subject to the data
##  3  merges the test and training data
##  4  retains the subset of data relating to mean and std
##  5  adds activity descriptions
##  6  calculates the means of each variable for each subject and each activity
##  7  writes this summary tidy data to a comma delimited .txt file

##  Note that packages Hmisc, plyr, dplyr and reshape2 must be loaded 
##  to run this function


run_analysis <- function () {

##  load packages
library(Hmisc)
library(plyr)
library(dplyr)
library(reshape2)

##  check that the UCI HAR Dataset is available in working directory
if( !file.exists("./UCI HAR Dataset") ) {
	stop( "Must have 'UCI HAR Dataset' folder in current working directory" )
}

##  get training and test data
testData = read.table( "UCI HAR Dataset/test/X_test.txt", na.strings="N/A" )
trainData = read.table( "UCI HAR Dataset/train/X_train.txt", na.strings="N/A" )

##  get column labels from features.txt
features <- read.table( "UCI HAR Dataset/features.txt",
	colClasses = c("integer", "character") )
featureList <- make.names( features[, 2] )

##  add column labels onto training and test data
names(testData) <- featureList
names(trainData) <- featureList

##  get activity index for test and training data
activityTest <- read.table( "UCI HAR Dataset/test/y_test.txt", na.strings="N/A",
	col.names="activity.index" )
activityTrain <- read.table( "UCI HAR Dataset/train/y_train.txt", na.strings="N/A",
	col.names="activity.index" )

##  get subject information for test and training data
subjectTest <- read.table( "UCI HAR Dataset/test/subject_test.txt",
	na.strings="N/A", col.names="subject" )
subjectTrain <- read.table( "UCI HAR Dataset/train/subject_train.txt",
	na.strings="N/A", col.names="subject" )

##  add subject and activity information into test and training data
testWhole <- data.frame( subjectTest, activityTest, testData )
trainWhole <- data.frame( subjectTrain, activityTrain, trainData )

##  merge test and training data
mergedData = merge( trainWhole, testWhole, all=TRUE )

##  take subset of data - first 2 columns and column names including "mean." or
##  "std.". Keep variables in current order.
mergedDatasubset <- mergedData[ , c(1:2, sort.int( c(
	grep( "mean.", names(mergedData), fixed=TRUE ),
	grep( "std.", names(mergedData), fixed=TRUE )))) ]

##  replace activity index with activity description
activityLookup <- read.table( "UCI HAR Dataset/activity_labels.txt")
mergedDatasubset <- mutate( mergedDatasubset,
	activity.description = activityLookup[activity.index, 2] )
mergedDatasubset <- mergedDatasubset[ , c(1,2,69,3:68)]

##  melt the data with ids "subject" and "activity.description"
meltedData <- melt(mergedDatasubset, id=c("subject", "activity.description"))

##  reform the data for each "subject" and "activity.description", calculating
##  means for all variables.  Order by increasing subject and activity.index
summaryData <- dcast( meltedData, subject + activity.description ~ variable,
	mean )
summaryData <- arrange( summaryData, subject, activity.index )

##  delete activity.index column as this duplicates the activity.description
summaryData$activity.index <- NULL

##  write the resulting data to a .txt file, comma delimited
write.table(summaryData, "summaryData.txt", sep=",", row.names=FALSE )

print( "Summary data written to summaryData.txt in working directory" )

}
