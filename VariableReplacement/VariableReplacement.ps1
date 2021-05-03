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

#TODO
#load the xml file
#set set the xml attributes from the extraced values of the JSON file.
#create a new hashtable with the names as the keys and the values as the values
#overwrite the value attributes in the xml file with the correct value from i.e."Value": "PNI"


