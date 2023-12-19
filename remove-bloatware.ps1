
$blacklist = @(
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.XboxGameOverlay",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.BingNews",
    "Microsoft.BingWeather",
    "Microsoft.People",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "MicrosoftCorporationII.QuickAssist",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsAlarms",
    "Microsoft.MicrosoftSolitaireCollection",
    "WindowsFeedbackHub",
    "Microsoft.MicrosoftOfficeHub",
    "Clipchamp.Clipchamp",
    "Microsoft.PowerAutomateDesktop",
    "Microsoft.OutlookForWindows",
    "Microsoft.YourPhone",
    "MicrosoftTeams",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.Todos",
    "Microsoft.GamingApp",
    "microsoft.windowscommunicationsapps",
    "Microsoft.SkypeApp",
    "SpotifyAB.SpotifyMusic",
    "Microsoft.Office.OneNote",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.XboxApp",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.OneDriveSync",
)

Set-Location -Path $PSScriptRoot

# Check if the current user has administrative privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')
if (-not $isAdmin) {
    Write-Host "Please run this script as an administrator."
    exit
}

# Removes a Windows 10 bloatware app
function Remove-Bloatware {
    param (
        [Parameter(Mandatory = $true)]
        [String]$Name
    )
    
    try {
        $package = Get-AppxPackage -AllUsers -Name "*$Name*" -ErrorAction Stop
        if ($package) {
            $package | Remove-AppxPackage -AllUsers -ErrorAction Stop
            Write-Host "Successfully uninstalled: $Name"
        }
        else {
            Write-Host "Package '$Name' not found."
        }
    }
    catch {
        Write-Host "Failed to uninstall '$Name'. Error: $($_.Exception.Message)"
    }
}

foreach ($app in $blacklist) {
    Remove-Bloatware -Name $app
}

Write-Host "Press Enter to exit..."
$null = Read-Host



