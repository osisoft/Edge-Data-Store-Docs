---
uid: PIAdapterForOPCUASecurityConfiguration
---

# Security

The OPC UA security standard is concerned with the authentication of client and server applications, the authentication of users, and confidentiality of their communication. Because the security model relies heavily on Transport Level Security (TLS) to establish a secure communication link with an OPC UA server, each client, including the adapter, must have a digital certificate deployed and configured. Certificates uniquely identify client applications and machines on servers, and allow for creation of a secure communication link when trusted on both sides.

The adapter generates a self-signed certificate when the first secure connection attempt is made. The adapter's certificates and those of the server are stored in the certificate store, which is shared between all adapter instances.

When determining OPC UA security practices with regards to REST APIs, you should consider the following practice. To keep the adapter secure, only administrators should have access to machines where the adapter is installed. REST APIs are bound to localhost, meaning that only requests coming from within the machine will be accepted.

## Configure OPC UA adapter security

Complete the following steps to configure adapter security:

1. In your data source configuration, set `UseSecureConnection` to **true**. For more information, see [PI Adapter for OPC UA data source configuration](xref:PIAdapterForOPCUADataSourceConfiguration).

   The adapter verifies whether the server certificate is present in the [adapter trusted certificates](#adapter-trusted-certificates) and hence trusts it. In case the certificates were not exchanged before the first attempted connection, the adapter persists the server certificate within the [adapter rejected certificates](#adapter-rejected-certificates) folder. The following warning message about the rejected server certificate will be printed:

   ```bash
   ~~2019-09-08 11:45:48.093 +01:00~~ [Warning] Rejected Certificate: "DC=MyServer.MyDomain.int, O=OSIsoft, CN=Simulation
   ```

2. Manually move the server certificate from the [Adapter rejected certificates](#adapter-rejected-certificates) location to the [Adapter trusted certificates](#adapter-trusted-certificates) location using a file explorer or command-line interpreter.

   Linux example using command-line:

   ```bash
   sudo mv /usr/share/OSIsoft/Adapters/OpcUa/Certificates/rejected/certs/'SimulationServer [F9823DCF607063DBCECCF6F8F39FD2584F46AEBB].der' /usr/share/OSIsoft/Adapters/OpcUa/Certificates/trusted/certs/
   ```

   **Note:** Administrator or root privileges are required to perform this operation.

   Once the certificate is in the adapter trusted certificates folder, the adapter trusts the server and the connection attempt proceeds in making the connection call to the configured server.
  
3. Add the [certificate of the adapter](#certificate-of-the-adapter) to the server's trust store.

   The connection succeeds only when the adapter certificate is trusted on the server side. <br> For more details on how to make a client certificate trusted, see your OPC UA server documentation. <br> In general, servers work in a similar fashion to the clients, hence you can take a similar approach for making the client certificate trusted on the server side.

   When certificates are mutually trusted, the connection attempt succeeds and the adapter is connected to the most secure endpoint provided by the server.

### Certificate locations

#### Adapter rejected certificates

Windows:

```filepath
%programdata%\OSIsoft\Adapters\OpcUa\Certificates\rejected\certs
```

Linux:

```filepath
/usr/share/OSIsoft/Adapters/OpcUa/Certificates/rejected/certs
```

#### Adapter trusted certificates

Windows:

```filepath
%programdata%\OSIsoft\Adapters\OpcUa\Certificates\trusted\certs
```

Linux:

```filepath
/usr/share/OSIsoft/Adapters/OpcUa/Certificates/trusted/certs
```

#### Certificate of the adapter

Windows:

```filepath
%programdata%\OSIsoft\Adapters\OpcUa\Certificates\own\certs
```

Linux:

```filepath
/usr/share/OSIsoft/Adapters/OpcUa/Certificates/own/certs
```

**Note:** Access to the private key of the adapter requires administrator permissions. The location of the private key is the following:

   Windows:

   ```filepath
   %programdata%\OSIsoft\Adapters\OpcUa\Certificates\own\private
   ```

   Linux:

   ```filepath
   /usr/share/OSIsoft/Adapters/OpcUa/Certificates/own/private
   ```
