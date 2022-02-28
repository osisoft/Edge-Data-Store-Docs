---
uid: commandLineWindowsQuickStart
---

# Command line quick start - Windows

The EdgeCmd utility is OSIsoft's proprietary tool for configuring Edge Data Store from a command line. EdgeCmd must be installed on the device with Edge Data Store. For instructions on installing EdgeCmd, see the [EdgeCmd utility help](https://docs.osisoft.com/bundle/edgecmd/page/index.html).

To access EdgeCmd on Windows, follow these steps:

1. Open a command prompt.

1. Type the following command and press Enter:

   ```cmd
  edgecmd Help
   ```
   The EdgeCmd utility launches, displaying the introductory material followed by a command prompt:
   
   ```
   ************************************************************************************************************************
     Welcome to OSIsoft Edge Data Store configuration utility. Utility version: 1.0.0.148

   ************************************************************************************************************************
   ---------------------------------------------------------------------------------------------------------
               Command-line options => 'Configuration', 'Help'
   ---------------------------------------------------------------------------------------------------------
   Please enter ID of a component you would like to configure or to get component specific help output.
   Example:
   .\edgecmd.exe Help ComponentId
   .\edgecmd.exe Configuration ComponentId

   To get set of components registered to the Edge Data Store please run: .\edgecmd.exe Configuration System Components

   To configure the system, please use 'System' as the ComponentId.
   Example of getting System help output: .\edgecmd.exe Help System
   Example of configuring System Logging level: .\edgecmd.exe Configuration System logging LogLevel=Warning

   C:\Users\John>
   ```
