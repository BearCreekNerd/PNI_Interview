$files = Get-ChildItem -Recurse -Filter *csproj 

foreach ($file in $files){
    $file | Select-Xml -Xpath /Project/ItemGroup/PackageReference | ForEach-Object {$_.Node.Include}
    #$csproj_content
    #$csproj_content.Project.ItemGroup.ProjectReference | ForEach-Object {$_.Node.value}
   # $csproj_content | Select-Xml -XPath /Project/ItemGroup/ProjectReference | Select-Object -ExpandProperty Node
}