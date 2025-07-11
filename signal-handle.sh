#!/bin/bash

#Purpose of trap Command:
#It handles system signals like SIGINT (sent by Ctrl+C).
#Allows your script to respond to interruptions.

#Using trap for Ctrl+C (SIGINT):
#trap cleanup SIGINT means: if the user presses Ctrl+C, run the cleanup function.

#cleanup Function:
#A custom function to define what should happen if the script is interrupted.
#Example: show a message, close resources, logging, stop processes and exit cleanly.

#Script Structure:
#Begins with #!/bin/bash to specify the interpreter.
#The trap is set early in the script.
#Then the script proceeds with normal execution (echo, sleep, etc.).

#Why Signal Handling is Important:
#Makes scripts robust.
#Prevents resource leaks, incomplete processes, or corrupted data on interruption.
#Useful for long-running or critical scripts.


function clean_up(){
	echo "Cleaning things up......."
	# Add your cleanup actions here
	exit 1
}

# Set up a trap to call the cleanup function when Ctrl+C (SIGINT) is received
trap clean_up SIGINT
#Rest of your script
echo "Running..."
sleep 10
echo "Finished."



