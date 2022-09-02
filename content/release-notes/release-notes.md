---
uid: releaseNotes
---

# Edge Data Store 1.1 Release notes

Edge Data Store (EDS) is a lightweight data collection and storage application designed to capture data at the edge of networks for historical storage and analysis. It runs on small, rugged devices or embedded in existing industrial hardware, and is designed to be resilient and require minimal installation and administration.

## Enhancements

The following features were added: 

  - Manual egress

  - Period egress definition improvements
  
  - Support for OMF 1.2 ingress and egress

  - Support for the latest OpcUa and Modbus adapters

  - Enhanced health and diagnostics reporting

  - Enhanced SDS support including fast recovery, memory usage optimization and configuration, more diagnostic capabilities

  - Support for stream metadata and tags

## Fixes

The following items were resolved: 

| Item      | Description                                       |
|-----------|---------------------------------------------------|
| 298730    | Fixed FormatException from parsing UOM CSV using some cultures.   |
| 294320    | Fixed an issue causing data to stop flowing to a first ADH endpoint after a second endpoint is added.   |
| 308001    | OPC UA now correctly distinguishes between local and UTC time as inputs to History Recovery only mode.   |

## Known issues 

The following problems and enhancement requests have been deferred until a future release: 

  - In this release of EDS, SDS transaction logs are expected to be truncated each time the system checkpoints. However, in the unlikely scenario that this truncation process fails repeatedly, the transaction log will continue to grow in size, eventually causing a process termination. The next EDS release will handle this scenario more gracefully.

<!--## Upgrade notes

**Warning:** During upgrade, Edge Data Store will stop collecting and sending data for several seconds.

### Modbus TCP

The Modbus TCP adapter embedded in Edge Data Store is updated.

- The data source property `applyPrefixToStreamId` has been removed. Use the `defaultStreamIdPattern` to achieve similar behavior.

### OPC UA

The OPC UA adapter embedded in Edge Data Store is updated.

  - The data source property `applyPrefixToStreamId` has been removed. Use the `defaultStreamIdPattern` to achieve similar behavior.

During upgrade, the existing OPC UA configuration is modified in the following ways:

  - The data source configuration is updated to the 1.3 framework.

  - The data selection configuration is updated to include `streamId`.

  - Trusted server certificates are moved to a new location. Refer to the OPC UA adapter security configuration for location information.

  - A new client certificate is generated. 
 
**Note:** OPC UA servers must be configured to trust this new certificate. -->

## Security information and guidance 

OSIsoft is (committed to releasing secure products)[https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html]. This section is intended to provide relevant security-related information to guide your installation or upgrade decision.  

OSIsoft (proactively discloses)[https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html#vulnerability-communication] aggregate information about the number and severity of security vulnerabilities addressed in each release. The tables below provide an overview of security issues addressed and their relative severity based on (standard scoring)[https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html#vulnerability-scoring]. 

| Component      | Version    | CVE or Reference   | CVSS   | Description                               |
|----------------|------------|--------------------|--------|-------------------------------------------|
| zlib           | 1.2.11     | CVE-2018-25032     | 7.5    | The Edge Data Store's utilization of zlib through .NET 6 does not expose these vulnerabilities.   |

## Distribution kit files 

  - EdgeDataStore_1.1.0.9-arm.deb

  - EdgeDataStore_1.1.0.9-arm64.deb

  - EdgeDataStore_1.1.0.9-x64.deb

  - EdgeDataStore_1.1.0.9-x64.msi

### Installation and upgrade

This release is not intended for upgrade scenarios.

Install using the provided .msi or .deb installers as appropriate.

### Uninstallation

  - Windows: Remove the product using Uninstall a program in the Windows Control Panel.

  - Ubuntu: Remove the product using Ubuntu Software.

  - Debian: Remove the product using Software Center.
