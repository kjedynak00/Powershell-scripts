
# Version 1.0 Created script to get uptime time of machine and check how much free space was left on the C drive
# Version 1.1 Added C drive free space check with low space warning, fixed duplicated uptime output and stale session reuse

$list = Get-Content -Path "C:\Users\USERNAME\Desktop\testing-list.txt"
$cred = Get-Credential -Message "Please provide admin credentials"
$MinFreePercent = 15   # warn when C: has less free space than this

$Total = $list.Count
$i = 0
Write-Progress -Id 1 -Activity "Checking uptime & C drive" -Status "Starting..." -PercentComplete 0
foreach ($Computer in $list) {
    $i++
    $Percent = [math]::Round(($i / $Total) * 100)
    Write-Progress -Id 1 -Activity "Checking uptime & C drive" -Status "$i/$Total - $Computer" -PercentComplete $Percent
    Write-Host "Processing $Computer" -ForegroundColor Yellow
    $session = $null

    try {
        $session = New-PSSession -ComputerName $Computer -Credential $cred -ErrorAction Stop
        #Uptime check
        Write-Host "[$Computer] Uptime: " -ForegroundColor Cyan -NoNewline
        $uptime = Invoke-Command -Session $session -ScriptBlock {
            $boot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
            $now = Get-Date
            $ts = $now - $boot
            "{0} days, {1} H, {2} min" -f $ts.Days, $ts.Hours, $ts.Minutes
        }
        Write-Host $uptime

        #C drive check
        $disk = Invoke-Command -Session $session -ScriptBlock {
            Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace
        }
        $sizeGB = [math]::Round($disk.Size / 1GB, 1)
        $freeGB = [math]::Round($disk.FreeSpace / 1GB, 1)
        $freePercent = [math]::Round(($disk.FreeSpace / $disk.Size) * 100)
        $color = if ($freePercent -lt $MinFreePercent) { "Red" } else { "Green" }
        Write-Host "[$Computer] C: drive: " -ForegroundColor Cyan -NoNewline
        Write-Host "$freeGB GB free of $sizeGB GB ($freePercent%)" -ForegroundColor $color
        if ($freePercent -lt $MinFreePercent) {
            Write-Warning "$Computer C: drive is low on space ($freePercent% free)"
        }
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
