<div align="center">
  <img src="https://github.com/user-attachments/assets/5bc6d6ad-bedf-4405-946d-42e4454354a3" alt="PSCacheCleaner Logo" height="300" width="300">
</div>
<h1 align="center">PSTeamViewer</h1>
PSTeamViewer provides a graphical interface to install, uninstall and configure TeamViewer on Windows. It allows installation from a URL, a local file, and facilitates the assignment of IDs and the creation of shortcuts.

## Description

This PowerShell script provides a graphical user interface (GUI) to install, uninstall and configure TeamViewer on Windows systems. The basic characteristics of this are:

- Download and install TeamViewer from a URL.
- Install TeamViewer from a local file.
- Uninstall TeamViewer.
- Create a shortcut on the desktop.
- Assign a TeamViewer ID.
- Custom Config ID
- Device Alias
- Outlook Plugin
- Configuration File

## Functionalities

- **Download and Install from URL**: Allows you to enter a download URL to obtain the TeamViewer installer and proceed with the installation.
- **Install from Local File**: Allows you to select a local file (executables `.exe` or `.msi`) to install TeamViewer.
- **Uninstall TeamViewer**: Remove TeamViewer and clean associated files and registry entries.
- **Create Shortcut**: Offers the option of creating a TeamViewer shortcut on the desktop.
- **Assign ID**: Allows you to assign an ID to the TeamViewer installation.
- **Custom Config ID**: Allows you to use a Custom Config ID to the TeamViewer installation.
- **Device Alias**: Specify device name when assigning, otherwise the computer's hostname will be automatically entered.
- **Enable Outlook Plugin**: Enable or Disable Outlook Plugin.
- **Configuration File**: Allows you to use a .tvopt file to configure the installation.

## Requirements

- Windows 7 or higher.
- PowerShell 5.1 or higher.

## How to use

1. **Download the Repository and extract it on a folder**

   ```powershell
   Start-BitsTransfer -source "https://github.com/ikkxeer/PSTeamViewer/archive/refs/heads/main.zip" -Destination "PSTeamViewer.zip"
   ```

3. **Run the Script**

    Open PowerShell with administrator privileges and navigate to the cloned repository folder:

   ```powershell
    cd path/to/repository
   ```

3. run the script with a Powershell Terminal:

    ```powershell
    .\TeamViewerInstaller.ps1
    ```

## Interaction with the GUI

### Download and Install from URL
1. Click on the **"Download and Install by URL"** button.
2. Enter the TeamViewer installer URL in the dialog box that appears.
3. The script will download the `.exe` file from the provided URL and proceed with the silent installation.

### Install from Local Archive
1. Click the **"Download and Install by Local File"** button.
2. Select a local `.exe` or `.msi` file from the dialog box.
3. The script will install the selected file.

### Uninstall TeamViewer
1. Click the **"Uninstall TeamViewer"** button.
2. The script will uninstall TeamViewer from your system, stopping associated services and deleting files and registry entries.

### Create Direct Access
1. Check the box **"Create a desktop shortcut"** if you want to create a shortcut on the desktop after installation.
2. If you do not check the box, the shortcut will not be created.

### Assign ID
1. Enter the assignment ID in the **"Assignment ID"** text field.
2. Click on the **"Assign"** button.
3. The script will assign the TeamViewer ID to the current installation.

### CustomConfig ID
1. Enter the Custom Config ID in the **"CustomConfig ID"** text field.
2. Click on the **"Download and Install by Local File"** button.
3. Then when you install it will use this custom config id to configure the installation.

### Device Alias
1. Enter the Device Alias in the **"Device Alias"** text field.
2. Click on the **"Assign"** button.
3. Then, your device will be assigned to the id you entered with the name you indicated in Device Alias, if it is blank, the hostname will be used

### Enable Outlook Plugin
1. Enable or Disable the checkbox
2. Click on the **"Download and Install by Local File"** button.
3. It depends on your status, it will enable or not enable the Outlook Plugin

### Select Configuration File
1. Select the .tvopt configuration file
2. Click on the **"Download and Install by Local File"** button.
3. This will configure TeamViewer with the settings specified in the file. 

## Example Image of the GUI
![User Interface image](https://github.com/user-attachments/assets/a92ed2db-340f-4c17-aebf-e92a947f8221)


## License

This project is licensed under the MIT License. Consult the file [LICENSE](LICENSE) for more details.

## Author

This script was authored by ``Ikkxeer``

For any inquiries or issues, please contact @ikkxeer

## Contributing
Contributions to enhance the script or address issues are welcome. Please open a GitHub issue or submit a pull request.
