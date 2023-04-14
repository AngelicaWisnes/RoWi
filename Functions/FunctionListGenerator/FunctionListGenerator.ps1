# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()


########################################################
# Define helper-functions for function-list-generation #
########################################################

function FormatString([string]$str, [int]$length, [string]$paddingChar = " ", [switch]$NoPadding) { 
  $extraPadding = If ($NoPadding) { "" } Else { $paddingChar }
  Return $extraPadding + $str + ($paddingChar * ($length - (($extraPadding + $str).Length))) + $extraPadding 
}

function FormatElement([FunctionListElement]$element, [switch]$NoPadding) {
  $paddingChar = If ($element.value -eq "_") { "_" } elseif ($element.value -eq "-") { "-" } Else { " " }
  $x = If ($NoPadding) { 1 } Else { 0 }

  $sb = new-object -TypeName System.Text.StringBuilder
  $sb.AppendFormat("|{0}|{1}|{2}|"
    , (FormatString $element.category ($global:categoryWidth - $x) $paddingChar -NoPadding:$NoPadding)
    , (FormatString $element.name ($global:nameWidth - $x) $paddingChar -NoPadding:$NoPadding)
    , (FormatString $element.value ($global:valueWidth - $x) $paddingChar -NoPadding:$NoPadding)) > $null
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

$FunctionSubList_Other = new-object System.Collections.Generic.List[FunctionListElement]
$FunctionSubList_Other.Add( $FunctionSubList_BREAK )
$FunctionSubList_Other.Add(( [FunctionListElement]@{ category = 'Other'       ; name = 'l'         ; value = 'Print alias list' } ))


function INITIALIZE_FUNCTION_LIST_GENERATOR {
  $global:FunctionList_single = new-object System.Collections.Generic.List[FunctionListElement]
  $global:FunctionList_single.Add( $FunctionSubList_Labels )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_PROGRAM )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_POWERSHELL )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_GIT )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_JUPYTER )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_REACT )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_SYSTEM )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_PROJECT )
  $global:FunctionList_single.AddRange( $global:FunctionSubList_PRINTING )
  $global:FunctionList_single.AddRange( $FunctionSubList_Other )
  $global:FunctionList_single.Add( $FunctionSubList_End )

  $global:FunctionList_Dual_Col1 = new-object System.Collections.Generic.List[FunctionListElement]
  $global:FunctionList_Dual_Col1.Add( $FunctionSubList_Labels )
  $global:FunctionList_Dual_Col1.AddRange( $global:FunctionSubList_PROGRAM )
  $global:FunctionList_Dual_Col1.AddRange( $global:FunctionSubList_POWERSHELL )
  $global:FunctionList_Dual_Col1.AddRange( $global:FunctionSubList_JUPYTER )
  $global:FunctionList_Dual_Col1.AddRange( $global:FunctionSubList_SYSTEM )
  $global:FunctionList_Dual_Col1.AddRange( $global:FunctionSubList_PRINTING )
  $global:FunctionList_Dual_Col1.AddRange( $FunctionSubList_Other )
  
  $global:FunctionList_Dual_Col2 = new-object System.Collections.Generic.List[FunctionListElement]
  $global:FunctionList_Dual_Col2.Add( $FunctionSubList_Labels )
  $global:FunctionList_Dual_Col2.AddRange( $global:FunctionSubList_GIT )
  $global:FunctionList_Dual_Col2.AddRange( $global:FunctionSubList_REACT )
  $global:FunctionList_Dual_Col2.AddRange( $global:FunctionSubList_PROJECT )

  # Define helper-variables for function-list-generation
  $global:categoryWidth = (($FunctionList_single.category) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:nameWidth = (($FunctionList_single.name) | Measure-Object -Maximum -Property Length).Maximum + 1
  $global:valueWidth = (($FunctionList_single.value) | Measure-Object -Maximum -Property Length).Maximum + 1

  # Invoke Filling-function
  fillDualLists
}


####################
# Calling-function #
####################
function print_functions_and_aliases() {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width - 2
  $fullWidth = $global:categoryWidth + $global:nameWidth + $global:valueWidth + 5
  $total_width_single = $fullWidth + 3
  $total_width_dual = $total_width_single * 2

  $isDual = $total_width_dual -lt $windowWidth
  $isSingleWithPadding = $total_width_single -lt $windowWidth
  $isSingleNoPadding = (-not $isDual) -and (-not $isSingleWithPadding)

  $sb = [System.Text.StringBuilder]::new("RoWi-defined functions and aliases:")
  $newLine = If ($isSingleNoPadding) { "`n" } Else { "`n  " }

  If ($isDual) { 
    $sb.AppendFormat("$newLine {0}   {0}$newLine", ("_" * ($fullWidth))) > $null
    for ($i = 0; $i -lt $FunctionList_Dual_Col1.Count; $i++) { 
      $sb.AppendFormat("{0} {1}$newLine", (FormatElement $FunctionList_Dual_Col1[$i]), (FormatElement $FunctionList_Dual_Col2[$i])) > $null 
    }
  }
  elseif ($isSingleWithPadding) { 
    $sb.AppendFormat("$newline {0}$newLine", ("_" * ($fullWidth))) > $null
    $FunctionList_single | ForEach-Object { $sb.AppendFormat("{0}$newLine", (FormatElement $_)) > $null }
  }
  Else { 
    $sb.AppendFormat("$newLine {0}$newLine", ("_" * ($fullWidth - 6))) > $null
    $FunctionList_single | ForEach-Object { $sb.AppendFormat("{0}$newLine", (FormatElement $_ -NoPadding)) > $null }
  }

  Write-Host -ForegroundColor Red $sb.ToString()
}
Set-Alias l print_functions_and_aliases

function PRINT_FUNCTION_LIST_GENERATOR_INFO {
  Write-Host -ForegroundColor Red "Enter 'l' to list all profile-defined functions and aliases "
}



