---
uid: StopAndStartAnEDSAdapter
---

# Stop and start an EDS adapter

Edge Data Store provides the ability to stop and start EDS adapters. By default, when Edge Data Store starts, all currently configured EDS adapters are started and remain running until the product shuts down.

## Stop an EDS adapter

- To stop an individual EDS adapter, use any REST client and make a request using the following:

    ```http
    Method: POST
    Endpoint: http://localhost:5590/api/v1/administration/EDS adapterId/Stop
    Header: Content-Type application/json
    ```

    Example using cURL:

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/EDS adapterId/Stop
    ```

    **Note:** Replace _EDS adapterId_ with the id of the EDS adapter you want to stop.

    An HTTP status 204 message indicates success.

## Start an EDS adapter

- To start an individual EDS adapter, use any REST client and make a request using the following:

    ```http
    Method: POST
    Endpoint: http://localhost:5590/api/v1/administration/EDS adapterId/Start
    Header: Content-Type application/json
    ```

    Example using cURL:

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/EDS adapterId/Start
    ```

    **Note:** Replace _EDS adapterId_ with the id of the EDS adapter you want to start.

    An HTTP status 204 message indicates success.
