# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()


# Define elements for FunctionListGenerator
class FunctionListElement { [string]$category ; [string]$name ; [string]$value } 
$FunctionSubList_BREAK = [FunctionListElement]@{ category = '-'; name = '-'; value = '-' }




$global:newFunctionLists = [ordered]@{
    Program    = new-object System.Collections.Generic.List[FunctionListElement];
    PowerShell = new-object System.Collections.Generic.List[FunctionListElement];
    Git        = new-object System.Collections.Generic.List[FunctionListElement];
    Jupyter    = new-object System.Collections.Generic.List[FunctionListElement];
    React      = new-object System.Collections.Generic.List[FunctionListElement];
    System     = new-object System.Collections.Generic.List[FunctionListElement];
    Project    = new-object System.Collections.Generic.List[FunctionListElement];
    Printing   = new-object System.Collections.Generic.List[FunctionListElement];
    Other      = new-object System.Collections.Generic.List[FunctionListElement];
}

foreach ($list in $global:newFunctionLists.Values) { $list.Add( $FunctionSubList_BREAK ) }


function addTonewList {
    param(
        [Parameter(Mandatory)][String]$category,
        [Parameter(Mandatory)][String]$name,
        [Parameter(Mandatory)][String]$value
    )
    $global:newFunctionLists[$category].Add(( [FunctionListElement]@{ category = $category; name = $name; value = $value } ))
}





# Import functions
$functionsRoot = $PSScriptRoot
. $functionsRoot\Categories\Git.ps1
. $functionsRoot\Categories\Jupyter.ps1
. $functionsRoot\Categories\PowerShell.ps1
. $functionsRoot\Categories\Printing.ps1
. $functionsRoot\Categories\Printing_Pride.ps1
. $functionsRoot\Categories\Program.ps1
. $functionsRoot\Categories\Project.ps1
. $functionsRoot\Categories\React.ps1
. $functionsRoot\Categories\System.ps1


# Import and nitialize FunctionListGenerator
. $functionsRoot\FunctionListGenerator\FunctionListGenerator.ps1
INITIALIZE_FUNCTION_LIST_GENERATOR
