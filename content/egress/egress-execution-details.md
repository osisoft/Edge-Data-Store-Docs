---
uid: EgressExecutionDetails
---

# Egress execution details

After you configure an egress endpoint, data egress occurs periodically and independently from other endpoints based on its configuration .

**Note:** EDS can only egress streams with a single timeseries-based index.

EDS uses OMF messages to egress data, and knowing how those messages are constructed can help with understanding how data is egressed. OMF defines three types of messages: types, containers, and data. Types and containers define the data being egressed and data is the actual timeseries data. For EDS, types and containers are sent only on the first egress for an endpoint; subsequently, only new or changed types and containers are egressed. Types are created first; then containers are created based on types; and then, data is egressed to containers. If type creation fails with a `HttpStatusCode Conflict (403)`, EDS will still try to egress the related containers. Container creation must be successful for data to be egressed.

Type, container, and data items are batched into one or more OMF messages for egress. Per the requirements defined in the OMF specification, a single message cannot exceed 192KB in size. Compression is automatically applied to outbound egress messages. On the destination, failure to add a single item results in the message failing. In that case, Edge Data Store egresses each item individually, per type or stream (that is each type, each stream, all data for a single stream). Types, containers, and data will continue to be egressed as long as the destination continues to respond to HTTP requests - retrying previous failures as needed.

If egress fails due to HTTP exceptions, EDS will retry sending the request with a default backoff. If EDS receives a `Retry-After` header in the response from the endpoint, then the backoff is adjusted accordingly. If the message still fails to send after retries, EDS will either move onto the next message in the queue or wait for 5 minutes before retrying process again.

For data collection and egress, in-memory and on-disk storage are used to track the last successfully-egressed data event, per stream. Data is egressed in the order it is collected, and egress configurations can include future data.

**Note:** When an event with a future timestamp is successfully egressed, only values after the associated timestamp of that event will be egressed.
