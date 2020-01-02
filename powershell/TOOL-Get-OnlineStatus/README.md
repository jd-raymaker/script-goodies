# Get-OnlineStatus
Runs Test-Connection on several devices on a network simultaneously.

## Example:
```powershell
.\Start-Cleanup.ps1 -import devicelist.txt -export exportedlist
```
## Parameters
### Import
Path to text file containing a list of devices you want to ping / Test-Connection on. (line seperated list). Can contain hostname and IP.
#### Example
```
computer01
computer02
server01
10.0.0.1
192.168.1.1
example.com
```
### Export
Name of file you want export to. This exports the file as an CSV file. (no need to specify file extention)