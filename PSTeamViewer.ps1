Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$url = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
$localFilePath = ""

$form = New-Object System.Windows.Forms.Form
$form.Text = "TeamViewer Installer"
$form.Size = New-Object System.Drawing.Size(600, 500) # Ajustar el tamaño para acomodar el nuevo campo
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::White
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false

$header = New-Object System.Windows.Forms.Label
$header.Text = "TeamViewer Installer"
$header.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$header.AutoSize = $true
$header.ForeColor = [System.Drawing.Color]::FromArgb(0, 122, 204)
$header.Location = New-Object System.Drawing.Point(185, 20)
$form.Controls.Add($header)

$installByUrlButton = New-Object System.Windows.Forms.Button
$installByUrlButton.Text = "Download and Install by URL"
$installByUrlButton.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 204)
$installByUrlButton.ForeColor = [System.Drawing.Color]::White
$installByUrlButton.FlatStyle = "Flat"
$installByUrlButton.Size = New-Object System.Drawing.Size(250, 40)
$installByUrlButton.Location = New-Object System.Drawing.Point(50, 80)
$form.Controls.Add($installByUrlButton)

$installByLocalFileButton = New-Object System.Windows.Forms.Button
$installByLocalFileButton.Text = "Download and Install by Local File"
$installByLocalFileButton.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 204)
$installByLocalFileButton.ForeColor = [System.Drawing.Color]::White
$installByLocalFileButton.FlatStyle = "Flat"
$installByLocalFileButton.Size = New-Object System.Drawing.Size(250, 40)
$installByLocalFileButton.Location = New-Object System.Drawing.Point(50, 130)
$form.Controls.Add($installByLocalFileButton)

$urlButton = New-Object System.Windows.Forms.Button
$urlButton.Text = "Change URL"
$urlButton.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 204)
$urlButton.ForeColor = [System.Drawing.Color]::White
$urlButton.FlatStyle = "Flat"
$urlButton.Size = New-Object System.Drawing.Size(100, 40)
$urlButton.Location = New-Object System.Drawing.Point(320, 80)
$form.Controls.Add($urlButton)

$uninstallButton = New-Object System.Windows.Forms.Button
$uninstallButton.Text = "Uninstall TeamViewer"
$uninstallButton.BackColor = [System.Drawing.Color]::FromArgb(255, 87, 34)
$uninstallButton.ForeColor = [System.Drawing.Color]::White
$uninstallButton.FlatStyle = "Flat"
$uninstallButton.Size = New-Object System.Drawing.Size(250, 40)
$uninstallButton.Location = New-Object System.Drawing.Point(50, 180)
$form.Controls.Add($uninstallButton)

$createShortcutCheckbox = New-Object System.Windows.Forms.CheckBox
$createShortcutCheckbox.Text = "Create a desktop shortcut"
$createShortcutCheckbox.AutoSize = $true
$createShortcutCheckbox.Location = New-Object System.Drawing.Point(50, 230)
$form.Controls.Add($createShortcutCheckbox)

$assignmentLabel = New-Object System.Windows.Forms.Label
$assignmentLabel.Text = "Assignment ID:"
$assignmentLabel.AutoSize = $true
$assignmentLabel.Location = New-Object System.Drawing.Point(50, 260)
$form.Controls.Add($assignmentLabel)

$assignmentIDBox = New-Object System.Windows.Forms.TextBox
$assignmentIDBox.Size = New-Object System.Drawing.Size(200, 20)
$assignmentIDBox.Location = New-Object System.Drawing.Point(150, 260)
$form.Controls.Add($assignmentIDBox)

$assignmentButton = New-Object System.Windows.Forms.Button
$assignmentButton.Text = "Assign"
$assignmentButton.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 204)
$assignmentButton.ForeColor = [System.Drawing.Color]::White
$assignmentButton.FlatStyle = "Flat"
$assignmentButton.Size = New-Object System.Drawing.Size(80, 30)
$assignmentButton.Location = New-Object System.Drawing.Point(360, 260)
$form.Controls.Add($assignmentButton)

# Ajustes en el campo CUSTOMCONFIG ID
$customConfigLabel = New-Object System.Windows.Forms.Label
$customConfigLabel.Text = "CustomConfig ID:"
$customConfigLabel.AutoSize = $true
$customConfigLabel.Location = New-Object System.Drawing.Point(50, 300)
$form.Controls.Add($customConfigLabel)

