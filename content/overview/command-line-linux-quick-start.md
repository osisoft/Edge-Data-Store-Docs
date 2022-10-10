---
uid: commandLineLinuxQuickStart
---

# Command line quick start - Linux

The EdgeCmd utility is OSIsoft's proprietary tool for configuring Edge Data Store from a command line. EdgeCmd must be installed on the device with Edge Data Store. For instructions on installing EdgeCmd, see the [EdgeCmd utility help](https://docs.osisoft.com/bundle/edgecmd/page/index.html).

To access EdgeCmd on Linux:

1. Open a command prompt.

1. Enter the following command to start the edgecmd.exe tool from any directory.

   ```bash
   debian@beaglebone:~$ edgecmd help
   ```

1. Type edgecmd help and press Enter.

 The EdgeCmd utility launches, displaying the following introductory material and a command prompt at the end:

   ```
   ************************************************************************************************************************
     Welcome to OSIsoft Edge Data Store configuration utility. Utility version: 1.0.0.148

   ************************************************************************************************************************
   ---------------------------------------------------------------------------------------------------------
               Command-line options => 'Configuration', 'Help'
   ---------------------------------------------------------------------------------------------------------
   Please enter ID of a component you would like to configure or to get component specific help output.
   Example:
   ./edgecmd Help ComponentId
   ./edgecmd Configuration ComponentId

   To get set of components registered to the Edge Data Store please run: ./edgecmd Configuration System Components

   To configure the system, please use 'System' as the ComponentId.
   Example of getting System help output: ./edgecmd Help System
   Example of configuring System Logging level: ./edgecmd Configuration System logging LogLevel=Warning
   debian@beaglebone:~$
   ```
