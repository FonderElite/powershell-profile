[cmdletbinding()]
Param (
[string]$ps1
)
Import-Module oh-my-posh
#Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
#  Import-Module "$ChocolateyProfile"
}

#Display Date
$(date) 

neofetch

#Banner
#screenfetch -d Windows

#Ohmyposh
oh-my-posh --init --shell pwsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/v$(oh-my-posh --version)/themes/jandedobbeleer.omp.json | Invoke-Expression

$themes = @("bubbles","bubblesextra","cert","clean-detailed","craver","iterm2","jonnychipz","jv_sitecorian","microverse-power","montys","negligible","neko","night-owl","nordtron","pararussel","patriksvensson","pixelrobots","slim","sonicboom_dark","the-unnamed","tokyo","uew","unicorn","velvet")
$themeLength = $themes.length
$randomNum = Get-Random -Minimum 1 -Maximum $themeLength

function Set-OmpTheme{
	[cmdletbinding()]
Param (
    [Parameter(Mandatory=$false,ValueFromPipeline=$false)] 
        [string]$Theme
	    ) 
Process{
Set-PoshPrompt -Theme $Theme 
}
  }
if(!$ps1){
Set-PoshPrompt -Theme $themes[$randomNum] 
}else{
Set-OmpTheme -Theme $ps1
}

