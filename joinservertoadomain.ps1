<#param(

[parameter(Mandatory=$true)]
[string]$UserName,

[parameter(Mandatory=$true)]
[securestring]$Password

)

$Credential = [PSCredential]::new($Username, $Password)
Add-Computer -Domain testground.eu -Credential $Credential
#>

Start-Transcript -Path c:\transcript.txt
New-Item -Path c:\test.txt

$UserName = "Student"
$Password = "PublicPassword123@!"
$Credential = [PSCredential]::new($UserName, $(ConvertTo-SecureString -String $Password -AsPlainText -Force))
Add-Computer -Domain testground.eu -Credential $Credential

Stop-Transcript