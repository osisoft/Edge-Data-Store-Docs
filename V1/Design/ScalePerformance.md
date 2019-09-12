---
uid: scalePerformance
---

# Edge Data Store design considerations

## Edge Storage role

The Edge Storage component that ships with the Edge Data Store is a new component in the OSIsoft software ecosystem. It is not designed to replace any existing storage technology produced by OSIsoft. The Edge Storage component is intended as a store that is resilient and reliable, but is usually limited in duration and scope, as appropriate for an Edge software component. The Edge storage component is configured by default to roll off data in a FIFO (first in first out) process - as new data comes and the size of streams exceeds the configured limits, older data is purged.

If data exists in the Edge Storage component that needs to be permanently retained, it should be egressed to either the PI Data Archive (using the PI Web API OMF endpoint) or to OSIsoft Cloud Services, using the OCS OMF ingress endpoint.

## Edge Storage scale

The Edge Storage component has been designed to provide an appropriate level of storage performance on small devices. For the smallest of these devices, throughput may be limited to 10s of events per second. For larger devices with faster processors, memory, and storage, this could increase to up to 3,000 events per second. The Edge Storage component's design is focused on small devices in Edge scenarios: if high throughput or large stream counts are required, OSIsoft Cloud Services or the PI Data Archive are more appropriate choices.

## Sizing of Edge Devices

For the Edge Data Store, there are three supported tiers of performance:

* Small Devices - 1 Core CPU, 512 MB RAM - 30 events/second 200 streams total
* Medium Devices - 2 Core CPU, 1 GB RAM - 300 events/second 2000 streams total
* Large Devices - 4 Core CPU, 4 GB RAM, SSD storage - 3000 events/second 3000 streams total

These performance metrics assume solid state storage, which is commonly used in Edge devices.
