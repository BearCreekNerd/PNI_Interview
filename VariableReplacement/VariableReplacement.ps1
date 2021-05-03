#Author: Perry Grewal
#PNI Interview Question.


#Get-Content .\variables.json -Raw | Test-Json
$json_file = Get-Content -Raw .\variables.json | ConvertFrom-Json 
$json_objects_hash = @{}

#$json_file.variables
#$json_file.variables[2]


foreach ($json_object in $json_file.variables){
    $json_objects_hash.Add($json_object.Name, $json_object.Value)
}

$json_objects_hash

# This code does not work --> it does not overwrite the attribute in the file
$xmlDoc = [XML](Get-Content ".\App_Test.config")
 foreach ($item in  $xmlDoc.configuration.appSettings.add){
   # $item.value = "Perry is dumb."
   # $item.key = "Perry is smartish"

    if ($item.value -match "#{(.+)}"){
        $item.value = $json_objects_hash[$matches[1]]
    }
}
$xmlDoc.Save("App_Test.config")


