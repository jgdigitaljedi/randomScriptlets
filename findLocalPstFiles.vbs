strComputer = "."
strPST = "Found .pst files on " & strComputer & vbCr & vbCr
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")

WScript.Echo "Searching for pst files. This can take a few minutes."

Set colFiles = objWMIService.ExecQuery _
    ("Select * from CIM_DataFile Where Extension = 'pst' AND Drive = 'C:'")

For Each objFile in colFiles
    'Wscript.Echo objFile.Drive & objFile.Path
    'Wscript.Echo objFile.FileName & "." & objFile.Extension
    'Wscript.Echo objFile.FileSize
    strSize = Round(objFile.FileSize / 1048576, 1) 
    strPST = strPST & objFile.Drive & objFile.Path & objFile.Filename & vbTab & strSize & " MB" & vbCr & vbCr
Next

WScript.Echo strPST
