---
uid: ResetEdgeDataStore
---

# Reset Edge Data Store

Edge Data Store provides a method of performing a complete reset of the product. When you perform a reset, all event data and Edge Data Store configuration is deleted, and the product is restarted.

> **Note:** All configuration and stored data will be lost as a result of performing this action.

- To reset Edge Data Store, use any REST client and make a request using the following:

  ```http
  Method: POST
  Endpoint: http://localhost:5590/api/v1/administration/System/Reset
  Header: Content-Type application/json
  ```

  Example using cURL:

  ```bash
  curl -v -d "" http://localhost:5590/api/v1/Administration/System/Reset
  ```

  An HTTP status 204 message indicates success.
