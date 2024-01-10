<#param(

[parameter(Mandatory=$true)]
[string]$UserName,

[parameter(Mandatory=$true)]
[securestring]$Password

)#>

$Credential = [PSCredential]::new($Username, $Password)
Add-Computer -Domain testground.eu -Credential $Credential

$UserName = "Student"
$Password = "PublicPassword123@!"
$Credential = [PSCredential]::new($UserName, $(ConvertTo-SecureString -String $Password -AsPlainText -Force))
Add-Computer -Domain testground.eu -Credential $Credential