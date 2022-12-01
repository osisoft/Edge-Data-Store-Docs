---
uid: SystemComponentsConfiguration
---

# System components configuration

Edge Data Store components are Modbus TCP EDS adapter, OPC UA EDS adapter, and the Storage component. These components are only active if they are configured for the system to use them. EDS itself needs only a small amount of configuration - the list of components and the HTTP Port used for REST calls.

The default _System_Components.json_ file for the System component contains the following information:

```json
[
  {
    "ComponentId": "Storage",
    "ComponentType": "Storage"
  }
]
```

The Storage component is required for Edge Data Store to run and only one Storage component instance is supported. Each Modbus device needs a separate Modbus TCP EDS adapter component instance to connect to EDS, and each OPC UA device needs a separate OPC UA EDS adapter component instance to connect to EDS. Multiple Modbus TCP EDS adapter component instances and the OPC UA EDS adapter component instances are supported.  

## Add system components

To add system components:

1. Using any text editor, create a JSON file with a `ComponentId` and `ComponentType`. The following example adds a Modbus TCP EDS adapter instance.

  ```json
    {
      "ComponentId": "Modbus1",
      "ComponentType": "Modbus"
    }
  ```

  **Note:** The `ComponentId` must be a unique value. This example uses the `ComponentId` "Modbus1," since it is the first Modbus TCP EDS adapter.

1. Save the JSON file with the name `AddComponent.json`.

1. From the same directory where the file exists, run the following curl script or EdgeCmd:

  ### [curl](#tab/tabid-1)

  ```bash
  curl -d "@AddComponent.json" -H "Content-Type: application/json" http://localhost:5590/api/v1/configuration/system/components
  ```

  ### [EdgeCmd](#tab/tabid-2)

  ```
  edgecmd add components -type Modbus -id Modbus1
  ```
  ***

After the command completes successfully, the new component is available for configuration and use.

## Parameters for system components

The following parameters are used to define system components.

| Parameters     | Required | Type    | Nullable | Description |
| -------------- | -------- | --------| ---------|-------------|
| **ComponentId**    | Required |`string` | Yes      | The unique ID of the component instance. It can be any alphanumeric string, for example Storage.|
| **ComponentType**  | Required |`string` | Yes      | The type of the component, for example `Storage`. There are three types of components: Storage identified by `Storage`, OPC UA EDS Adapter identified by `OpcUa`, and Modbus TCP EDS Adapter identified by `Modbus`. |

## System components example

```json
[
  {
    "componentId": "OpcUa1",
    "componentType": "OpcUa"
    },
    {
      "componentId": "Modbus1",
      "componentType": "Modbus"
    },
    {
      "componentId": "Storage",
      "componentType": "Storage"
   }
]
```
