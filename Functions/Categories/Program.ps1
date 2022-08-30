
##############################
# Program-related functions #
##############################
$global:FunctionSubList_PROGRAM = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_PROGRAM.Add( $FunctionSubList_BREAK )
function addToList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_PROGRAM.Add(( [FunctionListElement]@{ category = "Program"; name = $name; value = $value } ))
}


function ide_autoChoose {
  <#
  TODO: Create a dynamic choosing-agorithm for opening the best IDE for (parameterized)-"current directory", 
  based on the content of said directory
  
  Examples: 
  If directory contains a yarn.lock-file, or a file with extention ".js", ".jsx", ".ts", ".tsx", then open ide_JavaScript
  elseif directory contains ".sln", then open ide_dotNet
  Else open ide_vsCode
  #>
}


function ide_dotNet { _startIDE $global:MY_DOTNET_IDE }
Set-Alias dn ide_dotNet
addToList -name 'dn' -value 'Open the dotNET-IDE'


function ide_javaScript { _startIDE $global:MY_JS_IDE }
Set-Alias js ide_javaScript
addToList -name 'js' -value 'Open the JavaScript-IDE'


function ide_vsCode { code . }
Set-Alias c. ide_vsCode
addToList -name 'c.' -value 'Open VS Code in current dir'


function ide_vsCode_NewFile { code -n NewFile }
Set-Alias cn ide_vsCode_NewFile
addToList -name 'cn' -value 'Open new file in VS Code'


function o { 
  If ($args.Length -eq 0) { Invoke-Item . }
  Else { Invoke-Item $args }
}
addToList -name 'o' -value 'Open current directory'
addToList -name 'o args' -value 'Open args'


Set-Alias open Invoke-Item
addToList -name 'open' -value 'Invoke-Item'


function startNewBrowser {
  # Args must be a string, and specialcharacters must be escaped
  Start-Process $global:MY_BROWSER -ArgumentList "--new-window", "$args" 
}
Set-Alias snb startNewBrowser
addToList -name 'snb' -value 'Start new browser'


function _startIDE {
  param( [Parameter(Mandatory)][string]$IDE )
  $currentPath = getPath
  Start-Process $IDE -ArgumentList "$currentPath" 
}
