---
uid: EdgeDataStoreAdministration
---

# Edge Data Store administration TEST

Edge Data Store provides a number of administration level functions.

## Reset Edge Data Store

Edge Data Store provides a method of performing a complete reset of the product. When you perform a reset, all event data and Edge Data Store configuration is deleted, and the product is restarted.

**Note:** All configuration and stored data will be lost as a result of performing this action.

To reset Edge Data Store, use any REST client and make a request using the following:

```http
Method: POST
Endpoint: http://localhost:5590/api/v1/administration/System/Reset
Header: Content-Type application/json
```

Example using cURL:

```bash
curl -v -d "" -X POST http://localhost:5590/api/v1/Administration/System/Reset
```

An HTTP status 204 message indicates success.

## Reset the Edge Storage component

Edge Data Store provides a method by which you can delete and reset all event and configuration data related to the Edge Data Store component, after which the product will be restarted.

To reset the Storage component, use any REST client and make a request using the following:

```http
Method: POST
Endpoint: http://localhost:5590/api/v1/administration/Storage/Reset
Header: Content-Type application/json
```

Example using cURL:

```bash
curl -v -d "" -X POST http://localhost:5590/api/v1/Administration/Storage/Reset
```

An HTTP status 204 message indicates success.

## Stop and start an Edge Data Store adapter

Edge Data Store provides the ability to stop and start EDS adapters. By default, when Edge Data Store starts, all currently configured EDS adapters are started and remain running until the product shuts down.

### Stop an EDS adapter

To stop an individual EDS adapter, use any REST client and make a request using the following:

```http
Method: POST
Endpoint: http://localhost:5590/api/v1/administration/EDS adapterId/Stop
Header: Content-Type application/json
```

Example using cURL:

```bash
curl -v -d "" -X POST http://localhost:5590/api/v1/Administration/EDS adapterId/Stop
```

**Note:** Replace _EDS adapterId_ with the id of the EDS adapter you want to stop.

An HTTP status 204 message indicates success.

### Start an EDS adapter

To start an individual EDS adapter, use any REST client and make a request using the following:

```http
Method: POST
Endpoint: http://localhost:5590/api/v1/administration/EDS adapterId/Start
Header: Content-Type application/json
```

Example using cURL:

```bash
curl -v -d "" -X POST http://localhost:5590/api/v1/Administration/EDS adapterId/Start
```

**Note:** Replace _EDS adapterId_ with the id of the EDS adapter you want to start.

An HTTP status 204 message indicates success. 
