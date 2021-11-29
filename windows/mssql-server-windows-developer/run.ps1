# Import System.Web assembly
Add-Type -AssemblyName System.Web
# Generate random password
$password = [System.Web.Security.Membership]::GeneratePassword(8,2)
Write-Host "Password : $password"
docker run --rm -d -it -e ACCEPT_EULA=Y -e sa_password="$password" -p 1433:1433 odesacr.azurecr.io/sqldev:latest