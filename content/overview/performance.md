---
uid: Performance
---

# Performance

Edge Data Store is designed to run on a variety of low powered devices and to serve data to custom applications that run on the same platform. To assist in determining the appropriate hardware and software configuration for a specific use, EDS was tested on a variety of different devices, from single board computers to industrial edge gateways, on Linux and Windows operating systems, with different data stream counts and with the supported ingress methods collecting data at different event rates.

Use the following performance testing information to determine the appropriate hardware and software to use with EDS in your scenarios.

## Edge Data Store Performance Testing Hardware

EDS performance test cases were divided into three categories based on commonly available, consumer grade and industrial grade devices. Several devices in each category were tested to validate performance expectations and the results of these tests are summarized below in terms of the maximum supported data stream count and data ingress rate for each category.

* Small devices (e.g., 1 core ARM CPU, 512 MB RAM, Linux): 30 data streams, 30 events / sec

* Medium devices (e.g., 2 core ARM or Intel CPU, 2 GB RAM, Linux or Windows): 300 data streams, 300 events / sec

* Large devices (e.g., 4 core ARM or Intel CPU, 4 GB RAM, Linux or Windows): 3,000 data streams, 3,000 events / sec

It is possible that lower performance results may be realized on other devices with similar hardware and software configurations. Other applications running on the same device may also affect actual performance of EDS. The data stream counts and throughput rates shown above are the upper limits of what is supported for EDS for each device category.

## Ingress Performance

EDS can ingress data using the EDS Modbus TCP adapter, the EDS OPC UA adapter, and/or a custom OMF application developed by others. Each of these data ingress methods have a different performance profile, so the performance of EDS using these different methods will vary.

When selecting the device to host EDS, there are a few general principles that arose from the performance testing:

1. EDS adapters use less CPU than custom OMF applications when using the Edge Data Store OMF endpoint. In general, across all hardware platforms, CPU usage for EDS Modbus TCP and EDS OPC UA adapters is roughly half of that used by custom OMF applications at the same event rates.

1. RAM usage is largely determined by the number of data streams written to. More data streams collected in EDS by any data ingress method require additional RAM (in addition to requiring more storage space).

1. EDS is slightly more efficient running on Windows than Linux on similar devices. Both CPU and RAM usage are slightly lower when EDS is running on Windows 10 than on Linux when comparing them on the AMD64/Intel x64 devices, which support both operating systems.

1. SSD storage is recommended for maximum performance and reliability. EDS performance testing was completed on a variety of storage media - SSDs, HDDs, eMMC, and SD cards. EDS performance testing was successful using all storage technologies but for maximum performance and reliability, SSD storage is the best choice.

## Periodic Egress Performance

EDS generates OMF messages when configured to egress data to a PI Server or to AVEVA Data Hub. An important part of periodic egress performance is the amount of network bandwidth available between the device hosting the EDS and the PI Web API OMF endpoint or the AVEVA Data Hub OMF endpoint. The performance numbers presented in this section reflect use of a network with a 1 GB LAN connection and a high-speed connection to the Internet. If EDS is installed on a device in a location with limited network bandwidth, a lower level of egress performance can be expected.

Data egress has a much smaller performance impact on EDS than data ingress. Generally speaking, the performance impact of data egress on CPU and RAM usage is only a small percentage of the CPU and RAM usage of data ingress, so data egress configuration is not a major factor in EDS system design.

### Periodic Egress Performance to PI Web API

Performance testing of periodic egress between EDS and the PI Web API OMF endpoint was completed with a 1 GB LAN connection between the EDS test device and the PI Web API. The PI Web API was hosted on server class PC that also included a PI Server. The EDS device was configured for backfill and several million events were sent to the PI Web API. In all cases, EDS egress performance exceeded 10,000 events per second. In addition, extended tests were run over several weeks with an egress rate of 3,000 events per second.

### Periodic Egress Performance to AVEVA Data Hub

Performance testing of periodic egress between EDS and the AVEVA Data Hub OMF endpoint was completed with a high-speed Internet connection between the EDS test device and AVEVA Data Hub running in the Microsoft Azure West US Data Center, approximately 2,500 miles away. The EDS device was configured for backfill and several million events were sent to AVEVA Data Hub. In all cases, EDS egress performance exceeded 10,000 events per second. In addition, extended tests were run over several weeks with a lower egress rate.
