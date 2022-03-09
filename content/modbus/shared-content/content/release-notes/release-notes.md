---
uid: ReleaseNotes
---

# Release notes

[!include[produce-name](../main/shared-content/_includes/inline/product-name.md)] [!include[symantic-version](../main/shared-content/_includes/inline/symantic-version.md)]<br>
Adapter framework [!include[framework-version](../main/shared-content/_includes/inline/framework-version.md)]

## Overview

PI Adapter for Modbus TCP collects time series data and relevant metadata from Modbus TCP devices and sends it to configured OMF endpoints such as PI Web API and OSIsoft Cloud Services. PI Adapter for Modbus TCP can also collect health and diagnostics information. It supports buffering, polled data collection, and various Windows and Linux-based operating systems as well as containerization.

For more information see [PI Adapter for Modbus TCP overview](xref:PIAdapterForModbusTCPOverview).

## Fixes and enhancements

### Fixes

The following issues reported from version 1.2 are fixed in this release.

- The adapter hangs and fails to shut down properly when data collection is very fast
- The adapter intermittently connects to data source and only sends/receives one request/response
- The adapter may stop collecting data due to a race condition.

### Enhancements

There are no enhancements added in this release.

## Known issues

There are no known issues at this time.

## Setup

### System requirements

Refer to [System requirements](xref:SystemRequirements).

### Installation and upgrade

Refer to [Install the adapter](xref:InstallTheAdapter).

### Uninstallation

Refer to [Uninstall the adapter](xref:UninstallTheAdapter).

## Security information and guidance

### OSIsoft's commitment

Because the PI System often serves as a barrier protecting control system networks and mission-critical infrastructure assets, OSIsoft is committed to (1) delivering a high-quality product and (2) communicating clearly what security issues have been addressed. This release of PI Adapter for Modbus TCP is the highest quality and most secure version of the PI Adapter for Modbus TCP released to date. OSIsoft's commitment to improving the PI System is ongoing, and each future version should raise the quality and security bar even further.

### Vulnerability communication

The practice of publicly disclosing internally discovered vulnerabilities is consistent with the [Common Industrial Control System Vulnerability Disclosure Framework](https://ics-cert.us-cert.gov/sites/default/files/ICSJWG-Archive/ICSJWG_Vulnerability_Disclosure_Framework_Final_1.pdf) developed by the [Industrial Control Systems Joint Working Group (ICSJWG)](https://ics-cert.us-cert.gov/Industrial-Control-Systems-Joint-Working-Group-ICSJWG). Despite the increased risk posed by greater transparency, OSIsoft is sharing this information to help you make an informed decision about when to upgrade to ensure your PI System has the best available protection.

For more information, refer to [OSIsoft's Ethical Disclosure Policy (https://www.osisoft.com/ethical-disclosure-policy)](https://www.osisoft.com/ethical-disclosure-policy).

To report a security vulnerability, refer to [OSIsoft's Report a Security Vulnerability (https://www.osisoft.com/report-a-security-vulnerability)](https://www.osisoft.com/report-a-security-vulnerability).

### Vulnerability scoring

OSIsoft has selected the [Common Vulnerability Scoring System (CVSS)](https://www.first.org/cvss/v2/guide) to quantify the severity of security vulnerabilities for disclosure. To calculate the CVSS scores, OSIsoft uses the [National Vulnerability Database (NVD) calculator](https://nvd.nist.gov/cvss.cfm?calculator&amp;version=2) maintained by the National Institute of Standards and Technology (NIST).  OSIsoft uses Critical, High, Medium and Low categories to aggregate the CVSS Base scores. This removes some of the opinion-related errors of CVSS scoring.  As noted in the [CVSS specification](https://www.first.org/cvss/specification-document), Base scores range from 0 for the lowest severity to 10 for the highest severity.

### Overview of new vulnerabilities found or fixed

This section is intended to provide relevant security-related information to guide your installation or upgrade decision. OSIsoft is proactively disclosing aggregate information about the number and severity of PI Adapter for Modbus TCP security vulnerabilities that are fixed in this release.

No security-related information is applicable to this release.

## Documentation overview

**EdgeCmd utility:** Provides an overview on how to configure and administer PI adapters on Linux and Windows using command line arguments.

## Technical support and resources

Refer to [Technical support and feedback](xref:TechnicalSupportAndFeedback).
