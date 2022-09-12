---
uid: StopAndStartAnEDSAdapter
---

# Stop and start an EDS adapter

By default, when Edge Data Store starts, all currently configured EDS adapter instance are started and remain running until the product shuts down.

## Stop an EDS adapter

To stop an EDS adapter instance:

1. Open a tool capable of making HTTP requests.

1. Run a POST command to the following endpoint, replacing `<adapterId>` with the adapter instance to stop and `<port_number>` with the port specified for EDS:

    ```http
    http://localhost:<port_number>/api/v1/administration/<adapterId>/Stop
    ```

    Example **Stop the OpcUa1 adapter** using curl or EdgeCmd and the default port:

    ## [curl](#tab/tabid-1)
    
    ```bash
    curl -d "" http://localhost:5590/api/v1/Administration/OpcUa1/Stop
    ```
        
    ## [EdgeCmd](#tab/tabid-2)
    
    Tab content-2-1.
    ***

    An HTTP status 204 message indicates success.

## Start an EDS adapter

To start an EDS adapter instance:

1. Open a tool capable of making HTTP requests.

1. Run a POST command to the following endpoint, replacing `<adapterId>` with the adapter instance to start and `<port_number>` with the port specified for EDS:

    ```http
    http://localhost:<port_number>/api/v1/administration/<adapterId>/Start
    ```

    Example **Stop the Modbus1 adapter** using curl or EdgeCmd and the default port:

    ## [curl](#tab/tabid-1)
    
    ```bash
    curl -d "" http://localhost:5590/api/v1/Administration/Modbus1/Start
    ```
    
    ## [EdgeCmd](#tab/tabid-2)
    
    Tab content-2-1.
    ***

    An HTTP status 204 message indicates success.
