<#
.SYNOPSIS
    Automated Azure Non-Production VM Scheduler & Cost Governance Runbook
#>
param(
    [string]$ResourceGroupName = "rg-nonprod-workloads",
    [string]$Action = "Stop" # Stop or Start
)

Connect-AzAccount -Identity
$vms = Get-AzVM -ResourceGroupName $ResourceGroupName

foreach ($vm in $vms) {
    if ($Action -eq "Stop") {
        Write-Output "Stopping VM: $($vm.Name)"
        Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $vm.Name -Force
    } else {
        Write-Output "Starting VM: $($vm.Name)"
        Start-AzVM -ResourceGroupName $ResourceGroupName -Name $vm.Name
    }
}
