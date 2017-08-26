library(reshape2)

filename <- "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"

#unzip the dataset placed in the same directory as the r session 
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activityLabels$V2 <- as.character(activityLabels$V2)
features$V2 <- as.character(features$V2)

# Extract data on mean and standard deviation
featWanted <- grep(".*mean.*|.*std.*", features$V2)
featWanted.names <- features[featWanted,2]
featWanted.names = gsub('-mean', 'Mean', featWanted.names)
featWanted.names = gsub('-std', 'Std', featWanted.names)
featWanted.names <- gsub('[-()]', '', featWanted.names)


# Load the datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]
train.activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train.subjects, train.activities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
test.activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test.subjects, test.activities, test)

# merge datasets and add labels
Data <- rbind(train, test)
colnames(Data) <- c("subject", "activity", featWanted.names)

Data.melted <- melt(Data, id = c("subject", "activity"))
Data.mean <- dcast(Data.melted, subject + activity ~ variable, mean)

write.table(Data.mean, "tidy.txt", row.names = FALSE, quote = FALSE)