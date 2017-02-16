## Loading data sets 

activitylabels <- read.table(file.path("UCI HAR Dataset","activity_labels.txt"),stringsAsFactors = FALSE)
features <- read.table(file.path("UCI HAR Dataset","features.txt"))
xtrain <- read.table(file.path("UCI HAR Dataset","train","X_train.txt"))
ytrain <- read.table(file.path("UCI HAR Dataset","train","y_train.txt"))
subjecttrain <- read.table(file.path("UCI HAR Dataset","train","subject_train.txt"))
xtest <- read.table(file.path("UCI HAR Dataset","test","X_test.txt"))
ytest <- read.table(file.path("UCI HAR Dataset","test","y_test.txt"))
subjecttest <- read.table(file.path("UCI HAR Dataset","test","subject_test.txt"))

# STEP 1: Merges the training and the test sets to create one data set.

train <- cbind(xtrain,subjecttrain,ytrain)
test <- cbind(xtest,subjecttest,ytest)
alldata <- rbind(train,test)

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

allmeasures <- c(as.character(features[,2]),"subject","activity_labels")
selectedmeasures <- grep("-mean\\(\\)|-std\\(\\)|activity_labels|subject",allmeasures)
selecteddata <- alldata[,selectedmeasures]

# STEP 3: Uses descriptive activity names to name the activities in the data set

addactivity <- merge(selecteddata,activitylabels,by.x="V1.1",by.y="V1",all=TRUE)
finaldata <- addactivity[,2:ncol(addactivity)]

# STEP 4: Appropriately labels the data set with descriptive variable names.

names(finaldata) <- allmeasures[selectedmeasures]

# STEP 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

avgdata <- aggregate(finaldata[,1:(ncol(finaldata)-2)],list(subject=finaldata$subject,activitylabel=finaldata$activity_labels),mean)

#Output file

write.table(avgdata,"Output.txt",row.names = FALSE)


