$files = Get-ChildItem -Recurse -Filter *csproj 
$csproj_content= Get-Content $files | ConvertTo-Xml

$csproj_content.DocumentElement.Attributes.Equals("Value")

#[xml]$xml = Get-Content -Path $files
#$xml.Project.ItemGroup.PackageReference | Where-Object PackageReference -eq "Newtonsoft.Json"