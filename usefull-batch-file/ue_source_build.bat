git clone https://github.com/EpicGames/UnrealEngine.git/5.1
::"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" "C:\Tools\Jenkins\Jobs\UE_Source\UE5.sln" -target:"Engine\UE5" -property:Platform=Win64;Configuration="Development Editor" -verbosity:diagnostic