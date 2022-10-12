---
uid: security
---
# Security

Consider the following when determining Edge Data Store security practices.

## REST APIs

EDS supports REST APIs for configuration, data reading through SDS, and data writing through OMF and SDS. EDS provides only localhost access to REST APIs, which means any code that reads or writes to the REST APIs must reside on the device on which EDS is running. To keep EDS secure, only administrators should have access to devices where EDS is installed.

REST access is through HTTP. The default port is 5590. The port number can be changed during installation or  configuration. URLs must be of the form `http://localhost:{port}/` or `http://127.0.0.1:{port}/`.

**Note:** Do not use the host name or IP Address in the URL.

**Note:** Docker users must use the "host" networking mode for the container. For information about using EDS with Docker, see [Install Edge Data Store using Docker](xref:edgeDocker).

## Data egress

Use HTTPS to write data to AVEVA Data Hub or OSIsoft PI Web API; writing to either of these destinations is not limited to the local device.

## EDS adapters

The Modbus TCP EDS adapter and the OPC UA EDS adapter access remote data sources through binary protocols.

The Modbus TCP EDS adapter does not currently support transport layer security between the adapter and the data source, which means that the Modbus traffic will be unprotected. If needed, use other measures to secure this traffic such as air-gapped control network, VPN connection, SSH tunnel, etc.

## Secure storage

Sensitive information such as passwords and client secrets are saved in configuration files in an encrypted form. Only the EDS runtime can properly store and retrieve these protected data items.

**Note:** Do not manually edit configuration files. Altering encrypted values will cause failures.

Unencrypted values for sensitive information are only available when you provide them to the system through the REST API, such as with initial configuration or update. From that point forward, the unencrypted values are not available, either in the configuration files or through the REST API. The REST API will only return a placeholder string for such values.

Use caution when submitting sensitive data items. For example, remove any temporary file containing unencrypted credentials used to submit configuration to the REST API from the system.

## Service and file system security

The installer creates a specific user account that the Edge Data Store service runs under. This account is only used for running the service. For example, it cannot be used for interactive sessions. Do not configure this service account; modifying the service configuration in this respect could cause system failure.

The EDS binary files, configuration files, and data files are configured by the installer and runtime to allow appropriate access by the service account. Do not modify the permission and ownership assignments for these files as failures could occur.

Consider a third party encryption-at-rest technique for your data storage. This security measure protects your data in the case the device storage is physically stolen, lost, or otherwise falls into the wrong hands.  On Linux, EDS is compatible with whole disk encryption systems such as [LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) or partial encryption systems such as [eCryptfs](https://en.wikipedia.org/wiki/ECryptfs). On Windows, EDS is compatible with whole disk encryption solutions such as [BitLocker](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc732774(v=ws.11)) and [Windows EFS](https://docs.microsoft.com/en-us/previous-versions/tn-archive/cc700811(v=technet.10)).
