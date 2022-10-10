---
uid: PIAdapterForModbusSecurity
---

# Security

When determining Modbus TCP security practices with regard to REST APIs, only administrators should have access to machines where the adapter is installed to keep the adapter secure. REST APIs are bound to localhost, which means that only requests originating from within the machine are accepted.

## Modbus protocol

The Modbus TCP adapter does not currently support transport layer security between the adapter and the data source, which means that Modbus traffic is unprotected. If needed, use other measures to protect this traffic, such as a VPN connection, air-gapped control network, or SSH tunnel.
