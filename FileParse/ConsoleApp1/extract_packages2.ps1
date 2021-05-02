$files = Get-ChildItem -Recurse -Filter *csproj  



$result2 = $files | Select-Xml -Xpath /Project/ItemGroup/PackageReference | Select-Object {$_.Node.Include} | Group-Object -AsHashTable

foreach ($item in $result2.Values){
    $item
}