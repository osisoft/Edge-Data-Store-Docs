---
uid: sdsCompression
---

# Compression

To more efficiently utilize network bandwidth, the EDS Sequential Data Store supports compression for reading data and writing data through the REST API.

## Supported compression schemes

the EDS Sequential Data Store supports the following compression schemes:

- `gzip`

- `deflate`

## Request compression (write data)

Specify the compression scheme in the **Content-Encoding** HTTP header of compressed-content requests. This header provides context to the API to properly decode the request content.

## Response compression (read data)

Request compressed responses from the REST API by specifying one of the supported compression schemes using the **Accept-Encoding** HTTP header. Compressed responses from the REST API include a **Content-Encoding** HTTP header indicating the compression scheme used to compress the response content.

**Note:** Specifying a compression scheme with the **Accept-Encoding** HTTP header does not guarantee a compressed response. Always refer to presence and value of the **Content-Encoding** HTTP header of the response to properly decode the response content.
