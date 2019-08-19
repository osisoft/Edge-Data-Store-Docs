---
uid: scalePerformance
---

# Edge Data Store design considerations

## Data store role

The data store component that comes with the Edge Data Store is a new component in the OSIsoft software ecosystem. It does not replace any existing storage technology produced by OSIsoft. It differs from the PI Data Archive and OSIsoft Cloud Services in that it is not intended as a permanent repository for customer data. The data store component is intended as a store that is resilient and reliable, but limited in duration and scope, as appropriate for an Edge software component. The data store component is designed to roll off data in a FIFO (first in, first out) process - as new data comes and the size of streams exceeds the configured limits, older data is purged.

If data exists in the data store component that needs to be permanently retained, you should egress it to either PI Data Archive (using PI Web API OMF end point) or to OSIsoft Cloud Services, using the OCS OMF ingress end point.

## Data store scale

The data store component is designed to provide an appropriate level of storage performance on small devices. For the smallest of these devices, throughput may be limited to 10s of events per second. For larger devices with faster processors, memory, and storage, this could increase to up to 3,000 events per second. The data store component's design is focused on small devices in Edge scenarios: if high throughput or large stream counts are required, OSIsoft Cloud Services or PI Data Archive are more appropriate choices.

## Sizing of Edge devices

For the Edge Data Store, there are three supported tiers of performance:

* Small Devices - 1 Core CPU, 512 MB RAM - 30 events/second 200 streams total
* Medium Devices - 2 Core CPU, 1 GB RAM - 300 events/second 2000 streams total
* Large Devices - 4 Core CPU, 4 GB RAM, SSD storage - 3000 events/second 3000 streams total

These performance metrics assume solid state storage, which is commonly used in Edge devices.
