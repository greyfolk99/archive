Write-Host "#----------------------------------------#"
Write-Host "#                                        #"
Write-Host "#       Run docker nginx container       #"
Write-Host "#                                        #"
Write-Host "#----------------------------------------#"

$nginx_path = "."
# change path to absolute
$nginx_path = (Get-Item -Path $nginx_path).FullName
$sites_available_path = "$nginx_path\sites-available"
$sites_enabled_path = "$nginx_path\sites-enabled"
$ssl_path = "$nginx_path\ssl"
$logs_path = "$nginx_path\logs"
$html_path = "$nginx_path\html"

Write-Host "Nginx path: $nginx_path, continue? [y/n]"
$continue = Read-Host
if ($continue -ne "y") {
    Write-Host "Aborted"po
    exit 1
}

Set-Location $nginx_path
New-Item -ItemType Directory -Path "sites-available" -Force
New-Item -ItemType Directory -Path "sites-enabled" -Force
New-Item -ItemType Directory -Path "ssl" -Force
New-Item -ItemType Directory -Path "logs" -Force
New-Item -ItemType Directory -Path "html" -Force

docker run -dit `
    --name nginx `
    -p 80:80 `
    -p 443:443 `
    -v "$nginx_path\sites-available:/etc/nginx/sites-available" `
    -v "$nginx_path\sites-enabled:/etc/nginx/sites-enabled" `
    -v "$nginx_path\ssl:/etc/nginx/ssl" `
    -v "$nginx_path\logs:/var/log/nginx" `
    -v "$nginx_path\html:/usr/share/nginx/html" `
    nginx:latest
