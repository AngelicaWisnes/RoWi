

# CHANGE THE FOLLOWING ARRAY:
$SYSTEM_PROJECTS = @( 
  [PROJECT]@{
    type           = [ProjectType]::STANDARD
    name           = 'RoWi - Personal PowerShell-tool'
    repo           = 'RoWi'
    branch         = 'main'
    useDotNetIde   = 0
    webs           = ''
    stdSctript     = $true
    customScript   = $null
    nestedProjects = @()
  };
  
  [PROJECT]@{
    type           = [ProjectType]::STANDARD
    name           = 'Laudio'
    repo           = 'Laudio'
    branch         = 'BYPASS'
    useDotNetIde   = 0
    webs           = 'https://dev.azure.com/rogerwisnes/Laudio'
    stdSctript     = $true
    customScript   = $null
    nestedProjects = @()
  };
)

If ($SYSTEM_PROJECTS.Count -gt 0) { $SYSTEM_PROJECTS = @( $allProjects; ) + $SYSTEM_PROJECTS }
