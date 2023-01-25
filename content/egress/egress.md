---
uid: egress
---

# Data egress

Edge Data Store provides an egress mechanism to transfer data through OMF to AVEVA Data Hub or a AVEVA Server. For each egress destination, you need to prepare the destination and configure an endpoint.

Prepare egress destinations to ensure that AVEVA Data Hub or AVEVA Server are properly configured to receive OMF messages and record information needed to create a connection to the destination.

Configure an egress endpoint to specify the connection information for a destination and the details of the data transfer. Each endpoint is independent of all other egress endpoints, and more than one endpoint for the same destination is allowed.

**Note:** Only streams with a single, timeseries-based index can be egressed. For more information, see [Egress execution details](xref:EgressExecutionDetails).

EDS allows the following types of egress:

 - Periodic egress - Once configured, periodic egress runs at regularly scheduled intervals.
 
 - Manual egress - Manual egress is configured and run on an as needed basis.

Periodic egress ensures that all the data EDS collects is sent to permanent storage on a regular basis. Manual egress gives you the flexibility to retrieve data whenever you need it. For example, say you have EDS configured to collect data on a wind turbine. You configure periodic egress to send data to AVEVA Data Hub every Friday at noon. A strong storm passes through the area of the wind turbine over the weekend, and you do not want to wait until Friday afternoon to review what occurred with the turbine during the storm. You send a manual egress request to EDS to send the weekend data to AVEVA Data Hub, so that you can start analyzing the data today.

**Note:** AVEVA Data Hub is also supported as an egress destination. The setup process is similar to AVEVA Data Hub.
