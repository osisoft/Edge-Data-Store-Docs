---
uid: Performance
---

# Performance

Edge Data Store is designed to run on a variety of small hardware and software platforms, and to support running customer applications on the same platform. To assist in determining the correct hardware and software configuration for a specific use, Edge Data Store has been tested on a variety of different hardware platforms with the supported ingress protocols at different event rates. Summary tables are provided below for each of the different protocols on different hardware platforms. 

Mean and Maximum CPU use and Memory (Working Set) are provided. The values are averaged over one minute for the maximum computations, so it is possible there may be momentary spikes in memory or CPU use. These tables are provided as an approximate guideline to what might be expected as an Edge Data Store platform is designed. It is strongly recommended that performance testing is conducted before production deployment of Edge Data Store.

## OMF Ingress Performance

|Program Size|Computer Type|Storage|Processor|OS|Cores|Test Type|Events Per Second|Stream Count|Mean Working Set (MB)|Max Working Set (MB)|Mean CPU (%)|Max CPU (%)|
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

## Modbus TCP Ingress Performance

|Program Size|Computer Type|Storage|Processor|OS|Cores|Test Type|Events Per Second|Stream Count|Mean Working Set (MB)|Max Working Set (MB)|Mean CPU (%)|Max CPU (%)|
|--|--|--|--|--|--|--|--|--|--|--|--|--|
|Small|BeagleBone|SD Card|ARM32|Linux|1|modbus|1|15|112|118|20|62|
|Small|BeagleBone|SD Card|ARM32|Linux|1|modbus|8|35|112|126|65|83|
|Medium|Raspberry PI 4|SD Card|ARM64|Linux|4|modbus|38|105|181|201|4|9|
|Medium|Raspberry PI 3|SD Card|ARM32|Linux|4|modbus|255|305|156|205|22|28|
|Large|Xeon|SSD|X64|Linux|4|modbus|2953|3005|725|943|15|31|

## OPC UA Ingress Performance

|Program Size|Computer Type|Storage|Processor|OS|Cores|Test Type|Events Per Second|Stream Count|Mean Working Set (MB)|Max Working Set (MB)|Mean CPU (%)|Max CPU (%)|
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
