$InputFile = 'C:\Temp\MachineList.txt'
$machines = Get-Content $InputFile

foreach ($machine in $machines) {
    $pingResult = Test-Connection -ComputerName $machine -Count 1 -ErrorAction SilentlyContinue

    if ($pingResult) {
        $ipAddress = $pingResult.IPV4Address.IPAddressToString
        Write-Host "$machine, up ($ipAddress)" -ForegroundColor Green
    }
    else {
        Write-Host "$machine, down" -ForegroundColor Red
    }
}