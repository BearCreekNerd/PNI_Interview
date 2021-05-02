$json_file = Get-Content .\variables.json | ConvertFrom-Json

#$json_file.variables.value

$name_array = @($json_file.variables.Name)
$value_array = @($json_file.variables.value)


foreach ($items in $name_array){
    $items.ToString()
}

foreach ($items in $value_array){
    $items.ToString()

}

#TODO
#load the xml file
#set set the xml attributes from the extraced values of the JSON file.
#create a new hashtable with the names as the keys and the values as the values