$customConfigIDBox = New-Object System.Windows.Forms.TextBox
$customConfigIDBox.Size = New-Object System.Drawing.Size(200, 20)
$customConfigIDBox.Location = New-Object System.Drawing.Point(150, 300)
$form.Controls.Add($customConfigIDBox)

function Show-InputBox {
    param (
        [string]$title,
        [string]$prompt
    )

    $inputForm = New-Object System.Windows.Forms.Form
    $inputForm.Text = $title
    $inputForm.Size = New-Object System.Drawing.Size(400, 150)
    $inputForm.StartPosition = "CenterScreen"
    $inputForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $inputForm.MaximizeBox = $false
    $inputForm.ControlBox = $false

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $prompt
    $label.AutoSize = $true
    $label.Location = New-Object System.Drawing.Point(20, 20)
    $inputForm.Controls.Add($label)

    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Size = New-Object System.Drawing.Size(350, 20)
    $textBox.Location = New-Object System.Drawing.Point(20, 50)
    $inputForm.Controls.Add($textBox)

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Text = "OK"
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $okButton.Location = New-Object System.Drawing.Point(250, 80)
    $inputForm.Controls.Add($okButton)

    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Text = "Cancel"
    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $cancelButton.Location = New-Object System.Drawing.Point(330, 80)
    $inputForm.Controls.Add($cancelButton)

    $inputForm.AcceptButton = $okButton
    $inputForm.CancelButton = $cancelButton

    if ($inputForm.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return $textBox.Text
    }
    return $null
}

