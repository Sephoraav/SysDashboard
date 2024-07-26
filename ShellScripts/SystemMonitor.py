import subprocess
import psutil
import time
import os

# Define the shell script file
DiscScript = './DiskSpace.sh'
NetworkScript = './NetworkTraffic.sh'
CollectData = './collect_data.sh'

# Run disc data script and capture the output
DiscInfo= subprocess.run([DiscScript], capture_output=True, text=True)
#Run network data script and capture the output
NetworkInfo = subprocess.run([NetworkScript], capture_output=True, text=True)
#Run Disc & Memmory  script and capture the output
RAMCPUInfo = subprocess.run([CollectData], capture_output=True, text=True)



#Clear screen
#import os

def clear_screen():
    # For Windows
    if os.name == 'nt':
        os.system('cls')
    # For Linux and macOS
    else:
        os.system('clear')

# Clear the screen
clear_screen()

print ("=================================================")
print ("------ NETWORK SYSTEM MONITORING DASHBOARD ------")
print ("=================================================")
# Print the output

#Run network data script and capture the output
print(DiscInfo.stdout)
print(NetworkInfo.stdout)
print(RAMCPUInfo.stdout)
#print "--------------------"

def UsageStats(cpu_usage, mem_usage, bars=100):
    
    CpuPercentage = (cpu_usage/100.0)
    CpuBar = '█'*int(CpuPercentage*bars) + '-'*(bars- int(CpuPercentage*bars)) 
    MemPercent = (mem_usage/100.0)
    MemBar = '█'*int(MemPercent*bars) + '-'*(bars- int(MemPercent*bars))

    print(f"\r CPU Utilisation: | {CpuBar}| {cpu_usage} %   ", end ="  ")
    print(f" Memory Utilisation: | {MemBar}| {mem_usage} %      ", end =" ")
    
while True:
     UsageStats(psutil.cpu_percent(interval=0.1), psutil.virtual_memory().percent,40)
     time.sleep(0.5)
