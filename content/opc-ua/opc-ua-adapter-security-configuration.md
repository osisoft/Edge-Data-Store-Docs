---
uid: OPCUAAdapterSecurityConfiguration
---

# Adapter security

The OPC UA security standard is concerned with the authentication of client and server applications, the authentication of users, and confidentiality of their communication. As the security model relies heavily on Transport Level Security (TLS) to establish a secure communication link with an OPC UA server, each client, including the OPC UA EDS adapter, must have a digital certificate deployed and configured. Certificates uniquely identify client applications and machines on servers, and allow for creation of a secure communication link when trusted on both sides.

The OPC UA EDS adapter instance generates a self-signed certificate when the first secure connection attempt is made. Each OPC UA EDS adapter instance creates a certificate store to persist both its own certificates and those received from the server.

## Configure OPC UA EDS adapter security

To configure OPC UA EDS adapter security:

1. In the data source configuration, set **UseSecureConnection** to `true`. For more information, see [Data source configuration](xref:OPCUADataSourceConfiguration).

   The adapter instance verifies whether the server certificate is present in the [adapter trusted certificates](#adapter-trusted-certificates) folder and is therefore trusted. If the certificates were not exchanged before the first attempted connection, the adapter instance saves the server certificate within the [adapter rejected certificates](#adapter-rejected-certificates) folder and returns the following warning message about the rejected server certificate:

   ```bash
   ~~2019-09-08 11:45:48.093 +01:00~~ [Warning] Rejected Certificate: "DC=MyServer.MyDomain.int, O=Prosys OPC, CN=Simulation
   ```

1. Manually move the server certificate from the RejectedCertificates\certs folder to the Trusted\certs folder using a file explorer or command-line interpreter.

   Linux example using command-line:

   ```bash
   mv /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/RejectedCertificates/certs/SimulationServer\ \[F9823DCF607063DBCECCF6F8F39FD2584F46AEBB\].der /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/Trusted/certs/
   ```

   **Note:** Administrator or root privileges are required to perform this operation.

   Once the certificate is in the adapter instance trusted certificates folder, the adapter instance trusts the server and the connection attempt makes the connection call to the configured server.
  
1. Add the adapter certificate to the server's trust store.

   The connection succeeds only when the adapter certificate is trusted on the server side. For more details on how to make a client certificate trusted, see your OPC UA server documentation. In general, OPC UA servers work in a similar fashion as the clients, a similar approach may work to make the server certificate trusted on the client side.

   When certificates are mutually trusted, the connection attempt succeeds and the adapter instance is connected to the most secure endpoint provided by the server.

## Certificate locations

For all of the following locations, {ComponentID} identifies the adapter instance.

### Adapter rejected certificates

Windows: `%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\RejectedCertificates\certs`

Linux: `/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/RejectedCertificates/certs`

### Adapter trusted certificates

Windows: `%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\Trusted\certs`

Linux: `/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/Trusted/certs`

### Adapter's certificate

Windows: `%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\My\certs`

Linux: `/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/My/certs`
