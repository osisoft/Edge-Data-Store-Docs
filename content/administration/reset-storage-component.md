---
uid: ResetTheStorageComponent
---

# Reset the Storage component

When applied at the storage component level, the Reset command deletes all event and configuration data related to the Storage component and restarts Edge Data Store.

To reset the Storage component:

1. Open a tool capable of making HTTP requests.

1. Run a POST command to the following endpoint, replacing `<port_number>` with the port specified for EDS:

    ```http
    http://localhost:<port_number>/api/v1/administration/Storage/Reset
    ```

    Example using curl or EdgeCmd and the default port:

    ## [curl](#tab/tabid-1)
    
    ```bash
    curl -d "" http://localhost:5590/api/v1/Administration/Storage/Reset
    ```
    
    ## [EdgeCmd](#tab/tabid-2)
    
    edgecmd storage reset
    ***
    
    An HTTP status 204 message indicates success.
