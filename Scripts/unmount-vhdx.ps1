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


$vhd = Get-VHD -Path $vhdxPath
$part = $vhd | Get-Disk | Get-Partition | Where-Object { ($_ | Get-Volume) -ne $Null } 
$part | Remove-PartitionAccessPath -AccessPath $mountPath
$vhd | Dismount-VHD