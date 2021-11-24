Set-Location $psscriptroot

$setup = Join-Path $env:TEMP "sqlsetup.exe"

Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=866662" -OutFile $setup -UseBasicParsing

# Get-Item $setup

$process = Start-Process -Wait -FilePath $setup -ArgumentList @("/Quiet", "/Action=Download", "/Language=en-US", "/MediaType=CAB", "/MediaPath=$psscriptroot") -PassThru

Write-Host $process.ExitCode

docker build --memory 4g -t sqldev .