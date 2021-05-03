$files = Get-ChildItem -Recurse -Filter *csproj 

#Get-Content $files

$software_name = $files | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object { $_.Node.Include }
$software_version = $files | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object { $_.Node.Version }


$software_name
$software_version

$result = @( foreach ($file in $files){
    #$file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object {$_.Node.Include, $_.Node.version} | Select-Object -Unique | Out-File -FilePath .\log.txt -Append
        $file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | Select-Object -ExpandProperty Node
    }
) 

$result



$logfile = $result | Out-File .\log.txt
$logfile

Write-Host "---------"
Write-Host "---------"


$read_log = Get-Content .\log.txt

Write-Host $read_log

foreach($lines in $read_log){
     Write-Host $lines
}

# #Write result to a logfile.



# foreach($key in $result.keys)
# {
#     $message = '{0} is {1} years old' -f $key, $result[$key]
#     Write-Output $message
# }

# $result_list = @{
#    name = $software_name
#    version = $software_version
# }

# Write-Host $result_list[$software_name]

# foreach ($items in $result_list){
#     Write-Host $items
# }

#TODO: Figure out how to take the extracted data and insert into a dotnet package statement
#dotnet add package $package_list.Include --version $package_list.Version  --package-directory C:\test_dir
