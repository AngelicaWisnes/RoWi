# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()



# Define elements for FunctionListGenerator
class FunctionListElement { [string]$category ; [string]$name ; [string]$value } 
$FunctionSubList_BREAK = [FunctionListElement]@{ category = '-'; name = '-'; value = '-' }

# Import functions
$functionsRoot = $PSScriptRoot
. $functionsRoot\Categories\Git.ps1
. $functionsRoot\Categories\Jupyter.ps1
. $functionsRoot\Categories\PowerShell.ps1
. $functionsRoot\Categories\Printing.ps1
. $functionsRoot\Categories\Program.ps1
. $functionsRoot\Categories\Project.ps1
. $functionsRoot\Categories\React.ps1
. $functionsRoot\Categories\System.ps1

# Import and nitialize FunctionListGenerator
. $functionsRoot\FunctionListGenerator\FunctionListGenerator.ps1
INITIALIZE_FUNCTION_LIST_GENERATOR
