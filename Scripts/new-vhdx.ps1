Param
(
    [Parameter(Mandatory = $true)]
    [string]
    $vhdxPath,

    [int64]
    $vhdxSize = 128GB
)
$ErrorActionPreference = "Stop"


$vhd = New-VHD -Path $vhdxpath -Dynamic -SizeBytes $vhdxsize | Mount-VHD -Passthru
$vhd | Initialize-Disk -Passthru | New-Partition -UseMaximumSize | Format-Volume -FileSystem NTFS -Confirm:$false -Force
