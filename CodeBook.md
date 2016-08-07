# Introduction 

The script `run_analysis.R` performs the 5 steps outlined in the course project's definition 

* First, the activity labels and features are loaded into R using the `read.table()` function.  
* The relevent datasets `test_x` `test_y` `subject_test` `train_x` `train_y` `subject_train` are loaded into R and similar datasets are merged using the `cbind()` function to create `test` and `train`. By similar datasets we refer to the data that comes from `./test` and `./train` respectively. 
* All of the data is merged into the variable `allData` using the `rbind()` function. 
* Only the columns with mean and standard deviation measures are taken from the whole dataset and the `activityLabels` and `meanstddata` datasets are merged to get one dataset with descriptive activity names. 
* Finally the output file `tidy.txt` is created and has 30 subjects * 6 activities which gives 180 rows. This text file has been uploaded to this repository. 

# Variables 

* `test_x` `test_y` `subject_test` `train_x` `train_y` `subject_train` contain the data from the downloaded files. 
* These files are merged into `test` and `train` respectively using the `cbind()` function. 
* All of the above data is merged into one dataset called `allData` using the `rbind()` function. 
* `meanstddata` contains the dataset with only mean and standard deviation values included. 
* `tidy.txt` is the output of the function and contains the data in a clean and tidy format. 
