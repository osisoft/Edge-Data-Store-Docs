---
uid: releaseNotes
---

# Release notes

## OPC UA framework update

The OPC UA adapter embedded in Edge Data Store is updated. If you are upgrading from a previous version of Edge Data Store, the upgrade will modify OPC UA configurations in the following ways:

- The data source configuration is updated to the 1.3 framework.

- The data selection configuration is updated to include `streamId`.

Edge Data Store includes the following components, which are installed as part of Edge Data Store:

- Modbus TCP EDS adapter

- OPC UA EDS adapter

- Data egress

- Health

- OMF endpoint

- REST API

- Trusted server certificates are moved to a trusted certificate folder resulting in one client certificate for all OPC UA components. All other certificates are not migrated.
