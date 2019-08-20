---
uid: managementTools
---

# Edge Data Store management tools

## Command Line Configuration

In Beta 2 it is recommended that REST be used to configure the Edge Data Store. In the final release there will also be command line configuration tools available.

## REST tools

The following tools are available to facilitate the execution of REST calls.

### cURL

Edge Data Store documentation displays cURL commands for configuration and management examples. cURL is a command line tool supported on Windows and Linux, used to make HTTP calls. cURL is a versatile tool with a large range of capabilities:  any Edge Data Store administrative or programming task can be accomplished with cURL. cURL is also easily scripted, using BASH or Powershell on either Linux or Windows, and is the recommended tool for managing Edge Data Store. Any system that can run Edge Data Store supports cURL.

### Postman

Postman is a very popular and effective REST tool for systems with Graphical UI components (Edge Data Store is supported on platforms that lack this capability). It is particularly useful for learning more about Edge Data Store REST APIs.

### C#, Python, Go

Any modern programming language can also be used to make REST calls to administer and write programs for Edge Data Store. Since the administrative and programming interfaces are unified in using REST, it is possible to write applications that both manage Edge Data Store and read and write data. The Diagnostics namespace, for example, can be accessed locally to monitor and act upon the local system state if desired.

### System Tools

Many OSIsoft customers use Windows computers, even though they may deploy Linux devices to host Edge Storage. Edge Data Store can be installed on Windows 10, and the same custom applications developed on Windows should work on Linux, as long as the application development environment is supported on Linux. Edge Data Store has been designed to use platform independent programming. To facilitate working with Linux devices, Windows tools like PuTTY and WinSCP are very useful for copying files and remotely accessing Linux command lines.
