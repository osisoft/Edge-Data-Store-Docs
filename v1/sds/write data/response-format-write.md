---
uid: ResponseFormatWriteAPIs
---

# Response format for write APIs

The format of the response is specified in the API call. For write APIs, the supported response formats are:

 - JSON - The default response format for SDS, which is used in all examples in this documentation. Default JSON responses do not include any values that are equal to the default value for their type.

 - Verbose JSON - Verbose has no impact on writes because writes return only error messages. To specify verbose JSON return, add the header ``Accept-Verbosity`` with a value of ``verbose`` to the request.

 - SDS - To specify SDS format, set the ``Accept`` header in the request to ``application/sds``.
