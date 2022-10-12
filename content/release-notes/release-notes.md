---
uid: releaseNotes
---

# Edge Data Store 1.1 release notes

Edge Data Store (EDS) is a lightweight data collection and storage application designed to capture data at the edge of networks for historical storage and analysis. It runs on small, rugged devices or embedded in existing industrial hardware and is designed to be resilient and require minimal installation and administration.

## Enhancements

The following features were added: 

- Added support for OMF 1.2 ingress and egress 

- Added support for the latest OPC UA and Modbus adapters 

- Enhanced SDS performance and stability  

- Enhanced health and diagnostics reporting, including egress IO rate 

- Added support for stream tags and metadata 

- Periodic egress improvements include: 

  - Added parameter to specify start time 

  - Improved flexibility of egress configuration 

  - Added data filtering, consistent with Adapters 

- Added manual egress feature to allow data egress to permanent storage outside of regular periodic schedule 

- Improved compatibility with PI Web API 

- OPC UA component improvements include:

  - Reduced load on OPC UA server during history recovery by caching user access level 

  - Enhanced logged messages to include status code in hexadecimal instead of decimal and aliased data types 

  - Enhanced edge system configuration secrets management by storing in a centralized location while maintaining backward compatibility 

  - Excluded read-only facets from top level configuration in `GET` requests 

  - Increased the payload size to 64 MB 

  - Removed logging and eliminated error when the same component is added multiple times 

- Modbus component improvements include:

  - PI Adapter for Modbus now leverages a Schedules configuration consistent with other adapters. Instead of specifying a scanRate for each selection item, you configure a schedule in the schedules config facet, then reference that schedule with the scheduleId property on each selection item.  

## Fixes

The following items were resolved: 

| Item      | Description                                       |
|-----------|---------------------------------------------------|
| 298730    | Fixed FormatException from parsing UOM CSV using some cultures.   |
| 294320    | Fixed an issue causing data to stop flowing to a first ADH endpoint after a second endpoint is added.   |
| 308001    | OPC UA now correctly distinguishes between local and UTC time as inputs to History Recovery only mode. History recovery starttime and endtime supplied in local time format will be treated as a local time by the adapter node instead of the UTC time.  |
| 335628   | Fixed an issue that prevented built-in adapters from sending string data.      |
| 275072   | Data collection for the OPC UA server data items will no longer be skipped when the source OPC UA Server has invalid data item attributes like: DataType, Description, BrowseName, DisplayName, UserAccessLevel.	-  
| 338424   | The OpcUa Data Type 'UtcTime' is now supported as a DateTime type.    |
| 270854   | Fixed an issue that caused data to be collected for selection items with `"selected": false`.  |

## Known issues 

There are no known issues with this release.

## Upgrade considerations

This is a list of known changes in EDS 1.1 that may be relevant to upgrading customers.

- Downtime during upgrade is expected to be approximately 6 seconds. 

- Built-in Adapter types have been updated since the previous EDS release to either include Data Quality, new OMF 1.2 feature, or to improve their naming. EDS will automatically migrate to these new types using StreamViews. Clients using EDS’s generic OMF endpoint must manually migrate if types are updated. For detail, see the KB article, [OPC UA Adapter - Upgrade from v1.1 to v1.2](https://customers.osisoft.com/s/knowledgearticle?knowledgeArticleUrl=000037807). 

- Periodic egress configuration has been reorganized in order to support the reuse of common configuration blocks. When EDS is upgraded, it will automatically migrate existing configurations to the new format. However, any subsequent configuration changes made will need to use the updated API and format. See documentation for more information. 

- The `ApplyPrefixToStreamId` configuration property has been removed. 

- OMF 1.2 is now supported. EDS supports ingress of both OMF 1.1 and 1.2. However, it will only egress OMF 1.2, so its egress endpoints must be capable of receiving OMF 1.2, which requires PI Web API 2021 or later. 

- Stream Tags and Metadata are now supported. OMF Data Source, if provided, will be written to EDS as custom metadata and then egressed properly using the OMF Data Source property. 

- Upgraded to .NET 6. 

- The following deprecated operating systems are no longer supported: Debian 9 and Ubuntu 18.04.

- Renamed the `Edge Data Store Schema` directory to `Schemas`.

- OPC UA component considerations:

  - The `DeviceStatus` value `NotConfigured` is now `Not Configured`. 

  - Moved trusted certificates from `\EdgeDataStore\{componentId}\Certificates\Trusted\certs` to `\EdgeDataStore\Certificates\trusted\certs`.

  - The configuration items `ApplyPrefixToStreamId` and `rootNodeIds` have been removed from the Data Source configuration. They will be removed automatically. 

  - Existing data selection items that did not have a Stream Id specified will be given a default Stream Id taken from the `DefaultStreamIdPattern` configuration item in the Data Source configuration. 

- Modbus component considerations:

  - The `DeviceStatus` value `NotConfigured` is now `Not Configured`. 

  - Data Source 

    - Moved `IpAddress` and `Port` to new Devices array to support connecting to multiple Modbus devices.  

    - Changed intervals and timeouts to `Timespan` data type instead of `Integer`. 

    - `ConnectTimeout` has been removed from the data source configuration. 

    - `ApplyPrefixToStreamId` has been removed from the data source configuration. 

  - Data Selection 

    - `ScanRate` replaced by `ScheduleId`. 

    - The `RegisterType` property no longer supports `Input32` or `Holding32` register types. 

  - Default `StreamId` now includes `DeviceId`.

## Security information and guidance 

OSIsoft is [committed to releasing secure products](https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html). This section is intended to provide relevant security-related information to guide your installation or upgrade decision.  

OSIsoft [proactively discloses](https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html#vulnerability-communication) aggregate information about the number and severity of security vulnerabilities addressed in each release. The tables below provide an overview of security issues addressed and their relative severity based on [standard scoring](https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html#vulnerability-scoring). 

| Component      | Version    | CVE or Reference   | CVSS   | Description                               |
|----------------|------------|--------------------|--------|-------------------------------------------|
| zlib           | 1.2.11     | CVE-2018-25032     | 7.5    | The Edge Data Store's utilization of zlib through .NET 6 does not expose these vulnerabilities.   |
| zlib           | 1.2.11     | CVE-2022-37434     | 9.8    | The Edge Data Store's utilization of zlib through .NET 6 does not expose these vulnerabilities.   |

## Distribution kit files 

  - EdgeDataStore_1.1.1.46-arm_.deb

  - EdgeDataStore_1.1.1.46-arm64_.deb

  - EdgeDataStore_1.1.1.46-x64_.deb

  - EdgeDataStore_1.1.1.46-x64_.msi
