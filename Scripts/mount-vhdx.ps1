Param
(
    [Parameter(Mandatory = $true)]
    [string]
    $vhdxPath,
        
    [Parameter(Mandatory = $true)]
    [string]
    $mountPath
)
$ErrorActionPreference = "Stop"


$vhd = Mount-VHD -NoDriveLetter -Path $vhdChildPath -PassThru
$part = $vhd | Get-Disk | Get-Partition | Where-Object { ($_ | Get-Volume) -ne $Null } 
$part | Add-PartitionAccessPath -AccessPath $mountPath