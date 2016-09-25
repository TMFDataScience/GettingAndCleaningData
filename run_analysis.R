## run_analysis.R - script created for Coursera Getting and Cleaning Data Course Project

## Run using source("./run_analysis.R")

## N.B. Both tidyr and stats packages must be loaded to run this script

## First, load training set - ensure that working directory is standard if required ...

## setwd("./R/CourseraExercises/Getting and Cleaning Data Course Project")

## Load reference data - column headers

featuresSet <- read.table("./features.txt", header = FALSE)

## Transpose to create a vector of column headers in a form required for read.table

headerSet <- t(featuresSet$V2)

## Use a regular expression to remove hyphens, commas and brackets from the column headers

cleanedHeaderSet <- gsub("-|\\(|\\)|,","",headerSet)

## Then load text file into trainingSet dataframe, giving them headers

trainingSet <- read.table("./X_train.txt", header = FALSE, col.names = cleanedHeaderSet)

## Then load text file into testSet dataframe, giving them headers

testSet <- read.table("./X_test.txt", header = FALSE, col.names = cleanedHeaderSet)

## Now load the activity labels for each row

trainingActivitySet <- read.table("./y_train.txt", header = FALSE, col.names = c("ActivityCode"))
testActivitySet <- read.table("./y_test.txt", header = FALSE, col.names = c("ActivityCode"))

## Now load the subject labels for each row

trainingSubjectSet <- read.table("./subject_train.txt", header = FALSE, col.names = c("SubjectCode"))
testSubjectSet <- read.table("./subject_test.txt", header = FALSE, col.names = c("SubjectCode"))

## Now merge the data frames...

## First, put all test frames together

testFullSet <- cbind(testSubjectSet, testActivitySet, testSet)

## Similarly all training frames

trainingFullSet <- cbind(trainingSubjectSet, trainingActivitySet, trainingSet)

## Now combine training and test sets ### THIS COMPLETES STEP 1 and STEP 4 (as variable names already have descriptive names)

combinedSet <- merge(trainingFullSet, testFullSet, all = TRUE)

## Now we must load the reference data - column headings and activity descriptions

activityLabelSet <- read.table("./activity_labels.txt", header = FALSE, col.names = c("ActivityCode", "Activity"))

## Now merge the result with the activity labels to provide descriptions ## THIS COMPLETES STEP 3

combinedSetWithActivity <- merge(combinedSet, activityLabelSet, by.x = "ActivityCode", by.y = "ActivityCode")

## Find the columns that involve mean and standard deviation and clean out the invalid characters 

meanAndStdHeaders <- subset(headerSet, grepl("mean\\(|std\\(",headerSet))
cleanedMeanAndStdHeaders <- gsub("-|\\(|\\)|,","",meanAndStdHeaders)

## Now use this to return only relevant columns ### THIS COMPLETES STEP 2

requiredDataSet <- combinedSetWithActivity[, c("SubjectCode", "Activity", cleanedMeanAndStdHeaders)]

## For step 5, must create new tidy dataset. 
 
## First, convert all variable columns to rows
 
variablesAsRowsSet <-gather(requiredDataSet, variable, average, matches("^f|^t"))

## Finally, aggregate this data across activity, subject and variable name

tidySet <- aggregate(average ~ SubjectCode + Activity + variable, data = variablesAsRowsSet, mean)

## Now output the data set ### THIS COMPLETES STEP 5

write.table(tidySet, file = "./cleaningDataWeek4Assignment.txt", row.names = FALSE)

