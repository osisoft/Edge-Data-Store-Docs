<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Operational overview </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Operational overview ">
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
            <article class="content wrap" id="_content" data-uid="PrinciplesOfOperationOPCUA1-0">
<h1 id="operational-overview" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Operational overview</h1>

<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">The OPC UA EDS adapter conforms to the OPC UA specification for operation. Once an instance of the adapter is defined in the system components configuration, it must be configured for it to create streams and collect data.</p>
<h2 id="adapter-configuration" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">Adapter configuration</h2>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">For an OPC UA EDS adapter instance to start data collection, configure the adapter by defining the following:</p>
<ul sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="15">
<li sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">Data source: Provide the connection information for the OPC UA data source.</li>
<li sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="14" sourceendlinenumber="14">Data selection: Specify the OPC UA items to which the adapter instance should subscribe for data.</li>
<li sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">Logging: Set up the logging behavior for the adapter instance.</li>
</ul>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="17">For more information, see <a class="xref" href="OPCUADataSourceConfiguration_1-0.html" data-raw-source="[Data source configuration](xref:OPCUADataSourceConfiguration1-0)" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="17">Data source configuration</a> and <a class="xref" href="OPCUADataSelectionConfiguration_1-0.html" data-raw-source="[Data selection configuration](xref:OPCUADataSelectionConfiguration1-0)" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="17">Data selection configuration</a>. For more information on how to configure logging, see <a class="xref" href="../Logging/ComponentLogging_1-0.html" data-raw-source="[Component-level logging configuration](xref:ComponentLoggingConfiguration1-0)" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="17">Component-level logging configuration</a>.</p>
<h2 id="connection" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="19" sourceendlinenumber="19">Connection</h2>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="21" sourceendlinenumber="21">The OPC UA EDS adapter uses the binary opc.tcp protocol to communicate with the OPC UA servers. A secured connection is enabled by default where the X.509-type client and server certificates are exchanged and verified and the connection between the OPC UA EDS adapter and the configured OPC UA server is established.</p>
<h2 id="stream-creation" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="23" sourceendlinenumber="23">Stream creation</h2>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="25" sourceendlinenumber="25">The OPC UA EDS adapter creates types upon receiving the value update for a stream. One stream is created in Edge Data Store for every selected OPC UA item in the data selection configuration.</p>
<h2 id="data-collection" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="27" sourceendlinenumber="27">Data collection</h2>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="29" sourceendlinenumber="29">The OPC UA EDS adapter collects time-series data from selected OPC UA dynamic variables through OPC UA subscriptions (unsolicited reads). The adapter supports the Data Access (DA) part of OPC UA specification.</p>
<h2 id="stream-properties" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="31" sourceendlinenumber="31">Stream properties</h2>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="33">The OPC UA EDS adapter creates a stream with two properties per selected OPC UA item. The properties are described in the following table:</p>
<table sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="35" sourceendlinenumber="38">
<thead>
<tr>
<th>Property name</th>
<th>Data type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Timestamp</td>
<td>DateTime</td>
<td>Timestamp of the given OPC UA item value update.</td>
</tr>
<tr>
<td>Value</td>
<td>Based on type of incoming OPC UA value</td>
<td>Value of the given OPC UA item update.</td>
</tr>
</tbody>
</table>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="40" sourceendlinenumber="40">Stream ID is a unique identifier for each stream created by the adapter for a given OPC UA item. If the Custom Stream ID is specified for the OPC UA item in data selection configuration, the OPC UA EDS adapter uses that as a stream ID for the stream. Otherwise, the adapter constructs the stream ID using the following format constructed from the OPC UA item node ID:</p>
<pre sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="42" sourceendlinenumber="44"><code>&lt;Adapter Component ID&gt;.&lt;Namespace&gt;.&lt;Identifier&gt;
</code></pre><p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="46" sourceendlinenumber="46"><strong>Note:</strong> The naming convention is affected by StreamIdPrefix and ApplyPrefixToStreamID settings in data source configuration. For more information, see <a class="xref" href="OPCUADataSourceConfiguration_1-0.html" data-raw-source="[Data source configuration](xref:OPCUADataSourceConfiguration1-0)" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="46" sourceendlinenumber="46">Data source configuration</a>.</p>
<h2 id="export-operation" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="48" sourceendlinenumber="48">Export operation</h2>
<p sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="50" sourceendlinenumber="50">The OPC UA EDS adapter is able to export available OPC UA dynamic variables by browsing the OPC UA hierarchies or sub-hierarchies as part of the data source configuration process. For more information, see <a class="xref" href="OPCUADataSourceConfiguration_1-0.html" data-raw-source="[Data source configuration](xref:OPCUADataSourceConfiguration1-0)" sourcefile="V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md" sourcestartlinenumber="50" sourceendlinenumber="50">Data source configuration</a>.</p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/OpcUa/PrinciplesOfOperationOPCUA_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
