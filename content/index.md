---
uid: index
---

# Edge Data Store

Edge Data Store (EDS) is a lightweight data collection and storage application designed to capture data at the edge of networks for historical storage and analysis. It runs on small, rugged devices or embedded in existing industrial hardware, and is designed to be resilient and require minimal installation and administration. While not a replacement for a PI System or OSIsoft Cloud Services (OCS), EDS augments the PI System and OCS by collecting and storing data in situations where deploying a full system is impractical. It can collect data that is beyond the reach of automation systems, in unreliable network conditions, and in environments too rough for traditional computers. Edge Data Store can run almost anywhere you can install a sensor, such as beam pumps, mining trucks, wind mills, etc.

The following diagram shows conceptually how EDS captures data and sends to permanent storage:

![EDS conceptual diagram](https://osisoft.github.io/Edge-Data-Store-Docs/content/images/EDSConceptualDiag.jpg "EDS conecptual diagram")

EDS collects data using any of the following methods:

* Built-in OPC UA connectivity
* Built-in Modbus TCP connectivity
* Custom application using OSIsoft Message Format (OMF) 
* Custom application using REST API

Once collected, the data is stored locally in configurable data storage within EDS, until it can be sent to permanent storage in a PI System or in OSIsoft Cloud Services through periodic egress. The data can also be read from local storage by custom applications using REST APIs.

## Edge Data Store architecture
EDS runs on both Linux and Windows platforms and is comprised of separate components that each perform a specific function within EDS. The following diagram shows Edge Data Store architecture with all of its components and how the data flow through those components:

![EDS architecture](https://osisoft.github.io/Edge-Data-Store-Docs/content/images/EDSArchitecturalDiag.jpg "EDS architecture")

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

For detailed information about configuring each component of EDS, see [Configuration](xref:Configuration).



<!--
# OSIsoft Edge Data Store

=======

- [Overview](xref:EdgeDataStoreOverview)
  - [Design considerations](xref:scalePerformance)
  - [Security](xref:security)
- [Quick start guides](xref:QuickStartGuides)
  - [OPC UA EDS adapter quick start](xref:opcUaQuickStart)
  - [Modbus TCP adapter quick start](xref:modbusQuickStart)
  - [OMF quick start](xref:omfQuickStart)
  - [OCS egress quick start](xref:ocsEgressQuickStart)
  - [PI egress quick start](xref:piEgressQuickStart)
  - [SDS Read/Write quick start](xref:sdsQuickStart)
  - [Command line quick start - Linux](xref:commandLineLinuxQuickStart)
  - [Command line quick start - Windows](xref:commandLineWindowsQuickStart)
- [Installation](xref:installationOverview)
  - [System requirements](xref:SystemRequirements)
    - [Linux and Windows platform differences](xref:linuxWindows)
  - [Install Edge Data Store](xref:InstallEdgeDataStore)
    - [Docker](xref:edgeDocker)
  - [Verify installation](xref:VerifyInstallation)
  - [Uninstall Edge Data Store](xref:UninstallEdgeDataStore)
- [Configuration](xref:Configuration)
  - [Configuration tools](xref:ConfigurationTools)
  - [System configuration](xref:SystemConfiguration)
    - [System components configuration](xref:SystemComponentsConfiguration)
    - [System port configuration](xref:SystemPortConfiguration)
    - [Edge Data Store configuration](xref:EdgeDataStoreConfiguration)
  - [Data ingress configuration](xref:EDSDataIngress)
    - [OPC UA EDS adapter](xref:opcUaOverview)
      - [Supported features](xref:SupportedFeaturesOPCUA)
      - [Principles of operation](xref:PrinciplesOfOperationOPCUA)
      - [Data source configuration](xref:OPCUADataSourceConfiguration)
      - [Data selection configuration](xref:OPCUADataSelectionConfiguration)
      - [Adapter security](xref:OPCUAAdapterSecurityConfiguration)
    - [Modbus TCP EDS adapter](xref:modbusOverview)
      - [Supported features](xref:SupportedFeaturesModbus)
      - [Principles of operation](xref:PrinciplesOfOperationModbus)
      - [Data source configuration](xref:ModbusTCPDataSourceConfiguration)
      - [Data selection configuration](xref:ModbusTCPDataSelectionConfiguration)
    - [OSIsoft Message Format (OMF)](xref:omfOverview)
  - [Storage](xref:storage)
    - [Storage runtime configuration](xref:storageruntime)
  - [Data egress configuration](xref:egress)
    - [Prepare egress destinations](xref:PrepareEgressDestinations)
    - [Egress execution details](xref:EgressExecutionDetails)
  - [Diagnostics configuration](xref:EdgeDataStoreDiagnostics)
  - [Health endpoints configuration](xref:HealthEndpointsConfiguration)
  - [Logging configuration](xref:LoggingConfig)
- [Administration](xref:EdgeDataStoreAdministration)
  - [Retrieve product version information](xref:RetrieveProductVersionInformation)
  - [Reset Edge Data Store](xref:ResetEdgeDataStore)
  - [Reset the Storage component](xref:ResetTheStorageComponent)
  - [Stop and start an EDS adapter](xref:StopAndStartAnEDSAdapter)
- [Troubleshoot Edge Data Store](xref:troubleShooting)
  - [Disaster recovery](xref:disasterRecovery)
- [Reference](xref:Reference)
  - [Sequential Data Store (SDS)](xref:sdsOverview)
    - [Types](xref:sdsTypes)
    - [Streams](xref:sdsStreams)
    - [Stream views](xref:sdsStreamViews)
    - [Indexes](xref:sdsIndexes)
    - [Read Data](xref:sdsReadingData)
      - [API calls for reading data](xref:sdsReadingDataApi)
      - [Filter expressions](xref:sdsFilterExpressions)
      - [Table format](xref:sdsTableFormat)
    - [Write data](xref:sdsWritingData)
      - [Response format](xref:ResponseFormatWriteAPIs)
      - [API calls for writing data](xref:sdsWritingDataApi)
    - [Units of measure](xref:unitsOfMeasure)
    - [Compression](xref:sdsCompression)
    - [Searching](xref:sdsSearching)
  - [EdgeCmd commands](xref:EdgecmdCommands)
  - [Release notes](xref:releaseNotes)
  - [Technical support and feedback](xref:Feedback)
-->
