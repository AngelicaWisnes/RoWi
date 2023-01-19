
#############################
# Jupyter-related functions #
#############################
$global:FunctionSubList_JUPYTER = new-object System.Collections.Generic.List[FunctionListElement]
$global:FunctionSubList_JUPYTER.Add( $FunctionSubList_BREAK )
function addToList {
  param(
    [Parameter(Mandatory)][String]$name,
    [Parameter(Mandatory)][String]$value
  )
  $global:FunctionSubList_JUPYTER.Add(( [FunctionListElement]@{ category = "Jupyter"; name = $name; value = $value }))
}

function Open-JupyterNotebook { jupyter notebook }
Set-Alias jn Open-JupyterNotebook
addToList -name 'jn' -value 'Open_Jupyter_Notebook'


function Get-JupyterOutputSizeCode {
  Set-Clipboard -Value "# Utility code to extend the height of output-cells
  from IPython.core.display import display, HTML    
  # To change size of output-cell:         Change height here, Change width here
  display(HTML('<style>div.output_scroll {    height: 80em;       width: 80em;   }</style>'))" 
}
Set-Alias jns Get-JupyterOutputSizeCode
addToList -name 'jns' -value 'Get jupiter output-size-code'

