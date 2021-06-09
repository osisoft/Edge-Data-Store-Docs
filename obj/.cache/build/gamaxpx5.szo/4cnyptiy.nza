<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Security </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Security ">
    <meta name="generator" content="docfx 2.50.0.0">
    
    <link rel="shortcut icon" href="../../favicon.ico">
    <link rel="stylesheet" href="../../styles/docfx.vendor.css">
    <link rel="stylesheet" href="../../styles/docfx.css">
    <link rel="stylesheet" href="../../styles/main.css">
    <meta property="docfx:navrel" content="../../toc.html">
    <meta property="docfx:tocrel" content="../toc.html">
    
    <meta property="docfx:rel" content="../../">
    
  </head>
  <body data-spy="scroll" data-target="#affix" data-offset="120">
    <div id="wrapper">
      <header>
        
        <nav id="autocollapse" class="navbar navbar-inverse ng-scope" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              
              <a class="navbar-brand" href="../../index.html">
                <img id="logo" class="svg" src="../../logo.svg" alt="">
              </a>
            </div>
            <div class="collapse navbar-collapse" id="navbar">
              <form class="navbar-form navbar-right" role="search" id="search">
                <div class="form-group">
                  <input type="text" class="form-control" id="search-query" placeholder="Search" autocomplete="off">
                </div>
              </form>
            </div>
          </div>
        </nav>
        
        <div class="subnav navbar navbar-default">
          <div class="container hide-when-search" id="breadcrumb">
            <ul class="breadcrumb">
              <li></li>
            </ul>
          </div>
        </div>
      </header>
      <div class="container body-content">
        
        <div id="search-results">
          <div class="search-list"></div>
          <div class="sr-items">
            <p><i class="glyphicon glyphicon-refresh index-loading"></i></p>
          </div>
          <ul id="pagination"></ul>
        </div>
      </div>
      <div role="main" class="container body-content hide-when-search">
        
        <div class="sidenav hide-when-search">
          <a class="btn toc-toggle collapse" data-toggle="collapse" href="#sidetoggle" aria-expanded="false" aria-controls="sidetoggle">Show / Hide Table of Contents</a>
          <div class="sidetoggle collapse" id="sidetoggle">
            <div id="sidetoc"></div>
          </div>
        </div>
        <div class="article row grid-right">
          <div class="col-md-10">
            <article class="content wrap" id="_content" data-uid="security1-0">
<h1 id="security" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="4" sourceendlinenumber="4">Security</h1>

<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="6" sourceendlinenumber="6">Consider the following when determining Edge Data Store security practices.</p>
<h2 id="rest-apis" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="8" sourceendlinenumber="8">REST APIs</h2>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="10" sourceendlinenumber="10">EDS supports REST APIs for configuration, data reading (through SDS), and data writing (through OMF and SDS). EDS provides only localhost access to REST APIs, which means any code that reads or writes to the REST APIs must reside on the computer or device on which EDS is running. </p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="12" sourceendlinenumber="12">REST access is through HTTP. The default port is 5590. The port number can be changed during installation, or during configuration after installation. URLs must be of the form http://<i></i>localhost:{port}/ or http://<i></i>127.0.0.1:{port}/. </p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="14" sourceendlinenumber="14"><strong>Note:</strong> Do not use the host&#39;s name or IP Address in the URL.</p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="16"><strong>Note:</strong> Docker users must use the &quot;host&quot; networking mode for the container. For information about using EDS with Docker, see <a class="xref" href="../Docker/EdgeDocker_1-0.html" data-raw-source="[Install Edge Data Store using Docker](xref:edgeDocker1-0)" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="16">Install Edge Data Store using Docker</a>.</p>
<h2 id="data-egress" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="18" sourceendlinenumber="18">Data egress</h2>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="20">Use HTTPS to write data to OSIsoft Cloud Services or OSIsoft PI Web API; writing to either of these destinations is not limited to the local machine.</p>
<h2 id="eds-adapters" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="22" sourceendlinenumber="22">EDS adapters</h2>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="24" sourceendlinenumber="24">The Modbus TCP EDS adapter and the OPC UA EDS adapter access remote data sources through binary protocols.</p>
<h2 id="secure-storage" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="26" sourceendlinenumber="26">Secure storage</h2>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="28" sourceendlinenumber="28">Sensitive information such as passwords and client secrets are saved in configuration files in an encrypted form. Only the EDS runtime can properly store and retrieve these protected data items. </p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="30" sourceendlinenumber="30"><strong>Note:</strong> Do not manually edit configuration files. Altering encrypted values will cause failures.</p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="32" sourceendlinenumber="32">Unencrypted values for sensitive information are only available when you provide them to the system through the REST API, such as with initial configuration or update. From that point forward, the unencrypted values are not available, either in the configuration files or through the REST API. The REST API will only return a placeholder string for such values.</p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="34" sourceendlinenumber="34">Use caution when submitting sensitive data items. For example, remove any temporary file containing unencrypted credentials used to submit configuration to the REST API from the system.</p>
<h2 id="service-and-file-system-security" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="36" sourceendlinenumber="36">Service and file system security</h2>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="38" sourceendlinenumber="38">The installer creates a specific user account that the Edge Data Store service runs under. This account is only used for running the service. For example, it cannot be used for interactive sessions. Do not configure this service account; modifying the service configuration in this respect could cause system failure.</p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="40" sourceendlinenumber="40">The EDS binary files, configuration files, and data files are configured by the installer and runtime to allow appropriate access by the service account. Do not modify the permission and ownership assignments for these files as failures could occur.</p>
<p sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="42" sourceendlinenumber="42">Consider a third party encryption-at-rest technique for your data storage. This security measure protects your data in the case the device storage is physically stolen, lost, or otherwise falls into the wrong hands.  On Linux, EDS is compatible with whole disk encryption systems such as <a href="https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup" data-raw-source="[LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup)" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="42" sourceendlinenumber="42">LUKS</a> or partial encryption systems such as <a href="https://en.wikipedia.org/wiki/ECryptfs" data-raw-source="[eCryptfs](https://en.wikipedia.org/wiki/ECryptfs)" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="42" sourceendlinenumber="42">eCryptfs</a>. On Windows, EDS is compatible with whole disk encryption solutions such as <a href="https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc732774(v=ws.11)" data-raw-source="[BitLocker](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc732774(v=ws.11))" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="42" sourceendlinenumber="42">BitLocker</a> and <a href="https://docs.microsoft.com/en-us/previous-versions/tn-archive/cc700811(v=technet.10)" data-raw-source="[Windows EFS](https://docs.microsoft.com/en-us/previous-versions/tn-archive/cc700811(v=technet.10))" sourcefile="V1/Security/SecurityOverview_1-0.md" sourcestartlinenumber="42" sourceendlinenumber="42">Windows EFS</a>.</p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/Security/SecurityOverview_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
                  </li>
                </ul>
              </div>
              <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix" id="affix">
              <!-- <p><a class="back-to-top" href="#top">Back to top</a><p> -->
              </nav>
            </div>
          </div>
        </div>
      </div>
      
      <footer>
        <div class="grad-bottom"></div>
        <div class="footer">
          <div class="container">
            <span class="pull-right">
              <a href="#top">Back to top</a>
            </span>
            
            <span>Generated by <strong>DocFX</strong></span>
          </div>
        </div>
      </footer>
    </div>
    
    <script type="text/javascript" src="../../styles/docfx.vendor.js"></script>
    <script type="text/javascript" src="../../styles/docfx.js"></script>
    <script type="text/javascript" src="../../styles/main.js"></script>
  </body>
</html>
