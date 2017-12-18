@if [%_echo%]==[] echo off

rem *** set Global variables

REM *** Set the BASE NAME of the file
set FILENAME=XmlSampleGenerator

@setlocal
REM *** Set the TARGET TYPE of the file
set TARGETTYPE=library

REM *** dependency files and target directory
set DEST=%BIN_TARGET%

REM *** Remove prior build binaries
del %FILENAME%.dll
del %FILENAME%.pdb

REM *** Now build
echo Now Building %FILENAME%
csc.exe /nologo /t:%TARGETTYPE% /out:%FILENAME%.dll /r:System.dll /r:System.XML.dll  XmlSampleGenerator.cs Facets.cs Generator.cs InstanceAttribute.cs InstanceElement.cs InstanceGroup.cs InstanceObject.cs /debug+ /D:DEBUG

echo Now Building XmlGen.exe command line utility
csc /t:exe XmlGen.cs /r:system.xml.dll /r:XmlSampleGenerator.dll /r:system.dll /debug+

@endlocal

