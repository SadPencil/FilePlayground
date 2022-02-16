Param
(
    [Parameter(Mandatory = $true)]
    [string]
    $vhdxPath,
        
    [Parameter(Mandatory = $true)]
    [string]
    $parentVhdxPath
)
$ErrorActionPreference = "Stop"


New-VHD -Differencing -Path $vhdxPath -ParentPath $parentVhdxPath