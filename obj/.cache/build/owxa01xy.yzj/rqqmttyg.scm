<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Edge Data Store configuration </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Edge Data Store configuration ">
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
            <article class="content wrap" id="_content" data-uid="EdgeDataStoreConfiguration1-0">
<h1 id="edge-data-store-configuration" sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Edge Data Store configuration</h1>

<p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">Edge Data Store requires configuration, which can be performed either for each individual component or for the system as a whole. Use the following procedures to configure Edge Data Store as a whole system with either a minimum or a maximum configuration. </p>
<h2 id="configure-minimum-edge-data-store" sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">Configure minimum Edge Data Store</h2>
<p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">The following JSON file represents minimal configuration of an Edge Data Store. There are no Modbus TCP EDS adapter or OPC UA EDS adapter components, and the Storage component configurations are set to the default. If you configure a system with this JSON file, any existing Modbus TCP EDS adapter or OPC UA EDS adapter components will be disabled and removed. No storage data will be deleted or modified, and OMF and SDS data access will not be impacted.</p>
<ol sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="58">
<li sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">Save or copy the example JSON in a file named <em>EdgeMinimumConfiguration.json</em> in any directory on a device with Edge Data Store installed.</li>
<li sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="14" sourceendlinenumber="58"><p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="14" sourceendlinenumber="14">Run the following curl command from the directory where the file is located: </p>
<pre sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="18"><code class="lang-bash">curl -i -d &quot;@EdgeMinimumConfiguration.json&quot; -H &quot;Content-Type: application/json&quot; -X PUT http://localhost:5590/api/v1/configuration
</code></pre><p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="20">The following will be set as the configuration of a running Edge Data Store. The configuration takes effect immediately after the command completes.</p>
<pre sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="22" sourceendlinenumber="58"><code class="lang-json">{
 &quot;Storage&quot;: {
   &quot;PeriodicEgressEndpoints&quot;: [],
   &quot;Runtime&quot;: {
     &quot;streamStorageLimitMb&quot;: 2,
     &quot;streamStorageTargetMb&quot;: 1,
     &quot;ingressDebugExpiration&quot;: &quot;0001-01-01T00:00:00&quot;,
     &quot;checkpointRateInSec&quot;: 30,
     &quot;transactionLogLimitMB&quot;: 250,
     &quot;enableTransactionLog&quot;: true
   },
   &quot;Logging&quot;: {
     &quot;logLevel&quot;: &quot;Information&quot;,
     &quot;logFileSizeLimitBytes&quot;: 34636833,
     &quot;logFileCountLimit&quot;: 31
   }
 },
 &quot;System&quot;: {
   &quot;Logging&quot;: {
     &quot;logLevel&quot;: &quot;Information&quot;,
     &quot;logFileSizeLimitBytes&quot;: 34636833,
     &quot;logFileCountLimit&quot;: 31
   },
   &quot;HealthEndpoints&quot;: [],
   &quot;Port&quot;: {
     &quot;port&quot;: 5590
   },
   &quot;Components&quot;: [
     {
       &quot;componentId&quot;: &quot;Storage&quot;,
       &quot;componentType&quot;: &quot;EDS.Component&quot;
     }
   ]
 }
}
</code></pre></li>
</ol>
<p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="61" sourceendlinenumber="61">This example results in a minimal configuration of Edge Data Store. It only supports OMF and SDS operations using REST. No egress is configured, so no data will be sent to either OCS or PI Web API.</p>
<h2 id="configure-maximum-edge-data-store" sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="63" sourceendlinenumber="63">Configure maximum Edge Data Store</h2>
<p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="65" sourceendlinenumber="65">The following JSON file represents maximum configuration of an Edge Data Store. There are Modbus TCP EDS adapter components and OPC UA EDS adapter components, and egress is configured to send to both PI Web API and OCS from both the default (operational data) and diagnostics (diagnostic data) namespace.</p>
<ol sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="67" sourceendlinenumber="398">
<li sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="67" sourceendlinenumber="67">Using any text editor, create a JSON file using the following example. Fill in any credentials or IP addresses with appropriate values for your environment.</li>
<li sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="68" sourceendlinenumber="68">Save the edited JSON in a file named <em>EdgeMaximumConfiguration.json</em> in any directory. </li>
<li sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="69" sourceendlinenumber="398"><p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="69" sourceendlinenumber="69">Run the following curl command from the same directory where the file is located:</p>
<pre sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="71" sourceendlinenumber="73"><code class="lang-bash">curl -i -d &quot;@EdgeMaximumConfiguration.json&quot; -H &quot;Content-Type: application/json&quot; -X PUT http://localhost:5590/api/v1/configuration
</code></pre><p sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="75" sourceendlinenumber="75">The following will be set as the configuration for the running Edge Data Store. The configuration takes effect immediately after the command completes.</p>
<pre sourcefile="V1/Configuration/EdgeSystemConfiguration_1-0.md" sourcestartlinenumber="77" sourceendlinenumber="398"><code class="lang-json">{
   &quot;Modbus1&quot;: {
       &quot;Logging&quot;: {
           &quot;logLevel&quot;: &quot;Information&quot;,
           &quot;logFileSizeLimitBytes&quot;: 34636833,
           &quot;logFileCountLimit&quot;: 31
       },
       &quot;DataSource&quot;: {
           &quot;IpAddress&quot;: &quot;&lt;Modbus IP address&gt;&quot;,
           &quot;Port&quot;: 502,
           &quot;ConnectTimeout&quot;: 15000,
           &quot;ReconnectInterval&quot;: 5000,
           &quot;RequestTimeout&quot;: 9000,
           &quot;DelayBetweenRequests&quot;: 0,
           &quot;MaxResponseDataLength&quot;: 250
       },
       &quot;DataSelection&quot;: [{
               &quot;Selected&quot;: &quot;true&quot;,
               &quot;UnitId&quot;: 1,
               &quot;RegisterType&quot;: 3,
               &quot;RegisterOffset&quot;: 1,
               &quot;DataTypeCode&quot;: 20,
               &quot;BitMap&quot;: &quot;16151413&quot;,
               &quot;ConversionFactor&quot;: 2,
               &quot;ConversionOffset&quot;: 3.4,
               &quot;ScanRate&quot;: 500
           },
           {
               &quot;Selected&quot;: &quot;true&quot;,
               &quot;UnitId&quot;: 1,
               &quot;RegisterType&quot;: 3,
               &quot;RegisterOffset&quot;: 2,
               &quot;DataTypeCode&quot;: 20,
               &quot;BitMap&quot;: &quot;16151413&quot;,
               &quot;ConversionFactor&quot;: 2,
               &quot;ConversionOffset&quot;: 3.4,
               &quot;ScanRate&quot;: 500
           },
           {
               &quot;Selected&quot;: &quot;true&quot;,
               &quot;UnitId&quot;: 1,
               &quot;RegisterType&quot;: 3,
               &quot;RegisterOffset&quot;: 3,
               &quot;DataTypeCode&quot;: 20,
               &quot;BitMap&quot;: &quot;16151413&quot;,
               &quot;ConversionFactor&quot;: 2,
               &quot;ConversionOffset&quot;: 3.4,
               &quot;ScanRate&quot;: 500
           },
           {
               &quot;Selected&quot;: &quot;true&quot;,
               &quot;UnitId&quot;: 1,
               &quot;RegisterType&quot;: 3,
               &quot;RegisterOffset&quot;: 4,
               &quot;DataTypeCode&quot;: 20,
               &quot;BitMap&quot;: &quot;16151413&quot;,
               &quot;ConversionFactor&quot;: 2,
               &quot;ConversionOffset&quot;: 3.4,
               &quot;ScanRate&quot;: 500
           },
           {
               &quot;Selected&quot;: &quot;true&quot;,
               &quot;UnitId&quot;: 1,
               &quot;RegisterType&quot;: 3,
               &quot;RegisterOffset&quot;: 5,
               &quot;DataTypeCode&quot;: 20,
               &quot;BitMap&quot;: &quot;16151413&quot;,
               &quot;ConversionFactor&quot;: 2,
               &quot;ConversionOffset&quot;: 3.4,
               &quot;ScanRate&quot;: 500
           }
       ]
   },
   &quot;Storage&quot;: {
       &quot;Runtime&quot;: {
           &quot;streamStorageLimitMb&quot;: 2,
           &quot;streamStorageTargetMb&quot;: 1,
           &quot;ingressDebugExpiration&quot;: &quot;0001-01-01T00:00:00&quot;
       },
       &quot;Logging&quot;: {
           &quot;logLevel&quot;: &quot;Information&quot;,
           &quot;logFileSizeLimitBytes&quot;: 34636833,
           &quot;logFileCountLimit&quot;: 31
       },
       &quot;PeriodicEgressEndpoints&quot;: [{
               &quot;Id&quot;: &quot;OCS&quot;,
               &quot;ExecutionPeriod&quot;: &quot;00:00:50&quot;,
               &quot;Name&quot;: null,
               &quot;NamespaceId&quot;: &quot;default&quot;,
               &quot;Description&quot;: null,
               &quot;Enabled&quot;: true,
               &quot;Backfill&quot;: false,
               &quot;EgressFilter&quot;: &quot;&quot;,
               &quot;StreamPrefix&quot;: &quot;ChangeMe&quot;,
               &quot;TypePrefix&quot;: &quot;ChangeMe&quot;,
               &quot;Endpoint&quot;: &quot;&lt;OCS OMF URL for your tenant and namespace&gt;&quot;,
               &quot;ClientId&quot;: &quot;&lt;OCS ClientId&gt;&quot;,
               &quot;ClientSecret&quot;: &quot;&lt;OCS ClientSecret&gt;&quot;,
               &quot;UserName&quot;: null,
               &quot;Password&quot;: null,
               &quot;DebugExpiration&quot;: null
           },
           {
               &quot;Id&quot;: &quot;PWA&quot;,
               &quot;ExecutionPeriod&quot;: &quot;00:00:50&quot;,
               &quot;Name&quot;: null,
               &quot;NamespaceId&quot;: &quot;default&quot;,
               &quot;Description&quot;: null,
               &quot;Enabled&quot;: true,
               &quot;Backfill&quot;: false,
               &quot;EgressFilter&quot;: &quot;&quot;,
               &quot;StreamPrefix&quot;: &quot;ChangeMe&quot;,
               &quot;TypePrefix&quot;: &quot;ChangeMe&quot;,
               &quot;Endpoint&quot;: &quot;https://&lt;your PI Web API server&gt;/piwebapi/omf/&quot;,
               &quot;ClientId&quot;: null,
               &quot;ClientSecret&quot;: null,
               &quot;UserName&quot;: &quot;&lt;username&gt;&quot;,
               &quot;Password&quot;: &quot;&lt;password&gt;&quot;,
               &quot;DebugExpiration&quot;: null
           },
           {
               &quot;Id&quot;: &quot;OCSDiag&quot;,
               &quot;ExecutionPeriod&quot;: &quot;00:00:50&quot;,
               &quot;Name&quot;: null,
               &quot;NamespaceId&quot;: &quot;diagnostics&quot;,
               &quot;Description&quot;: null,
               &quot;Enabled&quot;: true,
               &quot;Backfill&quot;: false,
               &quot;EgressFilter&quot;: &quot;&quot;,
               &quot;StreamPrefix&quot;: &quot;ChangeMe&quot;,
               &quot;TypePrefix&quot;: &quot;ChangeMe&quot;,
               &quot;Endpoint&quot;: &quot;&lt;OCS OMF URL for your tenant and namespace&gt;&quot;,
               &quot;ClientId&quot;: &quot;&lt;OCS ClientId&gt;&quot;,
               &quot;ClientSecret&quot;: &quot;&lt;OCS ClientSecret&gt;&quot;,
               &quot;UserName&quot;: null,
               &quot;Password&quot;: null,
               &quot;DebugExpiration&quot;: null
           },
           {
               &quot;Id&quot;: &quot;PWADiag&quot;,
               &quot;ExecutionPeriod&quot;: &quot;00:00:50&quot;,
               &quot;Name&quot;: null,
               &quot;NamespaceId&quot;: &quot;diagnostics&quot;,
                &quot;Description&quot;: null,
               &quot;Enabled&quot;: true,
               &quot;Backfill&quot;: false,
               &quot;EgressFilter&quot;: &quot;&quot;,
               &quot;StreamPrefix&quot;: &quot;ChangeMe&quot;,
               &quot;TypePrefix&quot;: &quot;ChangeMe&quot;,
               &quot;Endpoint&quot;: &quot;https://&lt;your PI Web API server&gt;/piwebapi/omf/&quot;,
               &quot;ClientId&quot;: null,
               &quot;ClientSecret&quot;: null,
               &quot;UserName&quot;: &quot;&lt;username&gt;&quot;,
               &quot;Password&quot;: &quot;&lt;password&gt;&quot;,
               &quot;DebugExpiration&quot;: null
           }
       ]
   },
   &quot;OpcUa1&quot;: {
       &quot;Logging&quot;: {
           &quot;logLevel&quot;: &quot;Information&quot;,
           &quot;logFileSizeLimitBytes&quot;: 34636833,
           &quot;logFileCountLimit&quot;: 31
       },
       &quot;DataSource&quot;: {
           &quot;EndpointUrl&quot;: &quot;opc.tcp://&lt;OPC UA server IP and port&gt;/OSIsoftTestServer&quot;,
           &quot;UseSecureConnection&quot;: false,
           &quot;UserName&quot;: null,
           &quot;Password&quot;: null,
           &quot;RootNodeIds&quot;: null,
           &quot;IncomingTimestamp&quot;: &quot;Source&quot;,
           &quot;StreamIdPrefix&quot;: &quot;OpcUa&quot;
       },
       &quot;DataSelection&quot;: [{
               &quot;Selected&quot;: true,
               &quot;Name&quot;: &quot;Cold Side Inlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Cold Side Outlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1001.ColdSideOutletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: true,
               &quot;Name&quot;: &quot;Hot Side Inlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: true,
               &quot;Name&quot;: &quot;Hot Side Outlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: true,
               &quot;Name&quot;: &quot;Cold Side Inlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Cold Side Outlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1002.ColdSideOutletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Hot Side Inlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1002.HotSideInletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: true,
               &quot;Name&quot;: &quot;Hot Side Outlet Temperature&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Power&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.SF_Pump_001.Power&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Efficiency&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.SF_Pump_001.Efficiency&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Flowrate&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.SF_Pump_001.Flowrate&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Power&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.SF_Pump_002.Power&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Efficiency&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.SF_Pump_002.Efficiency&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Flowrate&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.SF_Pump_002.Flowrate&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Level&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.Tank1.Level&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Mass&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.Tank1.Mass&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Volume&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.Tank1.Volume&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Level&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.Tank2.Level&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Mass&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.Tank2.Mass&quot;,
               &quot;StreamId&quot;: null
           },
           {
               &quot;Selected&quot;: false,
               &quot;Name&quot;: &quot;Volume&quot;,
               &quot;NodeId&quot;: &quot;ns=2;s=Line1.Tank2.Volume&quot;,
               &quot;StreamId&quot;: null
           }
       ]
   },
   &quot;System&quot;: {
       &quot;Logging&quot;: {
           &quot;logLevel&quot;: &quot;Information&quot;,
           &quot;logFileSizeLimitBytes&quot;: 34636833,
           &quot;logFileCountLimit&quot;: 31
       },
       &quot;Components&quot;: [{
               &quot;componentId&quot;: &quot;OpcUa1&quot;,
               &quot;componentType&quot;: &quot;OpcUa&quot;
           },
           {
               &quot;componentId&quot;: &quot;Modbus1&quot;,
               &quot;componentType&quot;: &quot;Modbus&quot;
           },
           {
               &quot;componentId&quot;: &quot;Storage&quot;,
               &quot;componentType&quot;: &quot;EDS.Component&quot;
           }
       ],
       &quot;HealthEndpoints&quot;: [],
       &quot;Port&quot;: {
           &quot;port&quot;: 5590
       }
   }
}
</code></pre></li>
</ol>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/Configuration/EdgeSystemConfiguration_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
            
            <span><a href="https://www.osisoft.com/copyright/">© 2019 - 2020 OSIsoft, LLC. All rights reserved.</a></span>
          </div>
        </div>
      </footer>
    </div>
    
    <script type="text/javascript" src="../../styles/docfx.vendor.js"></script>
    <script type="text/javascript" src="../../styles/docfx.js"></script>
    <script type="text/javascript" src="../../styles/main.js"></script>
  </body>
</html>