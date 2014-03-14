dim x, out
userInput = InputBox("What would you like split into an array?","Input please...")
userDelimit = InputBox("What character would you like as a delimiter?", "split it where?")
out = "Splitting '" & userInput & "' at each '" & userDelimit & "' and calling the resulting array 'x', your indices would be..." & vbCrLf & vbCrLf
counter = 0
x = split(userInput, userDelimit)
for each ballsack in x
	'out = out & ballsack & " is at x(" & counter & ")" & vbCr
	out = out & "x(" & counter & ") = " & ballsack & vbCr
	counter = counter + 1
next

wscript.echo(out)
wscript.quit
