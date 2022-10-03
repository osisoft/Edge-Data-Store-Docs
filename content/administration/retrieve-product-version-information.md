---
uid: RetrieveProductVersionInformation
---

# Retrieve product version information

The product version information includes the Edge Data Store application version, the adapter framework version, the .NET runtime version, and the operating system. This information can be useful for troubleshooting purposes.

To retrieve the product version information of EDS:

1. Open a tool capable of making HTTP requests.

1. Run a GET command to the following endpoint, replacing `<port_number>` with the port specified for EDS:

  ```http
  http://localhost:<port_number>/api/v1/diagnostics/productinformation
  ```

   Example using curl and the default port number:

   ```bash
   curl -v http://localhost:5590/api/v1/Diagnostics/ProductInformation
   ```
   
   Example Response
   ```json
   {
    "Product Name": "Edge Data Store",
    "Product Version": "1.1.1.46",
    "Adapter Framework Version": "1.6.0.24",
    "Runtime Version": ".NET 6.0.9",
    "Operating System": "Microsoft Windows 10.0.19044"
   }
   ```
