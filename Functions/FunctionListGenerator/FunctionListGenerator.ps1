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

  $sb = new-object -TypeName System.Text.StringBuilder
  $sb.AppendFormat("|{0}|{1}|{2}|"
    , (FormatString $element.category ($global:categoryWidth - $x) $fillerChar -NoPadding:$NoPadding)
    , (FormatString $element.name ($global:nameWidth - $x) $fillerChar -NoPadding:$NoPadding)
    , (FormatString $element.value ($global:valueWidth - $x) $fillerChar -NoPadding:$NoPadding)) > $null
  Return $sb.ToString()
}

function fillDualLists {
  $col1_Len = $FunctionList_Dual_Col2.Count - $FunctionList_Dual_Col1.Count
  $col2_Len = $FunctionList_Dual_Col1.Count - $FunctionList_Dual_Col2.Count
  
  For ($i = 0; $i -lt $col1_Len; $i++) { $global:FunctionList_Dual_Col1.Add( $FunctionSubList_Empty ) }
  For ($i = 0; $i -lt $col2_Len; $i++) { $global:FunctionList_Dual_Col2.Add( $FunctionSubList_Empty ) }
  $global:FunctionList_Dual_Col1.Add( $FunctionSubList_End ) 
  $global:FunctionList_Dual_Col2.Add( $FunctionSubList_End ) 
}


########################
# Define function-list #
########################
$FunctionSubList_Empty = [FunctionListElement]@{ category = ''; name = ''; value = '' }
$FunctionSubList_Labels = [FunctionListElement]@{ category = 'CATEGORY'; name = 'NAME'; value = 'VALUE' }
$FunctionSubList_End = [FunctionListElement]@{ category = '_'; name = '_'; value = '_' }

function Initialize-FunctionListGenerator {
  $global:FunctionList_single = new-object System.Collections.Generic.List[FunctionListElement]
  $global:FunctionList_Dual_Col1 = new-object System.Collections.Generic.List[FunctionListElement]
  $global:FunctionList_Dual_Col2 = new-object System.Collections.Generic.List[FunctionListElement]
  $global:FunctionList_single.Add( $FunctionSubList_Labels )
  $global:FunctionList_Dual_Col1.Add( $FunctionSubList_Labels )
  $global:FunctionList_Dual_Col2.Add( $FunctionSubList_Labels )
  
  $global:FunctionLists = $global:FunctionLists.GetEnumerator() `
  | Sort-Object { -($_.Value.quantity) } `
  | ForEach-Object { @{ $_.Key = $_.Value } }

  foreach ($listObject in $global:FunctionLists.Values) { 
    $global:FunctionList_single.AddRange( $listObject.list )
    
    $diff = $global:FunctionList_Dual_Col1.Count - $global:FunctionList_Dual_Col2.Count
    if ($diff -le 0) { $global:FunctionList_Dual_Col1.AddRange( $listObject.list ) }
    else { $global:FunctionList_Dual_Col2.AddRange( $listObject.list ) }
  }
  $global:FunctionList_single.Add( $FunctionSubList_End )
  
  # Define helper-variables for function-list-generation
  $global:categoryWidth = (($FunctionList_single.category) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:nameWidth = (($FunctionList_single.name) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:valueWidth = (($FunctionList_single.value) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:fullWidth = $global:categoryWidth + $global:nameWidth + $global:valueWidth + 5
  $global:total_width_single = $global:fullWidth + 3
  $global:total_width_dual = $global:total_width_single * 2

  # Invoke Filling-function
  fillDualLists
}


####################
# Calling-function #
####################
function print_functions_and_aliases() {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 2
  $isDual = $global:total_width_dual -lt $windowWidth
  $isSingleWithPadding = $global:total_width_single -lt $windowWidth
  $isSingleNoPadding = (-not $isDual) -and (-not $isSingleWithPadding)
  $widthAdjustment = If ($isSingleNoPadding) { 6 } Else { 0 }

  $sb = [System.Text.StringBuilder]::new("RoWi-defined functions and aliases:")
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
Set-Alias l print_functions_and_aliases
addToList -category 'Other' -name 'l' -value 'Print alias list'

function Get-FunctionListGeneratorCommandInfo {
  Write-Host -ForegroundColor Red "Enter 'l' to list all profile-defined functions and aliases "
}
