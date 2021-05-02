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
# #Write result to a logfile.


$result_list = @{
   name = $software_name
   version = $software_version
}

foreach ($items in $result_list){
    Write-Host $items
}

#TODO: Figure out how to take the extracted data and insert into a dotnet package statement
#dotnet add package $package_list.Include --version $package_list.Version  --package-directory C:\test_dir
