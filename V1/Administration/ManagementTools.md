---
uid: managementTools
---

# Edge Data Store management tools

REST calls are currently the primary method used to configure the Edge Data Store. 

**Note:** Command line configuration tools are targeted to be available in the final release of Edge Data Store.

## REST tools

The following tools are available to facilitate the execution of REST calls:

### curl

You can accomplish any Edge Data Store administrative or programming task with curl, and it is the recommended REST tool for managing Edge Data Store. curl is a versatile command line tool supported on Windows and Linux, with a large range of capabilities:  

  - used to make HTTP calls
  - easily scripted using BASH or Powershell on either Linux or Windows
  - Any system that can run Edge Data Store supports curl.
 
 Refer to these example curl commands for configuration and management. <need link.>

### Postman

Postman is a very popular and effective REST tool for systems with Graphical UI components. It is particularly useful for learning more about Edge Data Store REST APIs.

**Note:** Postman is not available on all platforms which support Edge Data Store.

### C#, Python, Go

Any modern programming language can also be used to make REST calls to administer and write programs for Edge Data Store. Since the administrative and programming interfaces are unified in using REST, it is possible to write applications that both manage Edge Data Store and read and write data. The Diagnostics namespace, for example, can be accessed locally to monitor and act upon the local system state if desired.

### System Tools

Many OSIsoft customers use Windows computers, even though they may deploy Linux devices to host Edge data storage. Edge Data Store can be installed on Windows 10, and the same custom applications developed on Windows should work on Linux, as long as the application development environment is supported on Linux. Edge Data Store has been designed to use platform independent programming. To facilitate working with Linux devices, Windows tools like PuTTY and WinSCP are very useful for copying files and remotely accessing Linux command lines.
