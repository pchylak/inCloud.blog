In case of preparing environment I'll use chocolatey as package provider for Windows 10/11. After installation we need to restart Powershell Console or Terminal.

``` Powershell
 Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) 
```

Second step is installation of Visual Studio Code and extensions to Bicep, Terraform, Powershell

``` Powershell
choco install vscode -y

code --install-extension ms-azuretools.vscode-bicep; 
code --install-extension ms-azuretools.vscode-azureterraform 
code --install-extension ms-vscode.azure-account 
code --install-extension ms-vscode.powershell 
code --install-extension redhat.vscode-yaml
code --install-extension ms-azuretools.vscode-docker 
```

Next step is installing packages that we need is Azure Cli to operate with our Cloud Environments and Docker to manage images, containers, etc.

``` Powershell
choco install azure-cli -y
choco install docker-desktop -y
```
