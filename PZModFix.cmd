:: asking user to check path
@echo off
set /p path=< path.txt
echo Is this the correct path to your steam folder : "%path%" ? [Yes : Y]
set /p c1=
if /i NOT "%c1%"=="Y" echo Path incorrect! Change the path in the path.txt file
if /i NOT "%c1%"=="Y" PAUSE
if /i NOT "%c1%"=="Y" EXIT

:: delete stuff from steams workshop folder
echo Path correct! Make sure to add your Project Zomboid mods to a collection (just to save time)
echo Part 1 : deleting the mods and the workshop file from the steam workshop folder
set wsPath=%path%\steamapps\workshop
::echo "%wsPath%"
rmdir /s "%wspath%\content\108600"
echo %wsPath%\content\108600 was deleted!
del /p "%wsPath%\appworkshop_108600.acf"

:: let the user redownload the mods
echo %wsPath%\appworkshop_108600.acf was deleted! Now restart Steam and let the mods download (Maybe un- and resubscribe)
echo Hit any key once the mods have downloaded!
Pause

:: delete stuff from project zomboids workshop folder
echo Part 2 : deleting the mods and the workshop file from the games workshop folder
set pzPath=%path%\steamapps\common\ProjectZomboid\steamapps\workshop
rmdir /s "%pzPath%\content\108600\"
echo %pzPath%\content\108600 was deleted!
del /p "%pzPath%\appworkshop_108600.acf"
echo %wsPath%\appworkshop_108600.acf was deleted!

:: copy stuff from steams to the project zomboids workshop folder
C:\Windows\System32\xcopy "%wspath%\content\108600\*" "%pzPath%\content\108600\"
echo The mod folder has been copied from the steam workshop folder to the games workshop folder
C:\Windows\System32\xcopy /s /i "%wsPath%\appworkshop_108600.acf" "%pzPath%\"
echo The workshop file has been copied from the steam workshop folder to the games workshop folder

:: the end
echo Finished! No start your server and hopefully you shouldn't have any errors!
Pause