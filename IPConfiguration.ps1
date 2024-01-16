$DNSServers = @("10.0.0.4")
$NICAlias = "Wi-Fi"
$IPConfig = Get-NetIPAddress -InterfaceAlias $NICAlias -AddressFamily IPv4 | Select-Object IPAddress,PrefixLength
$DefaultGateway = (Get-NetIPConfiguration -InterfaceAlias Wi-Fi).IPv4DefaultGateway.NextHop
$IPAddress = New-NetIPAddress -InterfaceAlias $NICAlias -IPAddress $IPConfig.IPAddress -AddressFamily IPv4 -DefaultGateway $DefaultGateway
Set-NetIPAddress -InterfaceAlias $NICAlias -IPAddress $IPAddress -PrefixLength $IPConfig.PrefixLength -PrefixOrigin Manual
Set-DnsClientServerAddress -InterfaceAlias $NICAlias -Addresses $DNSServers