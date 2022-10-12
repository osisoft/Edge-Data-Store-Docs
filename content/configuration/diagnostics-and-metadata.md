
---
uid: GeneralConfiguration
---

copied from here  with few edits: https://github.com/osisoft/PI-Adapter/blob/main/shared-content/configuration/diagnostics-and-metadata.md

# Diagnostics and metadata

You can configure Edge Data Store's components to produce and store diagnostics data at a designated health endpoint, and to send metadata for created streams.
Edge Data Store's specific metadata will continue to be sent to Edge Data Store regardless of whether EnableDiagnostics is Enabled or its MetadataLevel. This only affects data sent to health endpoints.
For more information about available diagnostics data, see [Edge Data Store diagnostics](xref:EdgeDataStoreDiagnostics).

## Configure general

1. Start any of the [Configuration tools](xref:ConfigurationTools) capable of making HTTP requests.
2. Run a `PUT` command to the following endpoint, setting `EnableDiagnostics` to either `true` or `false`, `MetadataLevel` to `None`, `Low`, `Medium`, or `High` and `HealthPrefix` to a string or `null`: `http://localhost:5590/api/v1/configuration/system/general`

   **Note:** `5590` is the default port number. If you selected a different port number, replace it with that value.

   Example using `curl`:

   ```bash
   curl -d "{ \"EnableDiagnostics\":true, \"MetadataLevel\":Medium, \"HealthPrefix\":\"Machine1\" }" -X PUT "http://localhost:5590/api/v1/configuration/system/general"
   ```

## General schema

The full schema definition for the general configuration is in the `System_General_schema.json` file located in one of the following folders:

Windows: `%ProgramFiles%\OSIsoft\Adapters\<AdapterName>\Schemas`

Linux: `/opt/OSIsoft/Adapters/<AdapterName>/Schemas`

## General parameters

The following parameters are available for configuring general:

| Parameter             | Required | Type    | Description |
| ---------             | -------- | ------- | ----------- |
| **EnableDiagnostics** | Optional | `boolean` | Determines if diagnostics are enabled<br><br>Allowed value: `true` or `false`<br>Default value: `true`<br>|
| **MetadataLevel** | Optional | `reference` | Defines amount of metadata sent to OMF endpoints.<br><br> Allowed value: `None`, `Low`, `Medium`, and `High`<br> Default value: `Medium`|
| **HealthPrefix** | Optional | `reference` | Prefix to use for health and diagnostics stream and asset IDs.<br> Default value: `null`|

## Example

### Retrieve the general configuration

Example using `curl`:

```bash
curl -X GET "http://localhost:{port}/api/v1/configuration/system/general"
```

Sample output:

```code
{
  "EnableDiagnostics": true,
  "MetadataLevel": "Medium",
  "HealthPrefix": "Machine1"
}
```

## REST URLs

| Relative URL                            | HTTP verb | Action                                          |
| --------------------------------------- | --------- | ----------------------------------------------- |
| api/v1/configuration/system/General  | GET       | Gets the general configuration             |
| api/v1/configuration/system/General  | PUT       | Replaces the existing general configuration |
| api/v1/configuration/system/General  | PATCH       | Allows partial updating of general configuration
