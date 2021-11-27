[CmdletBinding()]
param (
)

Set-Location $psscriptroot

$ErrorActionPreference = "STOP"
# Get-Item $setup

# Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=866662" -OutFile $setup -UseBasicParsing
# $process = Start-Process -Wait -FilePath $setup -ArgumentList @("/Quiet", "/Action=Download", "/Language=en-US", "/MediaType=CAB", "/MediaPath=$psscriptroot") -PassThru

#   Write-Host $process.ExitCode

docker build --memory 4g -t odesacr.azurecr.io/sqldev .

az acr login --name odesacr
docker push odesacr.azurecr.io/sqldev