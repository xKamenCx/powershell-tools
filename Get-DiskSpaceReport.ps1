param (
    [string]$ComputerName = $env:COMPUTERNAME,
    [int]$WarningThreshold = 20,
    [string]$ExportPath = "$env:USERPROFILE\Desktop\DiskSpaceReport.csv" 
)

try {
    $disks = Get-CimInstance -ClassName Win32_LogicalDisk `
            -Filter "DriveType=3" `
            -ErrorAction Stop

$results = foreach ($disk in $disks) {
    $totalGB = [math]::Round($disk.Size / 1GB, 2)
    $freeGB = [math]::Round($disk.FreeSpace / 1GB, 2)
    $percentFree = [math]::Round(($freeGB / $totalGB) * 100, 1)
    $status = if ($percentFree -le $WarningThreshold) { "WARNING"} else { "OK" }

    [PSCustomObject]@{
        ComputerName = $ComputerName
        Drive        = $disk.DeviceID
        TotalGB      = $totalGB
        FreeGB       = $freeGB
        PercentFree  = $percentFree
        Status       = $status
        DataChecked  = (Get-Date -Format "dd/MM/yyyy HH:mm")
    }
}
$results | Export-Csv -Path $ExportPath -NoTypeInformation
    Write-Host "Report saved to: $ExportPath" -ForegroundColor Green
    $results | Format-Table -AutoSize
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}