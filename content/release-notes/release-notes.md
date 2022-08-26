---
uid: releaseNotes
---

# Edge Data Store 2.0 Release notes

Edge Data Store includes the following components, which are installed as part of Edge Data Store:

- Modbus TCP EDS adapter

- OPC UA EDS adapter

- Data egress

- Health

- OMF endpoint

- REST API

## Enhancements

The following features were added: 

  - On-demand egress

  - Period egress definition improvements

## Fixes

The following items were resolved: 

  - item 1

## Known issues 

<This section can be completed at discretion of the TPM as a link to the customer portal, a short list, or a combination of the two highlighting a few key items of established customer interest. Known issues may be extensive, some may never be addressed, and the TPM may prefer not to expose them publicly via release notes. We recommend using 1 of the 3 following examples:> 

### Option 1
Existing problems and enhancement requests can be reviewed in the (OSIsoft Customer Portal)[https://customers.osisoft.com/s/products]. Refer to Knowledge Article 16600, How do I see Release Announcements, Alerts, Known Issues, and Knowledge Articles relating to my products? for instructions on how to display a list of known issues. 

### Option 2
The following problems and enhancement requests have been deferred until a future release: 

<insert known issues table here> 

### Option 3
The following problems and enhancement requests have been deferred until a future release: 

<insert known issues table here, or customized notice on specific issue>  

A complete list of existing problems and enhancement requests can be reviewed in the (OSIsoft Customer Portal)[https://customers.osisoft.com/s/products]. Refer to Knowledge Article 16600, How do I see Release Announcements, Alerts, Known Issues, and Knowledge Articles relating to my products? for further instructions on how to display a list of known issues. 

## Upgrade notes

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
 
**Note:** OPC UA servers must be configured to trust this new certificate.

## Security information and guidance 

OSIsoft is (committed to releasing secure products)[https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html]. This section is intended to provide relevant security-related information to guide your installation or upgrade decision.  

OSIsoft (proactively discloses)[https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html#vulnerability-communication] aggregate information about the number and severity of security vulnerabilities addressed in each release. The tables below provide an overview of security issues addressed and their relative severity based on (standard scoring)[https://docs.osisoft.com/bundle/security-commitment-and-disclosure-standards/page/securitycommitmentanddisclosurestandards.html#vulnerability-scoring]. 

<insert security fixes and mitigations tables here> 

## Distribution kit files 

<insert distribution kit list here>
