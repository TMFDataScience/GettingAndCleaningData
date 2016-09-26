## Getting and cleaning data - Codebook

This documents the accompanying script, built for the Week 4 Assignment of the Coursera Getting and Cleaning Data course.

## Scripts created

Only one script is required, namely run_analysis.R. This can be run from the command line or within the R environment as a standard R script.

## Variables used

* featuresSet - dataframe into which is loaded the variable names for the traing/test data
* headerSet - vector formed by transposing the above dataframe
* cleanedHeaderSet - vector formed from the above vector, with names cleaned of illegal characters
* trainingSet - dataframe into which the training set of data is loaded
* testSet - dataframe into which the test set of data is loaded
* trainingActivitySet - dataframe into which the training activity data is loaded
* testActivitySet - dataframe into which the test activity data is loaded
* trainingSubjectSet - dataframe into which the training subject data is loaded
* testSubjectSet - dataframe into which the test subject data is loaded
* testFullSet - dataframe containing the combined test data, activity and subject data
* trainingFullSet - dataframe containing the combined training data, activity and subject data
* combinedSet - dataframe containing the combined training and test data
* activityLabelSet - dataframe into which activity labels are loaded
* combinedSetWithActivity - dataframe containing the combined set of data with activity labels
* meanAndStdHeaders - vector subsetted to only include variable names with 'mean()' and 'std()' contained in them. MeanFreq is ignored.
* cleanedMeanAndStdHeaders - vector containing above subset, with names cleaned of illgal characters
* requiredDataSet - contains dataframe limited to the above variables, plus activity and subject
* variablesAsRowsSet - contains dataframe with variables gathered into one column
* tidySet - final dataframe with data aggregated on subject and activity

## Steps followed

* Load all required data from files into dataframes
* Take the dataframe containing variable names, transpose it into a vector and clean the names of illegal characters using regular expression
* Combine all dataframes using cbind and merge to create one dataframe - THIS COMPLETES STEP 1 OF EXERCISE, AND STEP 4 AS COLUMN NAMES ARE APPLIED AT THE SAME TIME
* Using the activity names dataframe, merge with the above result to gain a dataframe that has activity labels  - THIS COMPLETES STEP 3 OF EXERCISE
* Estblish using a regular expression the variable names that are required to only show mean/standard deviation columns
* Use the above to subset the dataframe - THIS COMPLETES STEP 2
* Finally, the variable columns are merged into one column using the gather function, and then the values summarized using the aggregate function - THIS COMPLETES STEP 5

## Required libraries

In order to run this script, the following libraries must be loaded:

* tidyr
* stats
