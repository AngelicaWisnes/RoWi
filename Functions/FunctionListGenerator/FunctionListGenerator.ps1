# Suppress 'unused-variable'-warning for this file
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')] param()


########################################################
# Define helper-functions for function-list-generation #
########################################################

function FormatString([string]$str, [int]$length, [string]$padding = " ", [switch]$NoPadding) { 
  if ($NoPadding) { $x = 0 } else { $x = 1 }
  Return ($padding * $x) + $str + ($padding * ($length - ((($padding * $x) + $str).Length))) + ($padding * $x) 
}

function FormatElement([FunctionListElement]$element, [switch]$NoPadding) {
  $padding = $(If ($element.value -eq "_") { "_" } elseif ($element.value -eq "-") { "-" } Else { " " })
  if ($NoPadding) { $x = 1 } else { $x = 0 }

  $sb = new-object -TypeName System.Text.StringBuilder
  $sb.AppendFormat("|{0}|{1}|{2}|"
    , (FormatString $element.category ($categoryWidth - $x) $padding -NoPadding:$NoPadding)
    , (FormatString $element.name ($nameWidth - $x) $padding -NoPadding:$NoPadding)
    , (FormatString $element.value ($valueWidth - $x) $padding -NoPadding:$NoPadding)) > $null
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

function _print_functions_and_aliases_single([switch]$NoPadding) {
  $sb = new-object -TypeName System.Text.StringBuilder
  $sb.AppendFormat("RoWi-defined functions and aliases:") > $null

  if ($NoPadding) {
    $sb.AppendFormat("`n {0}`n", (FormatString "" ($fullWidth - 5) "_" -NoPadding)) > $null
    $FunctionList_single | ForEach-Object { $sb.AppendFormat("{0}`n", (FormatElement $_ -NoPadding:$NoPadding)) > $null }
  }
  else { 
    $sb.AppendFormat("$newline {0}$newLine", (FormatString "" $fullWidth "_")) > $null
    $FunctionList_single | ForEach-Object { $sb.AppendFormat("{0}$newLine", (FormatElement $_)) > $null }
  }

  Return $sb.ToString()
}

function _print_functions_and_aliases_single_dual {
  $sb = new-object -TypeName System.Text.StringBuilder
  $sb.AppendFormat("RoWi-defined functions and aliases:$newLine") > $null
  $sb.AppendFormat(" {0}", (FormatString "" $fullWidth "_")) > $null
  $sb.AppendFormat("   {0}$newLine", (FormatString "" $fullWidth "_")) > $null

  $length = ($FunctionList_Dual_Col1.Count, $FunctionList_Dual_Col2.Count | Measure-Object -Max).Maximum 
  for ($i = 0; $i -lt $length; $i++) { 
    $col1_str = $(If ($null -eq $FunctionList_Dual_Col1[$i]) { "  " + (FormatString "" $fullWidth " ") } Else { FormatElement $FunctionList_Dual_Col1[$i] })
    $col2_str = $(If ($null -eq $FunctionList_Dual_Col2[$i]) { " " } Else { FormatElement $FunctionList_Dual_Col2[$i] })

    $sb.AppendFormat("{0} {1}$newLine", ($col1_str), ($col2_str)) > $null 
  }

  Return $sb.ToString()
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
  $global:fullWidth = $categoryWidth + $nameWidth + $valueWidth + 4
  $global:newLine = "`n  "
  $global:total_width_sisngle = ($fullWidth) + 4
  $global:total_width_dual = $total_width_sisngle * 2

  # Invoke Filling-function
  fillDualLists
}


####################
# Calling-function #
####################
function print_functions_and_aliases {
  $windowWidth = $Host.UI.RawUI.WindowSize.Width
  If ($total_width_dual -lt ($windowWidth - 2)) { $functionList = _print_functions_and_aliases_single_dual }
  elseif ($total_width_sisngle -lt ($windowWidth - 2)) { $functionList = _print_functions_and_aliases_single }
  Else { $functionList = $(_print_functions_and_aliases_single -NoPadding) }

  Write-Host -ForegroundColor Red $functionList
}
Set-Alias l print_functions_and_aliases

function PRINT_FUNCTION_LIST_GENERATOR_INFO {
  Write-Host -ForegroundColor Red "Enter 'l' to list all profile-defined functions and aliases "
}