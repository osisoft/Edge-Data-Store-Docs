---
uid: SystemConfiguration
---

# System components

Edge Data Store uses JSON configuration files in a protected directory on Windows and Linux to store configuration information that is read on startup. While the files are accessible to view, we recommend that you use REST or the EdgeCmd command line tool to make any changes to the files.

As part of making Edge Data Store as secure as possible, any passwords or secrets are stored in encrypted form with cryptographic key material stored separately in a secure location. Editing the files directly may cause unexpected behavior.

**Note:** Use REST to edit any single component or facet of the system or configure the system as a whole with a single REST call.
