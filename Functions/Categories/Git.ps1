
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


function GitAddAllOrArg { 
  If ($args.Length -eq 0) { git add . }
  Else { git add $args }
  Get-GitStatusStandard
}
Set-Alias a GitAddAllOrArg
addToList -name 'a' -value 'git add args'


function GitCreateNewBranch {
  OUT "Initiating git checkout -b `n`tName-length  $global:FIFTY_CHARS `n`tBranch-name: " -NoNewline
  
  try { 
    [console]::ForegroundColor = 'DarkCyan'
    $branchName = Read-Host 
  }
  finally { [console]::ResetColor() }
  
  OUT "Trying: git checkout -b ", "'$branchName'`n", $global:colors.DarkCyan
  
  git checkout -b $branchName
}
Set-Alias b GitCreateNewBranch
addToList -name 'b' -value 'git checkout -b'


function GitCommit { git commit }
Set-Alias c GitCommit
addToList -name 'c' -value 'git commit'


function GitCommitWithMessage {
  OUT "Initiating git commit -m `n`tMessage-length  $global:FIFTY_CHARS `n`tCommit message: " -NoNewline
  
  try { 
    [console]::ForegroundColor = 'DarkCyan'
    $commitMessage = Read-Host 
  }
  finally { [console]::ResetColor() }
  
  OUT "Trying: git commit -m ", "'$commitMessage'`n", $global:colors.DarkCyan
  
  git commit -m $commitMessage
}
Set-Alias cm GitCommitWithMessage
addToList -name 'cm' -value 'git commit -m'


function GitCheckout { git checkout $args }
Set-Alias co GitCheckout
addToList -name 'co' -value 'git checkout args'


function GitCheckoutDevelop { git checkout develop }
Set-Alias d GitCheckoutDevelop
addToList -name 'd' -value 'git checkout develop'


Set-Alias g git
addToList -name 'g' -value 'git'


function Get-CurrentGitBranch { git rev-parse --abbrev-ref HEAD }
Set-Alias gb Get-CurrentGitBranch
addToList -name 'gb' -value 'Get current git branch'


function Get-MasterBranch { basename $(git symbolic-ref --short refs/remotes/origin/HEAD) }
Set-Alias gmb Get-MasterBranch
addToList -name 'gmb' -value 'Get git master branch'


function GitCombinePreviousCommits {
  OUT "Initiating 'git reset --soft <hash>' to combine all commits done after given hash
  `tPlease provide the commit-hash belonging to the last commit
  `tdone BEFORE the first commit you want to include in this process, according to git log
  `tCommit-Hash: " -NoNewline
  
  try { 
    [console]::ForegroundColor = 'DarkCyan'
    $commitHash = Read-Host 
  }
  finally { [console]::ResetColor() }
  
  OUT "Trying: git reset --soft ", "'$commitHash'`n", $global:colors.DarkCyan
  
  git reset --soft $commitHash

  OUT "Next steps in the process: `n`t- Create the new commit(s) `n`t- Use the command GitPushForce (alias pf)"
}
Set-Alias gcpc GitCombinePreviousCommits
addToList -name 'gcpc' -value 'Combine previous commits'


function GitDeleteCurrentBranch { 
  $currentGitBranch = Get-CurrentGitBranch
  $title = "$(Get-FunctionDefinitionAsString GitCheckoutMaster)  git branch -d $currentGitBranch `n  git push origin --delete $currentGitBranch"
  $question = 'Are you sure you want to proceed?'
  $choices = '&Yes', '&No'
  
  OUT "Trying to run the following commands:" -NoNewline
  $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
  
  If ($decision -eq 0) {
    OUT "Confirmed"
    GitCheckoutMaster
    git branch -d $currentGitBranch
    git push origin --delete $currentGitBranch
  }
  Else { OUT "Cancelled" }
}
Set-Alias gd GitDeleteCurrentBranch
addToList -name 'gd' -value 'Delete current branch (local&remote)'


function GitMergeArgs { git merge $args }
Set-Alias gme GitMergeArgs
addToList -name 'gme' -value 'git merge args'


function GitMergeMaster { 
  $masterBranch = Get-MasterBranch
  git merge $masterBranch 
}
Set-Alias gmm GitMergeMaster
addToList -name 'gmm' -value 'git merge master'


function GitPull { git pull }
Set-Alias gpl GitPull
addToList -name 'gpl' -value 'git pull'


function GitPruneAndPull { 
  GitPrune
  GitPull
}
Set-Alias gppl GitPruneAndPull
addToList -name 'gppl' -value 'git gc --prune=now && git pull'


