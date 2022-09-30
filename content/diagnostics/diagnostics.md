---
uid: EdgeDataStoreDiagnostics
---

# Diagnostics configuration

Edge Data Store and its components produce performance and system data for diagnostic purposes and store that data locally in the Storage component. You can query it locally or egress it to PI Web API endpoints, the AVEVA Data Hub, or both. Diagnostic data is always produced and saved; you cannot disable it.

Edge Storage stores diagnostic data within the `diagnostics` namespace. Local access to this data is available through SDS. For more information, see [Read data](xref:sdsReadingData).

## Egress diagnostics data through PeriodicEgressEndpoints

To egress diagnostics related data, specify `diagnostics` as the `NamespaceId` in the periodic egress endpoint configuration. For details and instructions, see [Data egress configuration](xref:egress).

## Edge Data Store diagnostics

The Diagnostics.System dynamic type includes these values which are logged in a stream with the ID System.Diagnostics. This diagnostic stream contains system-level information related to the host platform that Edge Data Store is running on.

| Type         | Property |  Description     |
|--------|--------------|-----------------------------------|
| string | timestamp  | Timestamp of event  |
| int | ProcessIdentifier  | Process id of the host process  |
| string | StartTime  | When the host process started  |
| long | WorkingSet  | Amount of physical memory, in bytes, allocated for the host process  |
| double | TotalProcessorTime (uom=s)  | Total processor time for the host process expressed in seconds  |
| double | TotalUserProcessorTime (uom=s)  | User processor time for the host process expressed in seconds  |
| double | TotalPrivilegedProcessorTime (uom=s)  | Privileged processor time for the host process expressed in seconds  |
| int | ThreadCount | Number of threads in the host process |
| int | HandleCount  | Number of handles opened by the host process  |
| double | ManagedMemorySize (uom=MB)  | Number of bytes currently thought to be allocated in managed memory  |
| double | PrivateMemorySize (uom=MB)  | Amount of paged memory, in bytes, allocated for the host process  |
| double | PeakPagedMemorySize (uom=MB)  | Maximum amount of memory in the virtual memory paging file, in bytes, used by the host process. <br><br>**Note:** On Linux platforms, this value is always reported as 0.|
| double | StorageTotalSize (uom=MB)  | Total size of the storage medium in use by the Edge Data Store  |
| double | StorageFreeSpace (uom=MB)  | Free space available  |

## EDS adapter diagnostics

Each EDS adapter of the Edge Data Store produces its own diagnostics streams.

### Stream count

The `Diagnostics.StreamCountEvent` dynamic type includes these values, which are logged in a stream with the id `{DeviceName}.{componentid}.StreamCount`. The stream count and type count include only types and streams created for sequential data received from a data source.

| Type         | Property |  Description     |
|--------|--------------|-----------------------------------|
| string | timestamp | Timestamp of event |
| int | StreamCount | Number of streams created by the adapter instance |
| int | TypeCount | Number of types created by the adapter instance |

### IO rate

The `Diagnostics.Adapter.IORate` dynamic type includes these values, which are logged in a stream with the id `{DeviceName}.{componentid}.IORate`. IO rate includes only sequential data collected from a data source.

| Type         | Property |  Description     |
|--------|--------------|-----------------------------------|
| string | timestamp | Timestamp of event |
| double | IORate | 10-minute rolling average of data rate (streams/second) |

### Error rate

The `Diagnostics.Adapter.ErrorRate` dynamic type includes these values, and are logged in a stream with the Id `{DeviceName}.{componentid}.ErrorRate`.

| Type         | Property |  Description     |
|--------|--------------|-----------------------------------|
| string | timestamp | Timestamp of event |
| double | ErrorRate | 10-minute rolling average of error rate (streams/second)

## Edge Storage diagnostics

The Storage component of Edge Data Store produces the following diagnostics streams.

### Storage.default.default.Counts

The `Storage.default.default.Counts` stream includes counts of the types, streams, and stream views of the default namespace.

| Type         | Property |  Description     |
|--------|--------------|-----------------------------------|
| string | timestamp | Timestamp of event |
| integer | TypeCount | Count of types |
| integer | StreamCount | Count of streams |
| integer | StreamViewCount | Count of stream views |

### Storage.default.diagnostics.Counts

The `Storage.default.default.Counts` stream includes counts of the types, streams, and stream views of the diagnostics namespace.

| Type         | Property |  Description     |
|--------|--------------|-----------------------------------|
| string | timestamp | Timestamp of event |
| integer | TypeCount | Count of types |
| integer | StreamCount | Count of streams |
| integer | StreamViewCount | Count of stream views |

### Storage.Total.Counts

The `Storage.Totals.Counts` stream includes counts of the types, streams, and stream views of all namespaces of the storage component.

| Type         | Property |  Description     |
|--------|--------------|-----------------------------------|
| string | timestamp | Timestamp of event |
| integer | TypeCount | Count of types |
| integer | StreamCount | Count of streams |
| integer | StreamViewCount | Count of stream views |
