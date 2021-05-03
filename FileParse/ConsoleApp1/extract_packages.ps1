$files = Get-ChildItem -Recurse -Filter *csproj 
$packages_hash = @{}

#$software_name = $files | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object { $_.Node.Include }
#$software_version = $files | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object { $_.Node.Version }

foreach($file in $files){
    $xml_nodes = Select-Xml -Xpath /Project/ItemGroup/PackageReference -Path $file
    foreach($xml in $xml_nodes){
        Write-Host $xml.Node.Include
        Write-Host $xml.Node.Version
        $packages_hash.Add($xml.Node.Include, $xml.Node.Version)
    }
    
}

$packages_hash
#Set-Location  .\ClassLibrary1
foreach($key in $packages_hash.Keys){
    Install-Package $key -RequiredVersion $packages_hash[$key] -Destination C:\temp_dir1 -SkipDependencies
}

Write-Host "Thank you and have a nice day!"

exit 


