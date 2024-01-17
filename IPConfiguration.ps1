$DNSServers = @("10.0.0.4")
$NetIPAddress = Get-NetIPAddress -AddressFamily IPv4 -PrefixOrigin Dhcp
$NIAlias = $NetIPAddress.InterfaceAlias
$DefaultGateway = (Get-NetIPConfiguration -InterfaceAlias $NIAlias).IPv4DefaultGateway.NextHop
Remove-NetIPAddress -InterfaceAlias $NIAlias -AddressFamily IPv4 -DefaultGateway $DefaultGateway
New-NetIPAddress -InterfaceAlias $NIAlias -IPAddress $($NetIPAddress.IPAddress) -AddressFamily IPv4 -DefaultGateway $DefaultGateway -PrefixLength $($NetIPAddress.PrefixLength)
#Set-NetIPAddress -InterfaceAlias $NIAlias -IPAddress $NetIPAddress.IPAddress -PrefixLength $($NetIPAddress.PrefixLength) -PrefixOrigin Manual
Set-DnsClientServerAddress -InterfaceAlias $NIAlias -Addresses $DNSServers