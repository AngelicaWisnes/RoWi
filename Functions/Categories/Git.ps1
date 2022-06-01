
#########################
# Git-realted functions #
#########################
$global:FunctionSubList_GIT = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_GIT.Add( $FunctionSubList_BREAK )
function addToList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_GIT.Add(( [FunctionListElement]@{ category = "Git"; name = $name; value = $value } ))
}


function addAllOrArg { 
  If ($args.Length -eq 0) { git add . }
  Else { git add $args }
  git status
}
Set-Alias a addAllOrArg
addToList -name 'a' -value 'git add args'


function createNewBranch {
  Write-Host "`nInitiating git checkout -b `n`tName-length  $global:FIFTY_CHARS `n`tBranch-name: " -NoNewline
  
  try { 
    [console]::ForegroundColor = 'DarkCyan'
    $branchName = Read-Host 
  }
  finally { [console]::ResetColor() }
  
  Write-Host "`tTrying: git checkout -b " -NoNewline 
  Write-Host -ForegroundColor DarkCyan "'$branchName'`n"
  
  git checkout -b $branchName
}
Set-Alias b createNewBranch
addToList -name 'b' -value 'git checkout -b'


function commitWithMessage {
  Write-Host "`nInitiating git commit -m `n`tMessage-length  $global:FIFTY_CHARS `n`tCommit message: " -NoNewline
  
  try { 
    [console]::ForegroundColor = 'DarkCyan'
    $commitMessage = Read-Host 
  }
  finally { [console]::ResetColor() }
  
  Write-Host "`tTrying: git commit -m " -NoNewline
  Write-Host -ForegroundColor DarkCyan "'$commitMessage'`n"
  
  git commit -m $commitMessage
}
Set-Alias c commitWithMessage
addToList -name 'c' -value 'git commit -m'


function co { git checkout $args }
addToList -name 'co' -value 'git checkout args'


function d { git checkout develop }
addToList -name 'd' -value 'git checkout develop'


Set-Alias g git
addToList -name 'g' -value 'git'


function getCurrentGitBranch { git rev-parse --abbrev-ref HEAD }
Set-Alias gb getCurrentGitBranch
addToList -name 'gb' -value 'Get current git branch'


function getMasterBranch { git config --get init.defaultBranch }
Set-Alias gb getCurrentGitBranch
addToList -name 'gmb' -value 'Get git master branch'


function gd { 
  $currentGitBranch = getCurrentGitBranch
  $title = "$(_see_String m) `n`tgit branch -d $currentGitBranch `n`tgit push origin --delete $currentGitBranch"
  $question = 'Are you sure you want to proceed?'
  $choices = '&Yes', '&No'
  
  Write-Host "`nTrying to run the following commands:" -NoNewline
  $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
  
  If ($decision -eq 0) {
    Write-Host 'Confirmed'
    m
    git branch -d $currentGitBranch
    git push origin --delete $currentGitBranch
  }
  Else { Write-Host 'Cancelled' }
}
addToList -name 'gd' -value 'Delete current branch (local&remote)'


function gme { git merge $args }
addToList -name 'gme' -value 'git merge args'


function gmm { git merge master }
addToList -name 'gmm' -value 'git merge master'


function gpl { git pull }
addToList -name 'gpl' -value 'git pull'


function gppl { 
  git gc --prune=now
  git pull 
}
addToList -name 'gppl' -value 'git gc --prune=now && git pull'


function gr { git reset --hard }
addToList -name 'gr' -value 'git reset --hard'


function grb { 
  Write-Host "`nInitiating a renaming of current branch. Enter the new branch name `n`tName-length  $global:FIFTY_CHARS `n`tBranch-name: " -NoNewline
  try { 
    [console]::ForegroundColor = 'DarkCyan'
    $newBranchName = Read-Host 
  }
  finally { [console]::ResetColor() }
  
  $oldBranchName = getCurrentGitBranch
  
  # Rename local branch.
  git branch -m $newBranchName
  
  # Delete the old-name remote branch and push the new-name local branch.
  git push origin :$oldBranchName $newBranchName
  
  # Reset the upstream branch for the new-name local branch.
  git push origin -u $newBranchName
}
addToList -name 'grb' -value 'Rename git branch'


