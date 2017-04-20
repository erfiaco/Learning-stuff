
#You can create a DIRECTORY in the working directory
dir.create("testdir")

#You can create a empy FILE in the working directory
file.create("mytest.R")

#If you'll be surfing throug directories, it is smart to safe the location of working directory:

old.dir<-getwd()

#Confirm that a file exist: WARNING, BY DEFAULT IT IS NOT CASE SENSITIVE.
#if you are running a program that loops through a series of files and does some processing on each one, you will want to check to see that each exists before you try to process it

file.exists("mytest.R") 
file.exists("MyTeSt.R") 

#You can get info from files using the function:

file.info("mytest.R") #you can use $ to grab specific items

#Change the name of file by using

file.rename("mytest.R","mytest2.R")

#Copy a file and rename it

file.copy("mytest2.R", "mytest3.R")

# Find the path your file is working on
file.path("mytest3.R")

#Create a directory inside a directory:
dir.create("testdir2/testdir3",recursive = TRUE)
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)