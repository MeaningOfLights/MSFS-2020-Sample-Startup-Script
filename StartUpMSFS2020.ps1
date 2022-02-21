# __  __            _____ __        
# \ \/ /___ ___  __/ ___// /____  __
#  \  / __ `/ / / /\__ \/ //_/ / / /
#  / / /_/ / /_/ /___/ / ,< / /_/ / 
# /_/\__,_/\__, //____/_/|_|\__, /  
#         /____/           /____/   
# YaySky - Fun Flying Games.........

# ==========================================================================
# Start up script for Microsoft Flight Simulator and a variety of utilities.
# ==========================================================================

# INSTRUCTIONS:

# Run the Google Map (Bing Map replacement) utility before MSFS2020 
& 'D:\MSFS2020 Map Enhancement\MSFS2020 Map Enhancement.exe'
Start-Sleep 5


# Run Microsoft Flight Simulator 2020
explorer.exe 'shell:AppsFolder\Microsoft.FlightSimulator_8wekyb3d8bbwe!App'

# Give the game some time to load components which the other utilities depend on
Start-Sleep 240


# Run Landing Rate Monitor
& 'C:\Program Files (x86)\Landing Rate Monitor\LRM.exe'


# Run OpenTrack
& "C:\Program Files (x86)\opentrack\opentrack.exe"

# ISSUE: OpenTrack requires manually clicking the Start button
# PROBLEM: SendKeys doesn't work on Windows 10
# # Start-Sleep 4
# # $wshell = New-Object -ComObject wscript.shell;
# # $wshell.AppActivate('opentrack-2.3.12 :: SmoothTrack.ini')
# # $wshell.SendKeys('{F1}')

# PLAN: I raised issue and the developer is addressing it here:
# SOLUTION: https://github.com/opentrack/opentrack/issues/1367#issuecomment-1046231882


# Run VFR Map
Start-Process 'E:\MS Flight Sim 2020 AddOns\VFR Map\vfrmap.exe' -wait

# Launch browser to view VFR Map
$url = "http://localhost:9000"
Start-Process "chrome" $url


# Pause script and prompt for user input before closing everything up
Read-Host -Prompt "After the Flight Simulator game press Enter to exit and close all the applications.."


# # TODO: Close apps (in Task Manager > Go to Details" > use the name of the Ex)
# function StopApplication([string] $appName){
#    $appProc = Get-Process -name $appName -ErrorAction "Ignore"
#    if ($appProc -ne $null) {
#       echo "Stopping..." + $appName
#       Stop-Process -Name $appName -force
#    } else {
#       echo 'Not running ' + $appName + ', no process found.'
#    }
# }

# $appName = "MSFS2020 Map Enhancement"
# StopApplication($appName)

# $appName = "opentrack"
# StopApplication($appName)

# $appName = "LRM"
# StopApplication($appName)

# $appName = "FlightSimulator"
# StopApplication($appName)