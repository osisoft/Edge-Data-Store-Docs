---
uid: egress
---

# Data egress configuration

Edge Data Store provides an egress mechanism to copy and transfer data through OMF to OSIsoft Cloud Services or a PI Server. For each egress destination, the destination needs to be prepared and an endpoint needs to be configured.

Prepare egress destinations to ensure that OCS or PI Server are properly configured to receive OMF messages and record information needed to create a connection to the destination.

Configure an egress endpoint to specify the connection information for a destination and the details of the data transfer. Each endpoint is independent of all other egress endpoints, and more than one endpoint for the same destination is allowed.

**Note:** Only streams with a single, timeseries-based index can be egressed. For more information, see [Egress execution details](xref:EgressExecutionDetails).

Edge Data Store supports one [tenant](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Management/Account_Tenant.html) and two [namespaces](https://ocs-docs.osisoft.com/Content_Portal/Documentation/Management/Account_Namespace_1.html). The EDS tenant name is _default_, and the two namespaces are _default_ and _diagnostics_. The default namespace is where adapter and OMF data is written. The diagnostics namespace is where performance and system information is written, which can be used locally or egressed to a remote PI server or OCS for monitoring. A separate egress definition is required for each namespace from which you want to egress data.

