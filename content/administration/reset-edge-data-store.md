---
uid: ResetEdgeDataStore
---

# Reset Edge Data Store

When applied at the system level, the Reset command deletes all event and configuration data and restarts Edge Data Store.

**Note:** All configuration and stored data will be lost as a result of performing this action.

To reset EDS, follow these steps:

1. Start any tool capable of making HTTP requests.

1. Execute a POST command to the following endpoint, replacing `<port_number>` with the port specified for EDS:

  ```http
  http://localhost:<port_number>/api/v1/administration/System/Reset
  ```

  Example using curl and the default port:

  ```bash
  curl -d "" http://localhost:5590/api/v1/Administration/System/Reset
  ```

  An HTTP status 204 message indicates success.
