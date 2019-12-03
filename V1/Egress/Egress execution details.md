---
uid: Egress execution details
---

# Egress execution details

After you add configuration for an egress endpoint, egress execution will periodically occur for that endpoint. Egress is handled individually per configured endpoint. Only the first execution types and containers will be egressed; subsequently only new or changed types/containers will be egressed. **Only streams with a single, timeseries-based index can be egressed**. Type creation must be successful in order to perform container creation; likewise container creation must be successful in order to perform data egress.

Type, container and data items are batched into one or more OMF messages when egressing. Per the requirements defined in OMF, a single message will not exceed 192KB in size. Compression is automatically applied to outbound egress messages. On the destination, failure to add a single item will result in the message failing. In that case the Edge Data Store will fall back to egressing each item individually, per type or stream (that is each type, each stream, all data for a single stream). Types, containers, and data will continue to be egressed as long as the destination continues to respond to HTTP requests - retrying previous failures as needed.

Certain HTTP failures during egress will result in a retry. The Edge Data Store will retry an HTTP request a maximum of five times with exponentially increasing delays between each request. The total time waiting and retrying is currently set at 1 minute. During that time egress of other messages will be delayed. List of retryable occurrences:

- TimeoutException
- HttpRequestException
- HttpStatusCode RequestTimeout (408)
- HttpStatusCode BadGateway (502)
- HttpStatusCode ServiceUnavailable (503)
- HttpStatusCode GatewayTimeout (504)

For data collection and egress, in-memory and on-disk storage are used to track the last successfully-egressed data event, per stream. Data is egressed in order and includes future events.

> **Note**  When an event with a future timestamp is successfully egressed, only values after the associated timestamp of that event will be egressed.
