# A Shell Script to Backup a Directory <br>
This program backs up the directory you give it checks every interval of time you specify if something is changed in the directory and saves a copy of the folder in a backup folder. If the backup folder doesn't exist, the program will create one. Also, you specify the number of max backup folders to be created. If the number is exceeded, then the program will automatically delete the oldest one of them. <br>
# 1.Backup Script <br>
The backup script (backupd.sh) has mainly the whole logic. <br>
The script accepts 4 arguments (directory, backup-directory, interval-seconds, and max-backup-folders). The arguments are referenced in the script as $1, $2, $3, $4, in order.
The script starts with checking if the arguments given are less than 4, and if the condition doesn't exist a message will appear telling the user how to write the arguments; else exit. <br>
"ls -lR {dir} > directory-info.last" command lists the entries of a directory and subdirectories and displays the last modification time of the folder, and the output is saved in directory-info.last. <br>
Then, "diff directory-info.last.txt directory-info.new.txt" command outputs something when there's a difference between the two files (which contain the status of each directory).
To save the backup folders in the format of "backupdir/<current-date>", the date command was used to return us the date with the format we want, and then create the directory using the mkdir command. <br>
After that, the file containing the new status of the directory will be saved in the file named 'directory-info.last' because it will be an old status. 
The last part of the script checks if the number of folders in the backup directory exceeds the number of max-backup-folders specified by the user. If it exceeds the max, the oldest one will be removed using rm command; the program repeats the process every interval of time. <br>
# Makefile to run the bash script <br>
The syntax of a makefile is <br>
 targets: prerequisites <br>
<\t>	command <br>
<\t>	command <br>
the target in our makefile is called backup (or any name you call it). Then the makefile checks if the user didn't input all the required arguments it exits with a message specifying the correct format. <br>
The makefile then checks if the backup file exists or not and if it doesn't exist it will create one with the name the user specifies.
Lastly, it runs the bash script passing the arguments.<br>
# User Guide <br>
First, create the script with the .sh extension. Then make it executable with the chmod +x name_of_script command on the terminal.
To make it run through makefile you first need to check if you have a make by 'make -version' if something like GNU make 3.2 is displayed then you are all good; otherwise, install make with 'sudo apt update' command then 'install make' then make a makefile (makefiles have no extension). <br>
# Run <br>
You will only type 'make source=dir-name backup=backup-name seconds=interval-secs max=max-backup-folders
