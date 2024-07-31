# PSTeamViewer

## Description

This PowerShell script provides a graphical user interface (GUI) to install, uninstall and configure TeamViewer on Windows systems. The basic characteristics of this are:

- Download and install TeamViewer from a URL.
- Install TeamViewer from a local file.
- Uninstall TeamViewer.
- Create a shortcut on the desktop.
- Assign a TeamViewer ID.

## Functionalities

- **Download and Install from URL**: Allows you to enter a download URL to obtain the TeamViewer installer and proceed with the installation.
- **Install from Local File**: Allows you to select a local file (executables `.exe` or `.msi`) to install TeamViewer.
- **Uninstall TeamViewer**: Remove TeamViewer and clean associated files and registry entries.
- **Create Shortcut**: Offers the option of creating a TeamViewer shortcut on the desktop.
- **Assign ID**: Allows you to assign an ID to the TeamViewer installation.

## Requirements

- Windows 7 or higher.
- PowerShell 5.1 or higher.

## How to use

1. **Download the Repository and extract it on a folder**

   ```powershell
   ```

3. **Run the Script**

 Open PowerShell with administrator privileges and navigate to the cloned repository folder:

 ``powershell
 cd path/to/you/repository

3. run the script with a Powershell Terminal:

 ``powershell
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

## Contributions

Contributions are welcome. Please follow these steps to contribute:

1. **Fork the Repository**.
2. **Create a New Branch** (`git checkout -b feature/nueva-funcionalidad').
3. **Make your changes** and commit (`git commit -am 'Add new functionality').
4. **Haz Push to the Branch** (`git push origin feature/nueva-funcionalidad').
5. **Create a Pull Request** on GitHub.

## License

This project is licensed under the MIT License. Consult the file [LICENSE](LICENSE) for more details.

## Contact

For questions or support, please open an [issue](https://github.com/ikkxeer/PSTeamViewer/issues) in the repository or contact [ikkxeer](https://github.com/ikkxeer).
