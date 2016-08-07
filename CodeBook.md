# Introduction 

The script `run_analysis.R` performs the 5 steps outlined in the course project's definition 

* First, the activity labels and features are loaded into R using the `read.table()` function.  
* The relevent datasets `test_x` `test_y` `subject_test` `train_x` `train_y` `subject_train` are loaded into R and similar datasets are merged using the `cbind()` function to create `test` and `train`. By similar datasets we refer to the data that comes from `./test` and `./train` respectively. 
* All of the data is merged into the variable `allData` using the `rbind()` function. 
* Only the columns with mean and standard deviation measures are taken from the whole dataset and the 
* 
