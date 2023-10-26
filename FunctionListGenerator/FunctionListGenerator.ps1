# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()


########################################################
# Define helper-functions for function-list-generation #
########################################################

function FormatString([string]$str, [int]$length, [string]$fillerChar, [switch]$NoPadding) { 
  $extraPadding = If ($NoPadding) { "" } Else { $fillerChar }
  Return $extraPadding + $str + ($fillerChar * ($length - (($extraPadding + $str).Length))) + $extraPadding 
}

function FormatElement([FunctionListElement]$element, [switch]$NoPadding) {
  $fillerChar = If ($element.value -eq "_") { "_" } elseif ($element.value -eq "-") { "-" } Else { " " }
  $x = If ($NoPadding) { 1 } Else { 0 }

  $sb = [System.Text.StringBuilder]::new()
  $sb.AppendFormat("|{0}|{1}|{2}|"
    , (FormatString $element.category ($global:categoryWidth - $x) $fillerChar -NoPadding:$NoPadding)
    , (FormatString $element.name ($global:nameWidth - $x) $fillerChar -NoPadding:$NoPadding)
    , (FormatString $element.value ($global:valueWidth - $x) $fillerChar -NoPadding:$NoPadding)) > $null
  Return $sb.ToString()
}

function Add-BlankLinesToDualLists {
  $col1_Len = $FunctionList_Dual_Col2.Count - $FunctionList_Dual_Col1.Count
  $col2_Len = $FunctionList_Dual_Col1.Count - $FunctionList_Dual_Col2.Count
  
  For ($i = 0; $i -lt $col1_Len; $i++) { $FunctionList_Dual_Col1.Add( $FunctionSubList_Empty ) }
  For ($i = 0; $i -lt $col2_Len; $i++) { $FunctionList_Dual_Col2.Add( $FunctionSubList_Empty ) }
}


########################
# Define function-list #
########################
class FunctionListElement { [string]$category ; [string]$name ; [string]$value } 

$FunctionSubList_BREAK = [FunctionListElement]@{ category = '-'; name = '-'; value = '-' }
$FunctionSubList_Empty = [FunctionListElement]@{ category = ''; name = ''; value = '' }
$FunctionSubList_Labels = [FunctionListElement]@{ category = 'CATEGORY'; name = 'NAME'; value = 'VALUE' }
$FunctionSubList_End = [FunctionListElement]@{ category = '_'; name = '_'; value = '_' }

$global:FunctionLists = @{
  Program    = [System.Collections.Generic.List[FunctionListElement]]::new();
  PowerShell = [System.Collections.Generic.List[FunctionListElement]]::new();
  Git        = [System.Collections.Generic.List[FunctionListElement]]::new();
  Jupyter    = [System.Collections.Generic.List[FunctionListElement]]::new();
  React      = [System.Collections.Generic.List[FunctionListElement]]::new();
  System     = [System.Collections.Generic.List[FunctionListElement]]::new();
  Project    = [System.Collections.Generic.List[FunctionListElement]]::new();
  Printing   = [System.Collections.Generic.List[FunctionListElement]]::new();
  Other      = [System.Collections.Generic.List[FunctionListElement]]::new();
}

foreach ($list in $global:FunctionLists.Values) { $list.Add( $FunctionSubList_BREAK ) }

$FunctionList_single = [System.Collections.Generic.List[FunctionListElement]]::new()
$FunctionList_Dual_Col1 = [System.Collections.Generic.List[FunctionListElement]]::new()
$FunctionList_Dual_Col2 = [System.Collections.Generic.List[FunctionListElement]]::new()

function Initialize-FunctionListGenerator {
  $FunctionList_single.Add( $FunctionSubList_Labels )
  $FunctionList_Dual_Col1.Add( $FunctionSubList_Labels )
  $FunctionList_Dual_Col2.Add( $FunctionSubList_Labels )
  
  $global:FunctionLists = $global:FunctionLists.GetEnumerator() `
  | Sort-Object { - ($_.Value.Count) } `
  | ForEach-Object { @{ $_.Key = $_.Value } }
  
  foreach ($listObject in $global:FunctionLists.Values) { 
    $listObject = [System.Collections.Generic.List[FunctionListElement]]($listObject | Sort-Object -Property value)
    $FunctionList_single.AddRange( $listObject )
    
    $diff = $FunctionList_Dual_Col1.Count - $FunctionList_Dual_Col2.Count
    if ($diff -le 0) { $FunctionList_Dual_Col1.AddRange( $listObject ) }
    else { $FunctionList_Dual_Col2.AddRange( $listObject ) }
  }
  
  Add-BlankLinesToDualLists
  $FunctionList_single.Add( $FunctionSubList_End )
  $FunctionList_Dual_Col1.Add( $FunctionSubList_End ) 
  $FunctionList_Dual_Col2.Add( $FunctionSubList_End ) 
  
  # Define helper-variables for function-list-generation
  $global:categoryWidth = (($FunctionList_single.category) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:nameWidth = (($FunctionList_single.name) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:valueWidth = (($FunctionList_single.value) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:fullWidth = $global:categoryWidth + $global:nameWidth + $global:valueWidth + 5
  $global:total_width_single = $global:fullWidth + 3
  $global:total_width_dual = $global:total_width_single * 2
}


####################
# Calling-function #
####################
function Add-ToFunctionList {
  param(
    [Parameter(Mandatory)][String]$category,
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionLists[$category].Add(( [FunctionListElement]@{ category = $category; name = $name; value = $value } ))
}

function Get-ListOfFunctionsAndAliases {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 2
  $isDual = $global:total_width_dual -lt $windowWidth
  $isSingleWithPadding = $global:total_width_single -lt $windowWidth
  $isSingleNoPadding = (-not $isDual) -and (-not $isSingleWithPadding)
  $widthAdjustment = If ($isSingleNoPadding) { 6 } Else { 0 }

  $sb = [System.Text.StringBuilder]::new("AWI-defined functions and aliases:")
  $newLine = If ($isSingleNoPadding) { "`n" } Else { "`n  " }

  If ($isDual) { 
    $sb.AppendFormat("$newLine {0}   {0}$newLine", ("_" * ($global:fullWidth))) > $null
    for ($i = 0; $i -lt $FunctionList_Dual_Col1.Count; $i++) { 
      $sb.AppendFormat("{0} {1}$newLine", (FormatElement $FunctionList_Dual_Col1[$i]), (FormatElement $FunctionList_Dual_Col2[$i])) > $null 
    }
  }
  Else { 
    $sb.AppendFormat("$newLine {0}$newLine", ("_" * ($global:fullWidth - $widthAdjustment))) > $null
    $FunctionList_single | ForEach-Object { $sb.AppendFormat("{0}$newLine", (FormatElement $_ -NoPadding:$isSingleNoPadding)) > $null }
  }

  Write-Host -ForegroundColor Red $sb.ToString()
}
Set-Alias l Get-ListOfFunctionsAndAliases
Add-ToFunctionList -category 'Other' -name 'l' -value 'Get list of functions and aliases'

function Get-FunctionListInfo {
  OUT $(PE -txt:"Enter 'l' to list all AWI-defined functions and aliases " -fg:$global:colors.Red)
}
