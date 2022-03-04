---
uid: ResponseFormat
---

# Response format

The format of the response is specified in the API call. For read APIs, the supported response formats are:

- JSON - the default response format for SDS, which is used in all examples in this documentation. Default JSON responses do not include any values that are equal to the default value for their type.

 - Verbose JSON - responses include all values, including defaults, in the returned JSON payload. To specify verbose JSON return, add the header `Accept-Verbosity` with a value of `verbose` to the request.  

- SDS - specified by setting the `Accept` header in the request to `application/sds`.