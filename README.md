# gettingandcleaningdata
Coursera week 4 activity

- This script works using the logic:

  1. Reading all the necessary files by using the read.table function
  2. Binding the columns from the training and testing files together using cbind
  3. Concatenating the test and training sets using rbind (end of STEP 1)
  4. Concatenating all the column names
  5. Deciding with columns are going to be kept using the grep function on the concatenated names searching for
    - mean() OR std() OR subject OR activity_label
  6. Selecting only the above logic (end of STEP 2)
  7. Merging the database with the activities names
  8. Deleting the numeric column of the activity (end of STEP 3)
  9. Renaming all columns (end of step 4)
  10. Averaging the data columns using the aggregation function (end of STEP 5)
  11. Writing the result in a file named "Output.txt" using write.table
