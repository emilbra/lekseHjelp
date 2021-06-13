#Dette powershell-scriptet er for å sjekke Oppgave 1.

##Variabel-deklarasjon

#henter ut hostname
$HostName=HOSTNAME.EXE
$CorrectHostName="Hyper"
$InterfaceToCheck= "Ethernet"
$CorrectIPAddress= "192.168.0.120"
$HostIpAddress= (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias $InterfaceToCheck).IPAddress
$RequiredFeature= Get-WindowsOptionalFeature -Online | Where-Object {$_. FeatureName -eq "MediaPlayback"}
$RequiredFeatureName= $RequiredFeature.FeatureName
$VMSwitches= Get-VMSwitch
$VMs= Get-VM

# Denne if-løkken sjekker om makinnavnet stemmer overrens med det riktige maskinnavnet, som beskrevet i oppgaven
if ($HostName -eq $CorrectHostName) {
    Write-Output "Maskinavnet er $HostName, som er riktig" 
} else {
    Write-Output "Maskinavnet er $HostName, som IKKE er riktig. Det riktige er $CorrectHostName"     
}

if ($HostIpAddress -eq $CorrectIPAddress) {
    Write-Output "Ip-adressen er $HostIPAddress, noe som stemmer overrens med oppgaven"
} else {
    Write-Output "Ip-adressen er $HostIPAddress, noe ikke som stemmer overrens med oppgaven. Det riktige er $CorrectIPAddress"    
}

# Dette er for en windows 10 klient, så må endres og testes for Server 2019

if ($RequiredFeature.State -eq "enabled") {
    Write-Output "$RequiredFeatureName er aktivert!"
} else {
    Write-Output "$RequiredFeatureName er skrudd av!"    
}