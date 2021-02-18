---
uid: index
---

# Edge Data Store

Edge Data Store (EDS) is a lightweight data collection and storage application designed to capture data at the edge of networks for historical storage and analysis. It runs on small, rugged devices or embedded in existing industrial hardware, and is designed to be resilient and require minimal installation and administration. While not a replacement for a PI System or OSIsoft Cloud Services (OCS), EDS augments the PI System and OCS by collecting and storing data in situations where deploying a full system is impractical. It can collect data that is beyond the reach of automation systems, in unreliable network conditions, and in environments too rough for traditional computers. Edge Data Store can run almost anywhere you can install a sensor, such as beam pumps, mining trucks, wind mills, etc.

The following diagram shows conceptually how EDS captures data and sends to permanent storage:

![EDS conceptual diagram](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSConceptualDiag.jpg "EDS conecptual diagram")

EDS collects data using any of the following methods:

* Built-in OPC UA connectivity
* Built-in Modbus TCP connectivity
* Custom application using OSIsoft Message Format (OMF) 
* Custom application using REST API

Once collected, the data is stored locally in configurable data storage within EDS, until it can be sent to permanent storage in a PI System or in OSIsoft Cloud Services through periodic egress. The data can also be read from local storage by custom applications using REST APIs.

## Edge Data Store architecture
EDS runs on both Linux and Windows platforms and is comprised of separate components that each perform a specific function within EDS. The following diagram shows Edge Data Store architecture with all of its components and how the data flow through those components:

![EDS architecture](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSArchitecturalDiag.jpg "EDS architecture")

EDS components are shown in grey within the Edge Data Store in the diagram:

* Modbus TCP EDS adapter – Collects data from Modbus TCP devices and writes it to data storage
* OPC UA EDS adapter – Collects data from OPC UA devices and writes it to data storage
* Data Storage – Stores data locally until it can be egressed
* Data egress – Sends data from storage to PI Server or OSIsoft Cloud Services
* Health – Records health information of components and sends it to PI Server or OSIsoft Cloud Services

Blue boxes in the diagram show ways to interact with EDS from the local device:

* OMF REST – Use OSIsoft Message Format to write data to the data storage component programmatically
* SDS REST APIs – Use SDS REST APIs to read data from and write data to the data storage component programmatically
* Configuration – Use REST or the EdgeCmd tool to configure EDS as a whole or each component individually and to view the current configuration

EDS requires an endpoint to connect to REST APIs on the local device, which is shown outlined in blue in the diagram. By default, the endpoint uses port 5590; however, it can be configured to use another port. 

Orange arrows show data flowing into EDS and blue arrows show data flowing out of EDS. 

For detailed information about configuring each component of EDS, see [Configuration](xref:Configuration1-0)



<!--
# OSIsoft Edge Data Store

=======

- [Overview](xref:EdgeDataStoreOverview1-0)
  - [Design considerations](xref:scalePerformance1-0)
  - [Security](xref:security1-0)
- [Quick start guides](xref:QuickStartGuides1-0)
  - [OPC UA EDS adapter quick start](xref:opcUaQuickStart1-0)
  - [Modbus TCP adapter quick start](xref:modbusQuickStart1-0)
  - [OMF quick start](xref:omfQuickStart1-0)
  - [OCS egress quick start](xref:ocsEgressQuickStart1-0)
  - [PI egress quick start](xref:piEgressQuickStart1-0)
  - [SDS Read/Write quick start](xref:sdsQuickStart1-0)
  - [Command line quick start - Linux](xref:commandLineLinuxQuickStart1-0)
  - [Command line quick start - Windows](xref:commandLineWindowsQuickStart1-0)
- [Installation](xref:installationOverview1-0)
  - [System requirements](xref:SystemRequirements1-0)
    - [Linux and Windows platform differences](xref:linuxWindows1-0)
  - [Install Edge Data Store](xref:InstallEdgeDataStore1-0)
    - [Docker](xref:edgeDocker1-0)
  - [Verify installation](xref:VerifyInstallation1-0)
  - [Uninstall Edge Data Store](xref:UninstallEdgeDataStore1-0)
