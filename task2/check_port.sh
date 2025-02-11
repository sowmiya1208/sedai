#!/bin/bash

# Check if a file with IPs is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file_with_ips>"
  exit 1
fi

# Loop through each line in the provided file (each IP)
while IFS= read -r ip || [ -n "$ip" ]; do
  # Remove leading and trailing whitespace
  ip=$(echo "$ip" | xargs)

  # Check if the IP address is valid
  if [[ ! "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "$ip: Invalid IP address format."
    continue
  fi

  # Use nc (netcat) to check if port 9000 is open
  nc -z -v -w5 "$ip" 9000 &>/dev/null

  if [ $? -eq 0 ]; then
    echo "$ip:9000 is OPEN"
  else
    echo "$ip:9000 is CLOSED"
  fi
done < "$1"
