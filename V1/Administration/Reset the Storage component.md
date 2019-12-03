---
uid: ResetTheStorageComponent
---

# Reset the Storage component

Edge Data Store provides a method by which you can delete and reset all event and configuration data related to the Edge Data Store component, after which the product will be restarted.

- To reset the Storage component, use any REST client and make a request using the following:

    ```http
    Method: POST
    Endpoint: http://localhost:5590/api/v1/administration/Storage/Reset
    Header: Content-Type application/json
    ```

    Example using cURL:

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/Storage/Reset
    ```

    An HTTP status 204 message indicates success.