function checkoutMasterBranch { 
  $masterBranch = getMasterBranch
  git checkout $masterBranch 
}
Set-Alias m checkoutMasterBranch
addToList -name 'm' -value 'git checkout master'


function openGitBranchInBrowser {
  param( 
    [string]$repo = $(getRepo),
    [string]$currentGitBranch = $(getCurrentGitBranch)
  )
  Start-Process $global:MY_BROWSER -ArgumentList $(_openGitBranchInBrowser_string -repo $repo -branch $currentGitBranch)
}
Set-Alias ob openGitBranchInBrowser
addToList -name 'ob' -value 'Open git-branch in browser'


function _openGitBranchInBrowser_string {
  param( 
    [Parameter(Mandatory)][string]$repo,
    [Parameter(Mandatory)][string]$branch
  )
  If ($global:GIT_BRANCH_URL.Contains("{1}")) { Return $global:GIT_BRANCH_URL -f $repo, $branch }
  Else { Return $global:GIT_BRANCH_URL -f $repo }
}


function p { git push }
addToList -name 'p' -value 'git push'


function po { 
  p
  openGitBranchInBrowser
}
addToList -name 'po' -value 'git push && Open BitBucket-git branch'


function pu { 
  $currentGitBranch = getCurrentGitBranch
  $title = "`tgit push --set-upstream origin $currentGitBranch"
  $question = 'Are you sure you want to proceed?'
  $choices = '&Yes', '&No'
  
  Write-Host "`nTrying to run the following command:" -NoNewline
  $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
  
  If ($decision -eq 0) {
    Write-Host 'Confirmed'
    git push --set-upstream origin $currentGitBranch
  }
  Else { Write-Host 'Cancelled' }
}
addToList -name 'pu' -value 'git push --set-upstream origin'


function prune { git gc --prune=now }
addToList -name 'prune' -value 'git gc --prune=now'


function quickCommitAll { 
  git add .
  git commit -m "Various small changes"
}
Set-Alias qca quickCommitAll
addToList -name 'qca' -value 'Quick-Commit all'


function s { git status }
addToList -name 's' -value 'git status'





function _pullAllRepos {
  $root = getPath
  $directories = (Get-ChildItem -Directory).name
  
  If ( $directories.Count -eq 0 ) { Return }

  $needsManualWork = new-object -TypeName System.Text.StringBuilder

  Foreach ($dir in $directories) {
    Set-Location $root\$dir

    $gitStatus = Get-GitStatus
    
    # If not a git-repo, recursively check sub-directiroes, then return jump to next
    If ( $null -eq $gitStatus ) { 
      $subDirs = _pullAllRepos
      If ( $subDirs.Length -gt 0 ) { $needsManualWork.AppendFormat( "{0}", $subDirs ) > $null }
      Continue 
    }


    $currentGitBranch = getCurrentGitBranch
    $masterGitBranch = getMasterBranch
  
    # If working tree is clean
    If ((Get-GitStatus).Working.length -eq 0 -and (Get-GitStatus).Index.length -eq 0) {
      
      #If ($currentGitBranch -ne $masterGitBranch) { checkoutMasterBranch }
      #gpl
    }
    Else { $needsManualWork.AppendFormat( "  {0}`n", $(getPath) ) > $null }
  }

  Return $needsManualWork.ToString()
}


function pullAllRepos {
  Set-Location $global:DEFAULT_START_PATH
  $needsManualWork = _pullAllRepos

  OUT "`nThe following repos need to be pulled manually:`n$needsManualWork", $RGBs.Red
}