Param()
$ErrorActionPreference = "Stop"


function Get-CommandExistence($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}


$commands = "New-VHD", "Mount-VHD", "Get-VHD", "Dismount-VHD", "Get-Disk", "Get-Partition", "Get-Volume", "Add-PartitionAccessPath", "Remove-PartitionAccessPath", "Initialize-Disk", "New-Partition", "Format-Volume"
foreach ($command in $commands) {
    $exist = Get-CommandExistence($command)
    if (-Not $exist) {
        return $false
    }
}
return $true