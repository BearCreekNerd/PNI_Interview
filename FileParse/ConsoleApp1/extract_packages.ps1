$files = Get-ChildItem -Recurse -Filter *csproj 
#$xpath = /Project/ItemGroup/PackageReference
#$logfile = Out-File -FilePath .\log.txt
$result = @( foreach ($file in $files){
    #$file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object {$_.Node.Include, $_.Node.version} | Select-Object -Unique | Out-File -FilePath .\log.txt -Append
    #Write-Host $file
    $file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | Select-Object -ExpandProperty Node

    #| Select-Object ExpandProperty Node
    
    }
)
#$result | ForEach-Object {$_.Version}

$software_name = $result | ForEach-Object {$_.Include}

$software_version = $result | ForEach-Object {$_.Version}


$software_name
$software_version





#TODO: Figure out how to take the extracted data and insert into a dotnet package statement
#dotnet add package $package_list.Include --version $package_list.Version  --package-directory C:\test_dir
