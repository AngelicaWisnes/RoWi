
###########################
# React-related functions #
###########################
function syys { 
  $currentPath = Get-FullPath
  Start-NewPowershell { 
    param($currentPath); 
    Set-Location $currentPath; 
    yarn; 
    yarn start; 
  } ($($currentPath))
}
addToList -category "React" -name 'syys' -value 'Start new PS w/yarn && yarn start'


Set-Alias y yarn
addToList -category "React" -name 'y' -value 'yarn'


function ys { yarn start }
addToList -category "React" -name 'ys' -value 'yarn start'


function yt { yarn test }
addToList -category "React" -name 'yt' -value 'yarn test'


function yys { 
  yarn
  yarn start 
}
addToList -category "React" -name 'yys' -value 'yarn && yarn start'


function yu { yarn test -u }
addToList -category "React" -name 'yu' -value 'yarn test -u (Test w/upd snapshots)'



function ycra { 
  [Parameter(Mandatory)][String]$name
  yarn create react-app $name --template typescript
}
addToList -category "React" -name 'ycra' -value 'yarn create react-TS-app'

