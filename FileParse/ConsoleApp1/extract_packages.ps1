$files = Get-ChildItem -Recurse -Filter *csproj 
#$logfile = Out-File -FilePath .\log.txt
foreach ($file in $files){
    #$file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object {$_.Node.Include, $_.Node.version} | Select-Object -Unique | Out-File -FilePath .\log.txt -Append
    Write-Host $file
    $software_list = $file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | Select-Object -ExpandProperty Node 
    $software_list
}

#TODO: Figure out how to take the extracted data and insert into a dotnet package statement
#dotnet add package $package_list.Include --version $package_list.Version  --package-directory C:\test_dir
