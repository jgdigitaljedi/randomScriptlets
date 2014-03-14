Const HKEY_LOCAL_MACHINE = &H80000002
Const ADS_PROPERTY_APPEND = 3
Const ADS_PROPERTY_UPDATE = 2
Const ForReading = 1
Const ForWriting = 2 
Const ForAppending = 8
Const ADS_SCOPE_SUBTREE = 2

'Set your AD Domain
strDC = "DC=something,DC=more,DC=Com"

'Setting the OU’s is backwards. Set the AD dir structure starting from the last folder
strOU = "OU=Computers,OU=siteName,OU=firstSubFolder,OU=FIrstAdFolder"
logLoc = "c:\temp\Ping_results.txt"

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")

Set WshShell = WScript.CreateObject("WScript.Shell")
If not logLoc = "" Then
Set objwriteFile = objFSO.OpenTextFile (logLoc, 8)
End If

		
		
Set objConnection = CreateObject("ADODB.Connection")
Set objCommand =   CreateObject("ADODB.Command")
objConnection.Provider = "ADsDSOObject"
objConnection.Open "Active Directory Provider"
Set objCOmmand.ActiveConnection = objConnection
objCommand.CommandText = "Select Name from 'LDAP://" & strOU & "," & strDC & "' where objectClass='computer' order by Name"          
objCommand.Properties("Page Size") = 999
objCommand.Properties("Timeout") = 15 
objCommand.Properties("Searchscope") = ADS_SCOPE_SUBTREE 
objCommand.Properties("Cache Results") = False 
Set objRecordSet = objCommand.Execute
objRecordSet.MoveFirst
Do Until objRecordSet.EOF
'     Use objRecordSet.Fields("Name").Value for computer name and add actions here
	strComputer = objRecordSet.Fields("Name").Value
	'If Ucase(Left(strComputer, 1)) <> "M" Then
		If UCase(Left(strcomputer,1)) <> "S" Then
		If PingComputer(strComputer)=0 Then
	on error Resume Next
	pingres = "no"
	WScript.Echo strcomputer & ", dead machine"
	objwriteFile.writeline strComputer & ", dead machine" 
		Else
	pingres = "yes"
	'WScript.Echo strcomputer '& ", good machine"
	objwriteFile.writeline strComputer & ", good machine"
End If
End If
'     on error resume Next
'     
'		If pingres ="yes" Then 
'		dwValue="Not Found"
'
'		Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")
'			strKeyPath = "SOFTWARE\e-talk\sacapture"
'			strValueName = "use_gdi"
'			oReg.GetDWORDValue  HKEY_LOCAL_MACHINE,strKeyPath,strValueName,dwValue
'			WScript.Echo strComputer & ", " & dwValue
'			objwriteFile.writeline strComputer & ", " & dwValue
' 			If dwValue = "1" Then 
' 			WScript.Echo strComputer & ", good"
' 			Else 
' 			WScript.Echo strComputer & ", Missing" 
' 			End If
'
'		 End If
'		 'End If
'		 'End If
			     objRecordSet.MoveNext
Loop
 objWriteFile.close
 
Function PingComputer (machine)
  PingComputer=False
  Set objShell = WScript.CreateObject("WScript.Shell")
  Set objExecObject = objShell.Exec("ping -n 1 -w 500 " & machine)
  Do While Not objExecObject.StdOut.AtEndOfStream
      strText = objExecObject.StdOut.ReadLine()
      If Instr(strText, "Reply") > 0 Then
          PingComputer=True
          Exit Do
      End If
  Loop
end Function
