
###########################
# React-related functions #
###########################
$global:FunctionSubList_REACT = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_REACT.Add( $FunctionSubList_BREAK )
function addToList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_REACT.Add(( [FunctionListElement]@{ category = "React"; name = $name; value = $value } ))
}


function syys { 
  $currentPath = Get-FullPath
  Start-NewPowershell { 
    param($currentPath); 
    Set-Location $currentPath; 
    yarn; 
    yarn start; 
  } ($($currentPath))
}
addToList -name 'syys' -value 'Start new PS w/yarn && yarn start'


Set-Alias y yarn
addToList -name 'y' -value 'yarn'


function ys { yarn start }
addToList -name 'ys' -value 'yarn start'


function yt { yarn test }
addToList -name 'yt' -value 'yarn test'


function yys { 
  yarn
  yarn start 
}
addToList -name 'yys' -value 'yarn && yarn start'


function yu { yarn test -u }
addToList -name 'yu' -value 'yarn test -u (Test w/upd snapshots)'



function ycra { 
  [Parameter(Mandatory)][String]$name
  yarn create react-app $name --template typescript
}
addToList -name 'ycra' -value 'yarn create react-TS-app'

