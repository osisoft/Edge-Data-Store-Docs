---
uid: Performance
---

# Performance

Edge Data Store is designed to run on a variety of small hardware and software platforms, and to support running customer applications on the same platform. In order to assist in determining the	Edge Data Store is designed to run on a variety of small hardware and software platforms, and to support running customer applications on the same platform. To assist in determining the correct hardware and software configuration for a specific use, Edge Data Store has been tested on a variety of different hardware platforms with the supported ingress protocols at different event rates. Summary tables are provided below for each of the different protocols on different hardware platforms. 

correct hardware and software configuration for a specific use, testing has been done with the Edge Data Store on a variety of different hardware platforms with the supported ingress protocols at different event rates. Summary tables are provided below for each of the different	
protocols on different hardware platforms. 

Mean and Maximum CPU use and Memory (Working Set) are provided. The values are averaged over one minute for the maximum computations, so it is possible there may be momentary spikes in memory or CPU use. These tables are provided as an approximate guideline to what might be expected as an Edge Data Store platform is designed. It is strongly recommended that before production deployment of Edge Data Store performance testing is conducted. Mean and Maximum CPU use and Memory (Working Set) are provided. The values are averaged over one minute for the maximum computations, so it is possible there may be momentary spikes in memory or CPU use. These tables are provided as an approximate guideline to what might be expected as an Edge Data Store platform is designed. It is strongly recommended that performance testing is conducted before production deployment of Edge Data Store.

## Edge Data Store Platforms

For this release of Edge Data Store performance measurements platforms have been divided into three categories with the maximum supported Ingress rate for each category:

* Small devices (e.g. 1 core CPU, 512 MB RAM): 30 events / sec
* Medium devices (e.g. 1 - 2 core CPU, 1 – 2 GB RAM): 300 events / sec
* Large devices (e.g. 2 – 4 core CPU, 4 GB RAM and larger): 3,000 events / sec

## Ingress Performance

Data in the Edge Data Store can be ingressed using OMF, OPC UA or Modbus TCP. Each of these methods has different performance profiles, so they are treated separately.

When selecting the hardware to host Edge Data Store, there are some general principles that come out of our testing:

1. EDS Adapters use less CPU than OMF. In general across all platforms CPU use for EDS OPC UA and EDS Modbus TCP adapters is about half that of OMF ingress at the same event rates.
2. Memory use is largely determined by the number of streams of data being written to. More streams of data will require additional RAM memory (in addition to storage space) to host additional streams.
3. Windows is slightly more efficient than Linux on similar hardware. Both memory and CPU are slightly lower when running on Windows 10 than on Linux on the AMD64/Intel x64 platform where both are supported. 
4. SSD storage is recommended for maximum performance and reliability. Our testing was done across all storage media - SSDs, HDDs, eMMC, and SD cards. EDS testing was successful on all those platforms but for maximum performance and reliability SSD storage is the best choice.

In the tables below are some representative performance numbers based on internal testing of the Edge Data Store. Performance on any specific platform is expected to vary from the tables below, and the numbers below are only estimates of what can be expected on a real device in production. The columns of the table are:

* Size - Small, Medium, or Large based on the definition earlier in this topic
* Computer Type - Maker of the hardware tested
* Storage - hard drive (HDD), solid state drive (SSD), eMMC, or SD card
* RAM - total amount of RAM
* OS - Linux or Windows
* Cores - number of processor cores in the CPU
* Events Per Second - number of events per second being ingressed
* Stream Count - total number of streams on the device in the default namespace
* Max RAM MB - maximum memory used by EDS in this test
* Max CPU % - maximum CPU percentage used by EDS in this test

### OMF Ingress Performance

|Size|Computer Type|Storage|Process|RAM|OS|Cores|Events Second|Stream Count|Max RAM MB|Max CPU %|
|--|--|--|--|--|--|--|--|--|--|--|
|Small|BeagleBone|SD Card|ARM32|512 MB|Linux|1|2|30|130|90|
|Medium|Raspberry PI 3|SD Card|ARM32|1 GB|Linux|4|300|300|202|50|
|Large|Toshiba|HDD|x64|4 GB|Linux|2|1500|3000|912|90|

### Modbus TCP Ingress Performance

|Size|Computer Type|Storage|Process|RAM|OS|Cores|Events Second|Stream Count|Max RAM MB|Max CPU %|
|--|--|--|--|--|--|--|--|--|--|--|
|Small|BeagleBone|SD Card|ARM32|512 MB|Linux|1|15|30|120|65|
|Medium|Raspberry PI 3|SD Card|ARM32|1 GB|Linux|4|38|300|200|30|
|Large|Dell|SSD|x64|8 GB|Linux|4|1500|3000|950|90|

### OPC UA Ingress Performance

|Size|Computer Type|Storage|Process|RAM|OS|Cores|Events Second|Stream Count|Max RAM MB|Max CPU %|
|--|--|--|--|--|--|--|--|--|--|--|
|Small|BeagleBone|SD Card|ARM32|512 MB|Linux|1|50|50|150|95|
|Medium|Raspberry PI 3|SD Card|ARM32|1 GB|Linux|4|300|300|220|30|
|Large|Dell|SSD|x64|8 GB|Linux|4|3000|3000|1100|34|

## Periodic Egress Performance

An important part of periodic egress performance is the amount of network bandwidth available between the device hosting the Edge Data Store and the PI Web API or OCS endpoint. The performance numbers below reflect having access to a 1 GB LAN connection and a high speed connection to the Internet. If the device is located in an location with limited network bandwidth a lower level of performance can be expected.

Egress has a much lower performance impact on Edge Data Store than Ingress. Generally the peformance impact of egress on memory and CPU use is generally only a small percentage of the CPU and memory use of Ingress, so is not a major factor in system design.

### Periodic Egress Performance to PI Web API

Performance testing of Periodic Egress between Edge Data Store and PI Web API was done with a 1 GB network connection between the Edge Data Store computer and PI Web API with PI Web API hosted on a Xeon based server class machine that also included a local PI Data Archive installation. The Edge Data Store test device was set to backfill, and several million events were sent to the PI Web API. In all cases egress performance exceeded 10,000 events per second, which exceeds the maximum ingress rate for Edge Data Store of 3,000 events per second. In addition extended tests for several weeks with an egress rate of 3,000 events per second.

### Periodic Egress Performance to OSIsoft Cloud Services (OCS)

Performance testing of Periodic Egress between Edge Data Store and OCS was done with a 1 GB network connection between the Edge Data Store computer and a high speed Internet connection. The Edge Data Store test device was set to backfill, and several million events were sent to OCS. In all cases egress performance exceeded 10,000 events per second, which exceeds the maximum ingress rate for Edge Data Store of 3,000 events per second. In addition extended tests for several weeks with a lower egress rate.