function GitHardReset { git reset --hard }
Set-Alias gr GitHardReset
addToList -name 'gr' -value 'git reset --hard'


function GitRenameBranch { 
  OUT "Initiating a renaming of current branch. Enter the new branch name `n`tName-length  $global:FIFTY_CHARS `n`tBranch-name: " -NoNewline
  try { 
    [console]::ForegroundColor = 'DarkCyan'
    $newBranchName = Read-Host 
  }
  finally { [console]::ResetColor() }
  
  $oldBranchName = Get-CurrentGitBranch
  
  # Rename local branch.
  git branch -m $newBranchName
  
  # Delete the old-name remote branch and push the new-name local branch.
  git push origin :$oldBranchName $newBranchName
  
  # Reset the upstream branch for the new-name local branch.
  git push origin -u $newBranchName
}
Set-Alias grb GitRenameBranch
addToList -name 'grb' -value 'Rename git branch'


function GitCheckoutMaster { 
  $masterBranch = Get-MasterBranch
  git checkout $masterBranch 
}
Set-Alias m GitCheckoutMaster
addToList -name 'm' -value 'git checkout master/main'


function GitOpenBranchInBrowser {
  param( 
    [string]$repo = $(Get-CurrentRepo),
    [string]$currentGitBranch = $(Get-CurrentGitBranch)
  )
  Start-Process $global:MY_BROWSER -ArgumentList $(Get-GitBranchUrl -repo $repo -branch $currentGitBranch)
}
Set-Alias ob GitOpenBranchInBrowser
addToList -name 'ob' -value 'Open git-branch in browser'


function Get-GitBranchUrl {
  param( 
    [Parameter(Mandatory)][string]$repo,
    [Parameter(Mandatory)][string]$branch
  )
  If ($global:GIT_BRANCH_URL.Contains("{1}")) { Return $global:GIT_BRANCH_URL -f $repo, $branch }
  Else { Return $global:GIT_BRANCH_URL -f $repo }
}
Set-Alias gbu Get-GitBranchUrl
addToList -name 'gbu' -value 'Get url for current git-branch'


function GitPush { git push }
Set-Alias p GitPush
addToList -name 'p' -value 'git push'


function GitPushForce { git push --force-with-lease }
Set-Alias pf GitPush
addToList -name 'pf' -value 'git push --force-with-lease'


function GitPushAndOpenBranchInBrowser { 
  GitPush
  GitOpenBranchInBrowser
}
Set-Alias po GitPushAndOpenBranchInBrowser
addToList -name 'po' -value 'git push && Open git-branch i browser'


function GitSetUpstreamAndPush { 
  $currentGitBranch = Get-CurrentGitBranch
  $title = "`tgit push --set-upstream origin $currentGitBranch"
  $question = 'Are you sure you want to proceed?'
  $choices = '&Yes', '&No'
  
  OUT "Trying to run the following command:" -NoNewline
  $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
  
  If ($decision -eq 0) {
    OUT "Confirmed"
    git push --set-upstream origin $currentGitBranch
  }
  Else { OUT "Cancelled" }
}
Set-Alias pu GitSetUpstreamAndPush
addToList -name 'pu' -value 'git push --set-upstream origin'


function GitPrune { git gc --prune=now }
Set-Alias gpr GitPrune
addToList -name 'gpr' -value 'git gc --prune=now'


function GitQuickCommitAll { 
  git add .
  git commit -m "Various small changes"
}
Set-Alias qca GitQuickCommitAll
addToList -name 'qca' -value 'Quick-Commit all'


function Get-GitStatusStandard { git status }
Set-Alias s Get-GitStatusStandard
addToList -name 's' -value 'git status'




# TODO: Check if this function is completed - If not: Complete it
function _pullAllRepos {
  $root = Get-FullPath
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

    # TODO: This function is not finished

    #$currentGitBranch = Get-CurrentGitBranch
    #$masterGitBranch = Get-MasterBranch
  
    # If working tree is clean
    If ((Get-GitStatus).Working.length -eq 0 -and (Get-GitStatus).Index.length -eq 0) {
      
      #If ($currentGitBranch -ne $masterGitBranch) { GitCheckoutMaster }
      #GitPull
    }
    Else { $needsManualWork.AppendFormat( "  {0}`n", $(Get-FullPath) ) > $null }
  }

  Return $needsManualWork.ToString()
}

# TODO: Check if this function is completed - If not: Complete it
function pullAllRepos {
  Set-Location $global:DEFAULT_START_PATH
  $needsManualWork = _pullAllRepos
  Set-Location $global:DEFAULT_START_PATH
  
  OUT "The following repos need to be pulled manually:`n$needsManualWork", $colors.Red
}