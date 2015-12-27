# Getting & Cleaning Data - Course Project

This repository contains the course work for Coursera's [Getting and Cleaning Data](https://www.coursera.org/course/getdata).

`run_analysis.R` script merge and clean the source data and creates a tidy data set.

The source data set, [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), contains measurements collected from 30 subjects doing various activities while recording data generated from the  accelerometer & gyroscope sensors from a Samsung Galaxy S II smartphone.

## Setup

The [plyr](http://plyr.had.co.nz/) package is required to run the script.

```
install.packages("plyr")
```

## Run

Run the script `run_analysis.R` to generate `clean_and_tidy_avg.txt` that contains the average of the mean & standard deviation variables for each subject and activity.

## Code book

The code book describes the data and variables and how the data was cleaned and transformed from the source data set.

See the [Code book here](CodeBook.md).