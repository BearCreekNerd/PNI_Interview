$files = Get-ChildItem -Recurse -Filter *csproj 
$solution_file = Get-ChildItem -Recurse -Filter *sln

$solution_file

$result = @( foreach ($file in $files){
    #$file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object {$_.Node.Include, $_.Node.version} | Select-Object -Unique | Out-File -FilePath .\log.txt -Append
    $file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | Select-Object -ExpandProperty Node
    }
)


$software_name = $result | ForEach-Object {$_.Include} | Select-Object -Unique
$software_version = $result | ForEach-Object {$_.Version} | Select-Object -Unique




$result_list = @{
    name = $software_name
    version = $software_version
}

foreach ($h in $result_list.Values) 
{
    #write-host $h.name
    #write-host $h.version
   dotnet add package  $h.name.Item --version $h.version --package-directory c:\test_dir2
}


#$software_name
#$software_version


#TODO: Figure out how to take the extracted data and insert into a dotnet package statement
#dotnet add package $package_list.Include --version $package_list.Version  --package-directory C:\test_dir