function Install-TeamViewer {
    param (
        [string]$installerPath
    )

    $customConfigID = $customConfigIDBox.Text
    $additionalArgs = ""
    if (![string]::IsNullOrWhiteSpace($customConfigID)) {
        $additionalArgs = " CUSTOMCONFIGID=$customConfigID"
    }

    $progressForm = New-Object System.Windows.Forms.Form
    $progressForm.Text = "Download and Install Progress"
    $progressForm.Size = New-Object System.Drawing.Size(400, 150)
    $progressForm.StartPosition = "CenterScreen"
    $progressForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $progressForm.MaximizeBox = $false
    $progressForm.ControlBox = $false

    $progressLabel = New-Object System.Windows.Forms.Label
    $progressLabel.Text = "Installing TeamViewer..."
    $progressLabel.AutoSize = $true
    $progressLabel.Location = New-Object System.Drawing.Point(20, 20)
    $progressForm.Controls.Add($progressLabel)

    $progressBar = New-Object System.Windows.Forms.ProgressBar
    $progressBar.Size = New-Object System.Drawing.Size(350, 30)
    $progressBar.Location = New-Object System.Drawing.Point(20, 60)
    $progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
    $progressBar.Maximum = 100
    $progressBar.Value = 50
    $progressForm.Controls.Add($progressBar)

    $progressForm.Show()

    try {
        if ($installerPath -match "\.msi") {
            Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$installerPath`" /qn ENABLEOUTLOOKPLUGIN=false ADDLOCAL=ALL REMOVE=f.DesktopShortcut$additionalArgs" -Wait
        } else {
            Start-Process -FilePath $installerPath -ArgumentList "/S$additionalArgs" -Wait
        }

        $desktopPath = "C:\Users\Public\Desktop\TeamViewer.lnk"
        if ($createShortcutCheckbox.Checked) {
            if (-not (Test-Path $desktopPath)) {
                $shell = New-Object -ComObject WScript.Shell
                $shortcut = $shell.CreateShortcut($desktopPath)
                $shortcut.TargetPath = "C:\Program Files\TeamViewer\TeamViewer.exe"
                $shortcut.Save()
            }
        } else {
            if (Test-Path $desktopPath) {
                Remove-Item $desktopPath
            }
        }

        $progressLabel.Text = "Installation Complete."
        Start-Sleep -Seconds 2
        $progressForm.Close()
        [System.Windows.Forms.MessageBox]::Show("TeamViewer has been installed successfully.", "Installation Complete", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    } catch {
        [System.Windows.Forms.MessageBox]::Show("An error occurred during installation: $_", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        $progressForm.Invoke([action]{$progressForm.Close()})
    }
}

function Assign-TeamViewer {
    param (
        [string]$assignmentID
    )
    try {
        try {
            $regPath = "HKLM:\SOFTWARE\TeamViewer"
            $teamViewerPath = (Get-ItemProperty -Path $regPath -Name "InstallationDirectory" -ErrorAction Stop).InstallationDirectory
        } catch {
            Write-Error "Installation path not found."
            exit 1
        }
        $teamViewerPath = $teamViewerPath.TrimEnd('\')
        $teamViewerExecutable = Join-Path -Path $teamViewerPath -ChildPath "TeamViewer.exe"
        if (-Not (Test-Path -Path $teamViewerExecutable)) {
            Write-Error "Executable not found."
            exit 1
        }

        Start-Process -FilePath $teamViewerExecutable -ArgumentList "assignment --id $assignmentID" -NoNewWindow
        [System.Windows.Forms.MessageBox]::Show("Assignment completed successfully.", "Assignment Complete", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    } catch {
        [System.Windows.Forms.MessageBox]::Show("An error occurred during assignment: $_", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
}

function Uninstall-TeamViewer {
    try {
        Stop-Service -Name "TeamViewer" -Force -ErrorAction SilentlyContinue

        Start-Sleep -Seconds 10

        Write-Output "Attempting to uninstall TeamViewer..."
        $wmicCommand = 'product where "name like ''TeamViewer%''" call uninstall /nointeractive'
        Start-Process -FilePath "wmic.exe" -ArgumentList $wmicCommand -NoNewWindow -Wait

        $uninstallExePath = "C:\Program Files (x86)\TeamViewer\uninstall.exe"
        if (Test-Path $uninstallExePath) {
            Start-Process -FilePath $uninstallExePath -ArgumentList "/S" -Wait
        } else {
            Write-Output "Uninstall executable not found at $uninstallExePath"
        }

        Write-Output "Killing TeamViewer processes..."
        Get-Process -Name "TeamViewer", "TeamViewer_Service", "tv_w32", "tv_x64" -ErrorAction SilentlyContinue | Stop-Process -Force

        Start-Sleep -Seconds 5

        Write-Output "Deleting registry entries..."
        $registryPaths = @(
            "HKLM:\SOFTWARE\TeamViewer",
            "HKLM:\SOFTWARE\WOW6432Node\TeamViewer",
            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TeamViewer",
            "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\TeamViewer"
        )
        foreach ($path in $registryPaths) {
            Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
        }

        Write-Output "Deleting files and directories..."
        $directories = @(
            "C:\Program Files (x86)\TeamViewer",
            "C:\Program Files\TeamViewer"
        )
        foreach ($dir in $directories) {
            Remove-Item -Path $dir -Recurse -Force -ErrorAction SilentlyContinue
        }

        $desktopPath = "C:\Users\Public\Desktop\TeamViewer.lnk"
        Remove-Item $desktopPath

        [System.Windows.Forms.MessageBox]::Show("TeamViewer has been uninstalled successfully.", "Uninstallation Complete", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    } catch {
        [System.Windows.Forms.MessageBox]::Show("An error occurred during uninstallation: $_", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
}

$urlButton.Add_Click({
    $urlInput = Show-InputBox -title "Enter URL" -prompt "Enter the download URL:"
    if (![string]::IsNullOrWhiteSpace($urlInput)) {
        $url = $urlInput
    }
})

$installByUrlButton.Add_Click({
    if (![string]::IsNullOrWhiteSpace($url)) {
        $installer = "$env:TEMP\TeamViewer_Setup.exe"
        Start-BitsTransfer -Source $url -Destination $installer
        Install-TeamViewer -installerPath $installer
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please set a valid URL first.", "URL Required", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    }
})

$installByLocalFileButton.Add_Click({
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.Filter = "Executables (*.exe)|*.exe|MSI Files (*.msi)|*.msi"
    if ($openFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $localFilePath = $openFileDialog.FileName
        Install-TeamViewer -installerPath $localFilePath
    }
})

$uninstallButton.Add_Click({
    Uninstall-TeamViewer
})

$assignmentButton.Add_Click({
    if (-not [string]::IsNullOrWhiteSpace($assignmentIDBox.Text)) {
        Assign-TeamViewer -assignmentID $assignmentIDBox.Text
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please enter a valid Assignment ID.", "Input Required", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    }
})

[void]$form.ShowDialog()
