function Get-Addon {
    param (
        [string]$repoName,
        [string]$addonDir
    )

    # Download the addon
    Invoke-WebRequest -Uri "https://github.com/kirbycope/$repoName/archive/refs/heads/main.zip" -OutFile "main.zip"

    # Extract the addon
    Expand-Archive -Path "main.zip" -DestinationPath "temp"

    # Copy only the files we need
    Copy-Item -Recurse -Path "./temp/$repoName-main/addons/$addonDir" -Destination "addons/$addonDir" -Force

    # Clean up
    Remove-Item -Recurse -Force "temp"
    Remove-Item "main.zip"

}

Get-Addon -repoName "godot-3d-player-controller" -addonDir "3d_player_controller"
