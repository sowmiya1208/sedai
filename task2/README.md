summary of the script
============================================================================
The script checks if a file with IP addresses is provided.
It reads each IP address from the file and removes any extra spaces.
It validates the IP address format.
It checks if port 9000 is open on each IP address using the nc (netcat) tool.
The result (open or closed) is printed for each IP address.


Execution of the script
============================================================================
Navigate to the folder where you saved the script file (check_port.sh).
open git bash from there.
sh file and ips.txt file should be in the location where you are going to execute the command.
run command: chmod +x check_port.sh 
             ./check_port_9000.sh ips.txt


Output
===============================================================
192.168.1.10:9000 is CLOSED
192.168.1.20:9000 is CLOSED
192.168.1.30:9000 is CLOSED
