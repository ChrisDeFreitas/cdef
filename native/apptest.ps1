/*
    apptest.ps

    - test calling PowerShell apps from browser extensions

    error:
        .\apptest.ps1 : File C:\Users\chris\Code\FF Ext\cdef\native\apptest.ps1 
        cannot be loaded because running scripts is disabled on this system. For 
        more information, see about_Execution_Policies at 
        http://go.microsoft.com/fwlink/?LinkID=135170.
        At line:1 char:1
        + .\apptest.ps1
        + ~~~~~~~~~~~~~
            + CategoryInfo          : SecurityError: (:) [], PSSecurityException
            + FullyQualifiedErrorId : UnauthorizedAccess    
    
    resolution:
        https://www.techwalla.com/articles/how-to-run-powershell-scripts-from-the-command-line

        If you receive an error saying you don't have permission to run the script, launch 
        PowerShell to change your settings. To do so, search for "PowerShell" in the search
        box and click the result. Then, type "Unblock-File -Path" followed by a space and 
        the full path of the PowerShell script. You can also change your settings to allow 
        any PowerShell script to run, but make sure you understand the security ramifications 
        of doing so before making this decision.

*/
[System.Windows.MessageBox]::Show('Hello')]