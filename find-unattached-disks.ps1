<#
.SYNOPSIS
    Orphaned Unattached Managed Disks & Public IP Finder
#>
Connect-AzAccount -Identity
$disks = Get-AzDisk | Where-Object { $_.ManagedBy -eq $null }
Write-Output "Found $($disks.Count) unattached managed disks consuming cost:"
$disks | Select-Object Name, ResourceGroupName, DiskSizeGB, Tier | Format-Table -AutoSize
