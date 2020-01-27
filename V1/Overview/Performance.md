---
uid: Performance
---

# Performance

Edge Data Store is designed to run on a variety of small hardware and software platforms, and to support running customer applications on the same platform. In order to assist in determining the
correct hardware and software configuration for a specific use, testing has been done with the Edge Data Store on a variety of different hardware platforms with the supported ingress protocols at different event rates. Summary tables are provided below for each of the different
protocols on different hardware platforms. 

Mean and Maximum CPU use and Memory (Working Set) are provided. The values are averaged over one minute for the maximum computations, so it is possible there may be momentary spikes in memory or CPU use. These tables are provided as an approximate guideline to what might be expected as an Edge Data Store platform is designed. It is strongly recommended that before production deployment of Edge Data Store performance testing is conducted.

## Ingress Performance

Data in the Edge Data Store can be ingressed using OMF, OPC UA or Modbus TCP. Each of these methods has different performance profiles, so they are treated separately.

### OMF Ingress Performance

|ProgramSize|ComputerType|Storage|Processor|OS|Cores|TestType|EventsPerSecond|StreamCount|MeanWorkingSetMB|MaxWorkingSetMB|MeanCPU%|MaxCPU%|
|--|--|--|--|--|--|--|--|--|--|--|--|--|
|Small|BeagleBone|SD Card|ARM32|Linux|1|omf|2|36|109|122|7|91|
|Small|BeagleBone|SD Card|ARM32|Linux|1|omf|6|56|110|124|13|92|
|Medium|NVIDIA Jetson|SD Card|ARM64|Linux|2|omf|21|506|148|153|5|7|
|Medium|Google Coral|EMMC|ARM64|Linux|4|omf|8|16|150|170|7|11|
|Medium|Raspberry PI 3|SD Card|ARM32|Linux|4|omf|101|106|128|151|16|19|
|Medium|NVIDIA Jetson|SD Card|ARM64|Linux|2|omf|469|506|237|291|28|32|
|Medium|Raspberry PI 3|SD Card|ARM32|Linux|4|omf|301|306|156|202|39|43|
|Medium|Google Coral|EMMC|ARM64|Linux|4|omf|214|26|139|153|26|28|
|Medium|Intel Celeron|EMMC|X64|Windows 10|4|omf|243|256|155|190|7|9|
|Large|Intel Celeron|HDD|X64|Linux|2|omf|1627|3006|630|912|79|86|
|Large|Intel i5|HDD|X64|Windows 10|4|omf|1002|1006|353|404|7|7|
|Large|Intel Celeron|EMMC|X64|Windows 10|4|omf|1919|3006|717|858|58|69|

### Modbus TCP Ingress Performance

|ProgramSize|ComputerType|Storage|Processor|OS|Cores|TestType|EventsPerSecond|StreamCount|MeanWorkingSetMB|MaxWorkingSetMB|MeanCPU%|MaxCPU%|
|--|--|--|--|--|--|--|--|--|--|--|--|--|
|Small|BeagleBone|SD Card|ARM32|Linux|1|modbus|1|15|112|118|20|62|
|Small|BeagleBone|SD Card|ARM32|Linux|1|modbus|8|35|112|126|65|83|
|Medium|Raspberry PI 4|SD Card|ARM64|Linux|4|modbus|38|105|181|201|4|9|
|Medium|Raspberry PI 3|SD Card|ARM32|Linux|4|modbus|255|305|156|205|22|28|
|Large|Xeon|SSD|X64|Linux|4|modbus|2953|3005|725|943|15|31|

### OPC UA Ingress Performance

|ProgramSize|ComputerType|Storage|Processor|OS|Cores|TestType|EventsPerSecond|StreamCount|MeanWorkingSetMB|MaxWorkingSetMB|MeanCPU%|MaxCPU%|
|--|--|--|--|--|--|--|--|--|--|--|--|--|
|Small|BeagleBone|SD Card|ARM32|Linux|1|opcua|52|53|130|146|77|95|
|Small|BeagleBone|SD Card|ARM32|Linux|1|opcua|52|53|131|152|78|94|
|Medium|Raspberry PI 3|SD Card|ARM32|Linux|4|opcua|297|303|170|220|19|21|
|Medium|Raspberry PI 3|SD Card|ARM32|Linux|4|opcua|297|303|170|217|21|23|
|Medium|Raspberry PI 2|SD Card|ARM32|Linux|4|opcua|198|203|161|197|29|33|
|Medium|Raspberry PI 3|SD Card|ARM32|Linux|4|opcua|497|503|166|257|24|26|
|Medium|NVIDIA Jetson|SD Card|ARM64|Linux|4|opcua|498|503|276|346|13|26|
|Medium|Intel Atom|EMMC|X64|Windows 10|4|opcua|498|503|103|157|11|12|
|Large|Intel Celeron|HDD|X64|Linux|2|opcua|9|13|172|178|13|15|
|Large|Intel Celeron|HDD|X64|Linux|2|opcua|89|103|190|213|14|16|
|Large|Intel i5|HDD|X64|Windows 10|4|opcua|8|13|116|148|1|2|
|Large|Xeon|SSD|X64|Linux|4|opcua|2991|3003|754|1046|17|34|

## Periodic Egress Performance

An important part of periodic egress performance is the amount of network bandwidth available between the device hosting the Edge Data Store and the PI Web API or OCS endpoint. The performance numbers below reflect having access to a Gigabit Local Area Network connection and a high speed connection to the Internet. If the device is located in an location with limited network bandwidth a lower level of performance can be expected.

Egress has a much lower performance impact on Edge Data Store than Ingress. Generally the peformance impact of egress on memory and CPU use is generally only a small percentage of the CPU and memory use of Ingress, so is not a major factor in system design.

### Periodic Egress Performance to PI Web API

Performance testing of Periodic Egress between Edge Data Store and PI Web API was done with a 1 GB network connection between the Edge Data Store computer and PI Web API with PI Web API hosted on a Xeon based server class machine that also included a local PI Data Archive installation. The Edge Data Store test device was set to backfill, and several million events were sent to the PI Web API. In all cases egress performance exceeded 10,000 events per second, which exceeds the maximum ingress rate for Edge Data Store of 3,000 events per second. In addition extended tests for several weeks with an egress rate of 3,000 events per second. 

### Periodic Egress Performance to OSIsoft Cloud Services (OCS)

Performance testing of Periodic Egress between Edge Data Store and OCS was done with a 1 GB network connection between the Edge Data Store computer and a high speed Internet connection. The Edge Data Store test device was set to backfill, and several million events were sent to OCS. In all cases egress performance exceeded 10,000 events per second, which exceeds the maximum ingress rate for Edge Data Store of 3,000 events per second. In addition extended tests for several weeks with a lower egress rate.
