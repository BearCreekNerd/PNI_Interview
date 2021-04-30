# Introduction 
This project is for creating a couple of simple powershell script to test your scripting abilities. 

# Build and Test
Script 1 - FileParse: Create a script that will
1. Find csproj files in FileParse project folder and sub folders
2. Parse the files found in previous step to find refernce nuget packages
3. Output list of all unique reference packages found in all csproj files to a seperate log file
4. Download nupkg files from Nuget.Org to a temporary folder for each of the PackageReferences

Script 2 - Variable Replacement:
Create a powershell script that will 
1. - Load the provided variabes.json file 
2. - Replace variable tokens in 2nd file xml file making sure the values are escaped properly
