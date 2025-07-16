#!/bin/bash
while true; do
  command -v clear >/dev/null && clear #command -v clear: Checks if the clear command exists and is available in the system's PATH.
  echo "=== System Status ==="
  uptime
  echo
  echo "1) View Disk Usage"
  echo "2) View Memory Usage"
  echo "3) Exit"

  read -rp "Select an option: " opt
  case "$opt" in
    1) df -h ;;
    2) free -m ;;
    3) break ;;
    *) echo "Invalid option." ;;
  esac
  read -rp "Press Enter to continue..."
done