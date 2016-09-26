## Getting and Cleaning Data - Week 4 Assignment

This repo contains the files required for the Coursera course Getting and Cleaning Data Week 4 Assignment, namely:

This README.MD
The required script run_analysis.R
The codebook for the script, CODEBOOK.MD

## Codebook

The codebook contains details of the variables used and other technical details.

## Scripts created

Only one script is required, namely run_analysis.R. This can be run from the command line or within the R environment as a standard R script.

## Tidt Data Set

Given the open-ended nature of the assignment, it has been left to the student to determine the nature of the final data set. I have taken the decision to provide the data in a narrow format, i.e. with each instance of the variable/subject/activity as an observation. This in my view fits the main criteria for a tidy data set, as set out in Hadley Wickham's paper on Tidy Data (http://vita.had.co.nz/papers/tidy-data.pdf), namely:

* Each variable forms a column (in this case the variables I have defined are activity, subject and variable)
* Each observation forms a row (i.e. each subject/activity/variable combination)
* Each type of observational unit forms a table (delivered as one output table)

## References

Acknowledgment is given to the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
