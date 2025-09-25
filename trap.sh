#!/bin/bash
cleanup() {
echo "Script interrupted. Performing cleanup..."
# Add your cleanup actions here
exit 1
}
# Set up a trap to call the cleanup function when Ctrl+C (SIGINT) is received
trap cleanup SIGINT
# Rest of your script
echo "Running..."
sleep 10
echo "Finished."