- [Configuration](xref:Configuration1-0)
  - [Configuration tools](xref:ConfigurationTools1-0)
  - [System configuration](xref:SystemConfiguration1-0)
    - [System components configuration](xref:SystemComponentsConfiguration1-0)
    - [System port configuration](xref:SystemPortConfiguration1-0)
    - [Edge Data Store configuration](xref:EdgeDataStoreConfiguration1-0)
  - [Data ingress configuration](xref:EDSDataIngress1-0)
    - [OPC UA EDS adapter](xref:opcUaOverview1-0)
      - [Supported features](xref:SupportedFeaturesOPCUA1-0)
      - [Principles of operation](xref:PrinciplesOfOperationOPCUA1-0)
      - [Data source configuration](xref:OPCUADataSourceConfiguration1-0)
      - [Data selection configuration](xref:OPCUADataSelectionConfiguration1-0)
      - [Adapter security](xref:OPCUAAdapterSecurityConfiguration1-0)
    - [Modbus TCP EDS adapter](xref:modbusOverview1-0)
      - [Supported features](xref:SupportedFeaturesModbus1-0)
      - [Principles of operation](xref:PrinciplesOfOperationModbus1-0)
      - [Data source configuration](xref:ModbusTCPDataSourceConfiguration1-0)
      - [Data selection configuration](xref:ModbusTCPDataSelectionConfiguration1-0)
    - [OSIsoft Message Format (OMF)](xref:omfOverview1-0)
  - [Storage](xref:storage1-0)
    - [Storage runtime configuration](xref:storageruntime1-0)
  - [Data egress configuration](xref:egress1-0)
    - [Prepare egress destinations](xref:PrepareEgressDestinations1-0)
    - [Egress execution details](xref:EgressExecutionDetails1-0)
  - [Diagnostics configuration](xref:EdgeDataStoreDiagnostics1-0)
  - [Health endpoints configuration](xref:HealthEndpointsConfiguration1-0)
  - [Logging configuration](xref:LoggingConfig1-0)
- [Administration](xref:EdgeDataStoreAdministration1-0)
  - [Retrieve product version information](xref:RetrieveProductVersionInformation1-0)
  - [Reset Edge Data Store](xref:ResetEdgeDataStore1-0)
  - [Reset the Storage component](xref:ResetTheStorageComponent1-0)
  - [Stop and start an EDS adapter](xref:StopAndStartAnEDSAdapter1-0)
- [Troubleshoot Edge Data Store](xref:troubleShooting1-0)
  - [Disaster recovery](xref:disasterRecovery1-0)
- [Reference](xref:Reference1-0)
  - [Sequential Data Store (SDS)](xref:sdsOverview1-0)
    - [Types](xref:sdsTypes1-0)
    - [Streams](xref:sdsStreams1-0)
    - [Stream views](xref:sdsStreamViews1-0)
    - [Indexes](xref:sdsIndexes1-0)
    - [Writing data](xref:sdsWritingData1-0)
      - [API calls for writing data](xref:sdsWritingDataApi1-0)
    - [Reading Data](xref:sdsReadingData1-0)
      - [API calls for reading data](xref:sdsReadingDataApi1-0)
      - [Filter expressions](xref:sdsFilterExpressions1-0)
      - [Table format](xref:sdsTableFormat1-0)
    - [Units of measure](xref:unitsOfMeasure1-0)
    - [Compression](xref:sdsCompression1-0)
    - [Searching](xref:sdsSearching1-0)
  - [EdgeCmd commands](xref:EdgecmdCommands1-0)
  - [Release notes](xref:releaseNotes1-0)
  - [Technical support and feedback](xref:Feedback1-0)
-->
