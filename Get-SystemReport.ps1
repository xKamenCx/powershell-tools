function Get-SystemReport {
    $os = Get-CimInstance Win32_OperatingSystem
    $cpu = Get-CimInstance Win32_Processor
    $ram = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
    $freeRam = [math]::Round($os.FreePhysicalMemory / 1MB, 2)

    [PSCustomObject]@{
        ComputerName  = $env:COMPUTERNAME
        OS            = $os.Caption
        LastBoot      = $os.LastBootUpTime
        CPU           = $cpu.Name
        TotalRAM_GB   = $ram
        FreeRAM_GB    = $freeRam
        CurrentUser   = $env:USERNAME
    }
}

Get-SystemReport | Format-List