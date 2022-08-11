<#
Collects all users with F3, E3, Archive, and F3 + Archive and outputs the totals.
#>


Connect-MsolService


Write-host "Collecting user license data please stand by..." -ForegroundColor Green

$F3_Only = Get-MsolUser -ALL | Where-Object {($_.licenses).AccountSkuId -match "domain:DESKLESSPACK"}

        Write-host "F3 licenses counted..." -ForegroundColor Yellow

$E3_Only = Get-MsolUser -ALL | Where-Object {($_.licenses).AccountSkuId -match "domain:ENTERPRISE"}

        Write-host "E3 licenses counted..." -ForegroundColor Yellow

$F3_And_Arch = Get-MsolUser -ALL | Where-Object {($_.licenses).AccountSkuId -match "domain:DESKLESSPACK" -and "parrishmed:EXCHANGEARCHIVE_ADDON" }

        Write-host "F3 + Archive licenses counted..." -ForegroundColor Yellow

$Arch_Only = Get-MsolUser -ALL | Where-Object {($_.licenses).AccountSkuId -match "domain:EXCHANGEARCHIVE_ADDON" }

        Write-host "Archive licenses counted..." -ForegroundColor Yellow


Write-host "There are" $F3_Only.count "users with F3 licenses" 

Write-host "There are" $E3_Only.count "users with E3 licenses" 

Write-host "There are" $Arch_Only.count "users with Archive license" 

Write-host "There are" $F3_And_Arch.count "users with both F3 and Archive licenses"