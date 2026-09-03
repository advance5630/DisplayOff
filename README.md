# DisplayOff

Small Windows utility that turns off the display immediately.

## Download

Download `DisplayOff.exe` from the latest [GitHub Release](../../releases/latest).

The release executable is self-contained for Windows x64 and does not require PowerShell or a separate .NET runtime.

## Build

```powershell
dotnet publish .\DisplayOff.csproj -c Release
```

The single-file executable is created under `bin\Release\net8.0\win-x64\publish`.

## Security note

The release is currently unsigned. Some security products may show a heuristic warning for unsigned self-contained executables. Check the release SHA-256 hash before use.
