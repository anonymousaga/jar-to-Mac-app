set directory to POSIX path of (choose file with prompt "Please select a .jar file" of type "jar" default location (path to desktop))
set theDialog to display dialog "Include JRE 11 in app? Note: packaging the JRE makes the app dependency-less" buttons {"Don't Include", "Include"} default button 2 with icon note
do shell script "rm -rf ~/.Java_App_Conversion_Temp.app > /dev/null 2>&1 &"
if button returned of theDialog = "Include" then
	do shell script "cp -r \"" & POSIX path of (path to me) & "Contents/Resources/templateJRE.app\" ~/.Java_App_Conversion_Temp.app && cp -r " & directory & " ~/.Java_App_Conversion_Temp.app/Contents/MacOS/Compiled.jar && a=" & directory & " && xbase=${a##*/} && xpref=${xbase%.*} && mv -n ~/.Java_App_Conversion_Temp.app ${a%/*}/${xpref}.app && touch ${a%/*}/${xpref}.app"
else
	do shell script "cp -r \"" & POSIX path of (path to me) & "Contents/Resources/template.app\" ~/.Java_App_Conversion_Temp.app && cp -r " & directory & " ~/.Java_App_Conversion_Temp.app/Contents/MacOS/Compiled.jar && a=" & directory & " && xbase=${a##*/} && xpref=${xbase%.*} && mv -n ~/.Java_App_Conversion_Temp.app ${a%/*}/${xpref}.app && touch ${a%/*}/${xpref}.app"
end if
do shell script "a=" & directory & " && xbase=${a##*/} && xpref=${xbase%.*} && open -R ${a%/*}/${xpref}.app"
set variableWithSoundName to "Hero"
display notification "JAR Has Been Packaged Into An App" with title "Java App Created" sound name variableWithSoundName
delay 1
