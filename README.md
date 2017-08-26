<h1>Getting and Cleaning Data Course Project</h1>
<p>
This repository contains run_analysis.r which performs the following actions:

1. Load the dataset from the current session's directory. ( use getwd() to see the current working directory and move the zipped data
   or unzipped data to the folder )
2. Load the activity and features from the dataset.
3. Extract the mean and standard deviation features from the data
4. Load the train and test data based on the chosen features and merge it with the subjects and activities
5. Merge both train and test data using rbind and add labels
6. Create a txt file for this tidy data
</p>
