

############################
# System-related functions #
############################

$global:FunctionSubList_SYSTEM = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_SYSTEM.Add( $FunctionSubList_BREAK )
function addToSystemList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_SYSTEM.Add(( [FunctionListElement]@{ category = "System"; name = $name; value = $value } ))
}

$categoriesRoot = $PSScriptRoot
. $categoriesRoot\SystemDependent\$global:SYSTEM_NAME\SystemDependentFunctions.ps1






###########################
# System-related projects #
###########################

enum ProjectType { ALL ; MULTIPLE ; STANDARD }
enum IdeChoice { AUTO ; NONE; VSCODE ; DOTNET ; JS } # TODO: This is currently not in use. Implement the auto-choosing function first

class PROJECT {
  [enum]$type;
  [string]$name; 
  [string]$repo; 
  [string]$branch; 
  [int]$useDotNetIde;
  [string]$webs; 
  [bool]$stdSctript;
  [scriptblock]$customScript; 
  [array]$nestedProjects;
} 


$global:allProjects = [PROJECT]@{ 
  type           = [ProjectType]::ALL
  name           = 'All of the following'
  repo           = ''
  branch         = ''
  useDotNetIde   = 0
  webs           = ''
  stdSctript     = $false
  customScript   = { For ($i = 1; $i -lt $projects.length; $i++) { pro -projects $projects -decision $i; } } 
  nestedProjects = @()
};

$global:systemProjectsPath = "$categoriesRoot\SystemDependent\$global:SYSTEM_NAME\SystemDependentProjects.ps1"
. $global:systemProjectsPath