import subprocess
import psutil
import time
import os

# Define the shell script file
DiscScript = './DiskSpace.sh'
NetworkScript = './NetworkTraffic.sh'
# Run disc data script and capture the output
DiscInfo= subprocess.run([DiscScript], capture_output=True, text=True)
#Run network data script and capture the output
NetworkInfo = subprocess.run([NetworkScript], capture_output=True, text=True)

#Clear screen
import os

def clear_screen():
    # For Windows
    if os.name == 'nt':
        os.system('cls')
    # For Linux and macOS
    else:
        os.system('clear')

# Clear the screen
clear_screen()


# Print the output

print(DiscInfo.stdout)
print(NetworkInfo.stdout)

#print "--------------------"

def UsageStats(cpu_usage, mem_usage, bars=50):
    
    CpuPercentage = (cpu_usage/100.0)
    CpuBar = '█'*int(CpuPercentage*bars) + '-'*(bars- int(CpuPercentage*bars)) 
    MemPercent = (mem_usage/100.0)
    MemBar = '█'*int(MemPercent*bars) + '-'*(bars- int(MemPercent*bars))

    print(f"\r CPU Utilisation: | {CpuBar}|  ", end =" ")
    print(f" Memory Utilisation: | {MemBar}|  ", end ="\r ")
    
while True:
        UsageStats(psutil.cpu_percent(), psutil.virtual_memory().percent,30)
        time.sleep(0.5)

