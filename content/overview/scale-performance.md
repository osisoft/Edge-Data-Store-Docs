---
uid: scalePerformance
---

# Design considerations

Before installing Edge Data Store, determine your storage and throughput needs and select devices that meet those needs.

## Edge Storage role

The Edge Storage component is integrated with the EDS and does not replace any existing storage technology produced by OSIsoft. The Edge Storage component is a resilient and reliable data store, but is limited in the duration and scope of the data it retains.

* By default, the storage component processes data in a FIFO (first in first out) method: as new data comes in and the size of streams exceeds the configured limits, older data is purged.

* Data that needs to be permanently retained must be egressed to either PI Data Archive (using the PI Web API OMF endpoint) or to AVEVA Data Hub, using the AVEVA Data Hub OMF ingress endpoint.

## Edge Storage scale

The Edge Storage component provides an appropriate level of storage performance for small devices.

* For the smallest of these devices, throughput may be limited to tens of events per second.

* For larger devices with faster processors, memory and storage, this could increase up to 3,000 events per second. The Edge Storage component is designed for small devices in Edge scenarios: if high throughput or large stream counts are required, AVEVA Data Hub or PI Data Archive are more appropriate choices.

## Sizing of Edge devices

For EDS, there are three supported tiers of performance:

* Small Devices: 1 Core CPU, 512 MB RAM. 30 events/second, 200 streams total.

* Medium Devices: 2 Core CPU, 1 GB RAM. 300 events/second, 2000 streams total.

* Large Devices: 4 Core CPU, 4 GB RAM, SSD storage. 3000 events/second, 3000 streams total.

These performance metrics assume solid state storage, which is commonly used in Edge devices.
