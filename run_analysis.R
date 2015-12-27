
fileName = "./downloaded/Dataset.zip"
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## download the file if not already downloaded

if(!file.exists(fileName)){
  if(!file.exists("./downloaded")){
    dir.create("./downloaded")
  }
  download.file(url = url, destfile = fileName)
}

## unzip the file if not already unzipped

unzipFolder = "./downloaded/UCI HAR Dataset"

if(!file.exists(unzipFolder)){
  unzip(fileName, exdir = "./downloaded")
}