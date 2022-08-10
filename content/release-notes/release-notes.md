---
uid: releaseNotes
---

# Release notes

Edge Data Store includes the following components, which are installed as part of Edge Data Store:

- Modbus TCP EDS adapter

- OPC UA EDS adapter

- Data egress

- Health

- OMF endpoint

- REST API

# Upgrade notes

**Warning:** During upgrade, Edge Data Store will stop collecting and sending data for several seconds.

## Modbus TCP

The Modbus TCP adapter embedded in Edge Data Store is updated.

- The data source property `applyPrefixToStreamId` has been removed. Use the `defaultStreamIdPattern` to achieve similar behavior.

## OPC UA

The OPC UA adapter embedded in Edge Data Store is updated.

- The data source property `applyPrefixToStreamId` has been removed. Use the `defaultStreamIdPattern` to achieve similar behavior.

During upgrade, the existing OPC UA configuration is modified in the following ways:

- The data source configuration is updated to the 1.3 framework.

- The data selection configuration is updated to include `streamId`.

- Trusted server certificates are moved to a new location. Refer to the OPC UA adapter security configuration for location information.

- A new client certificate is generated. 
 
**Note:** OPC UA servers must be configured to trust this new certificate.

## Enhancements

If the transaction log reaches its maximum size, a device status message is sent with a status of `DeviceInError`.

You can configure periodic egress to schedule data transfer to long term storage.











