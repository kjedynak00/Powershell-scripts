
# Version 1.0 Created script to get uptime time of machine and check how much free space was left on the C drive

$list = Get-Content -Path "C:\Users\USERNAME\Desktop\testing-list.txt"
$cred = Get-Credential -Message "Please provide admin credentials"

$Total = $list.Count
$i = 0
Write-Progress -Id 1 -Activity "Checking uptime & C drive" -Status "Starting..." -PercentComplete 0
foreach ($Computer in $list) {
    $i++
    $Percent = [math]::Round(($i / $Total) * 100)
    Write-Progress -Id 1 -Activity "Checking uptime & C drive" -Status "$i/$Total - $Computer" -PercentComplete $Percent
    Write-Host "Processing $Computer" -ForegroundColor Yellow

    try {
        $session = New-PSSession -ComputerName $Computer -Credential $cred -ErrorAction Stop
        #Uptime check
        Write-Host "[$Computer] Uptime:" -ForegroundColor Cyan -NoNewline
        $uptime = Invoke-Command -Session $session -ScriptBlock {
            $boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
            $now = Get-Date
            $ts = $now - $boot
            "{0} days, {1} H, {2} min" -f $ts.Days, $ts.Hours, $ts.Minutes
        }
        Write-Host "[$Computer] Uptime: $uptime"
    }
    catch {
        Write-Warning "$Computer Error: $($_.Exception.Message)"
    }
    finally {
        if ($session) {
            Remove-PSSession $session -ErrorAction SilentlyContinue
        }
    }
}

Write-Progress -Id 1 -Activity "Checking uptime & C drive" -Completed
Write-Host "Uptime and C drive space checked"
