# dotnet-debugging-performance
Comparing the performance between native debugging and into a docker container

## Environment data
```
.NET Core SDK (reflecting any global.json):
 Version:   2.1.300
 Commit:    adab45bf0c

Runtime Environment:
 OS Name:     Mac OS X
 OS Version:  10.13
 OS Platform: Darwin
 RID:         osx.10.13-x64
 Base Path:   /usr/local/share/dotnet/sdk/2.1.300/

Host (useful for support):
  Version: 2.1.2
  Commit:  811c3ce6c0

.NET Core SDKs installed:
  1.0.1 [/usr/local/share/dotnet/sdk]
  1.0.4 [/usr/local/share/dotnet/sdk]
  1.1.4 [/usr/local/share/dotnet/sdk]
  2.0.0 [/usr/local/share/dotnet/sdk]
  2.0.3 [/usr/local/share/dotnet/sdk]
  2.1.4 [/usr/local/share/dotnet/sdk]
  2.1.300-preview2-008533 [/usr/local/share/dotnet/sdk]
  2.1.300 [/usr/local/share/dotnet/sdk]

.NET Core runtimes installed:
  Microsoft.AspNetCore.All 2.1.0-preview2-final [/usr/local/share/dotnet/shared/Microsoft.AspNetCore.All]
  Microsoft.AspNetCore.All 2.1.0 [/usr/local/share/dotnet/shared/Microsoft.AspNetCore.All]
  Microsoft.AspNetCore.App 2.1.0-preview2-final [/usr/local/share/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.AspNetCore.App 2.1.0 [/usr/local/share/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 1.0.4 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 1.0.5 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 1.1.1 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 1.1.2 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 1.1.4 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 1.1.9 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 2.0.0 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 2.0.3 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 2.0.5 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 2.1.0-preview2-26406-04 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 2.1.0 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
  Microsoft.NETCore.App 2.1.2 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]

To install additional .NET Core runtimes or SDKs:
  https://aka.ms/dotnet-download
```
VS Code version:

1.25.1

C# Extension version:

1.15.2

## Steps to reproduce
There's two Launch Methods, Docker and Native.

 - Add breakpoint to 'return View()' line in Home Controller. HomeController.csd
 - Run application
 - When it hits breakpoint, expand the 'this' variable. Natively it takes about 3 seconds, Docker takes 5.
 - - While this difference isn't that big, the difference grows dramaticly with larger applications.
 - Also hitting 'Step over' or 'Step into' is slower in Docker vs Native.

## Expected  behavior
 - I would expect docker and native to have very little difference in debugging performance.

## Actual behavior
 - The difference is noticable and increases with application size.
