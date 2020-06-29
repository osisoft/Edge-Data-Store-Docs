<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Adapter security </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Adapter security ">
    <meta name="generator" content="docfx 2.43.2.0">
    
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
              <a class="navbar-brand" href="../../V1/index.html" width="46">
                <img id="logo" src="../../V1/images/atlas_icon.png" height="46" width="46" alt="OSIsoft Edge Data Store"> 
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
            <article class="content wrap" id="_content" data-uid="OPCUAAdapterSecurityConfiguration1-0">
<h1 id="adapter-security" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Adapter security</h1>

<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">The OPC UA security standard is concerned with the authentication of client and server applications, the authentication of users, and confidentiality of their communication. As the security model relies heavily on Transport Level Security (TLS) to establish a secure communication link with an OPC UA server, each client, including the OPC UA EDS adapter, must have a digital certificate deployed and configured. Certificates uniquely identify client applications and machines on servers, and allow for creation of a secure communication link when trusted on both sides.</p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">The OPC UA EDS adapter instance generates a self-signed certificate when the first secure connection attempt is made. Each OPC UA EDS adapter instance creates a certificate store to persist both its own certificates and those received from the server.</p>
<h2 id="configure-opc-ua-eds-adapter-security" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">Configure OPC UA EDS adapter security</h2>
<ol sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="37">
<li sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="19"><p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">In the data source configuration, set <code>UseSecureConnection</code> to <strong>true</strong>. For more information, see <a class="xref" href="OPCUADataSourceConfiguration_1-0.html" data-raw-source="[Data source configuration](xref:OPCUADataSourceConfiguration1-0)" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">Data source configuration</a>.</p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">The adapter instance verifies whether the server certificate is present in the <a href="#adapter-trusted-certificates" data-raw-source="[adapter trusted certificates](#adapter-trusted-certificates)" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">adapter trusted certificates</a> folder and is therefore trusted. If the certificates were not exchanged before the first attempted connection, the adapter instance saves the server certificate within the <a href="#adapter-rejected-certificates" data-raw-source="[adapter rejected certificates](#adapter-rejected-certificates)" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">adapter rejected certificates</a> folder and returns the following warning message about the rejected server certificate:</p>
<pre sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="19"><code class="lang-bash">~~2019-09-08 11:45:48.093 +01:00~~ [Warning] Rejected Certificate: &quot;DC=MyServer.MyDomain.int, O=Prosys OPC, CN=Simulation
</code></pre></li>
<li sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="21" sourceendlinenumber="31"><p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="21" sourceendlinenumber="21">Manually move the server certificate from the RejectedCertificates\certs folder to the Trusted\certs folder using a file explorer or command-line interpreter.</p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="23" sourceendlinenumber="23">Linux example using command-line:</p>
<pre sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="25" sourceendlinenumber="27"><code class="lang-bash">mv /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/RejectedCertificates/certs/SimulationServer\ \[F9823DCF607063DBCECCF6F8F39FD2584F46AEBB\].der /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/Trusted/certs/
</code></pre><p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="29" sourceendlinenumber="29"><strong>Note:</strong> Administrator or root privileges are required to perform this operation.</p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="31" sourceendlinenumber="31">Once the certificate is in the adapter instance trusted certificates folder, the adapter instance trusts the server and the connection attempt makes the connection call to the configured server.</p>
</li>
<li sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="37"><p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="33">Add the adapter certificate to the server&#39;s trust store.</p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="35" sourceendlinenumber="35">The connection succeeds only when the adapter certificate is trusted on the server side. For more details on how to make a client certificate trusted, see your OPC UA server documentation. In general, OPC UA servers work in a similar fashion as the clients, a similar approach may work to make the server certificate trusted on the client side.</p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="37" sourceendlinenumber="37">When certificates are mutually trusted, the connection attempt succeeds and the adapter instance is connected to the most secure endpoint provided by the server.</p>
</li>
</ol>
<h3 id="certificate-locations" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="39" sourceendlinenumber="39">Certificate locations</h3>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="41" sourceendlinenumber="41">For all of the following locations, {ComponentID} identifies the adapter instance.</p>
<h4 id="adapter-rejected-certificates" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="43" sourceendlinenumber="43">Adapter rejected certificates</h4>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="45" sourceendlinenumber="45">Windows: <code>%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\RejectedCertificates\certs</code></p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="47" sourceendlinenumber="47">Linux: <code>/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/RejectedCertificates/certs</code></p>
<h4 id="adapter-trusted-certificates" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="50" sourceendlinenumber="50">Adapter trusted certificates</h4>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="52" sourceendlinenumber="52">Windows: <code>%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\Trusted\certs</code></p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="54" sourceendlinenumber="54">Linux: <code>/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/Trusted/certs</code></p>
<h4 id="adapters-certificate" sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="57" sourceendlinenumber="57">Adapter&#39;s certificate</h4>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="59" sourceendlinenumber="59">Windows: <code>%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\My\certs</code></p>
<p sourcefile="V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md" sourcestartlinenumber="61" sourceendlinenumber="61">Linux: <code>/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/My/certs</code></p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/OpcUa/OPCUAAdapterSecurityConfiguration_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
            
            <span>© 2020 - OSIsoft, LLC.</span>
          </div>
        </div>
      </footer>
    </div>
    
    <script type="text/javascript" src="../../styles/docfx.vendor.js"></script>
    <script type="text/javascript" src="../../styles/docfx.js"></script>
    <script type="text/javascript" src="../../styles/main.js"></script>
  </body>
</html>
