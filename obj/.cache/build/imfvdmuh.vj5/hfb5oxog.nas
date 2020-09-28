<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Generate default OPC UA data selection configuration file </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Generate default OPC UA data selection configuration file ">
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
            <article class="content wrap" id="_content" data-uid="opcUaDataSelection1-0">
<h1 id="generate-default-opc-ua-data-selection-configuration-file" sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Generate default OPC UA data selection configuration file</h1>

<p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">When you add a data source, the OPC UA EDS adapter browses the entire OPC UA server address space and exports the available OPC UA variables into a JSON file for data selection. Data is collected automatically based upon user demands. OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).</p>
<p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">A default OPC UA data selection file will be created if there is no OPC UA data selection configuration, but a valid OPC UA data source exists.</p>
<blockquote sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11"><p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11"><strong>Note:</strong> To avoid possibly expensive browse operations, OSIsoft recommends that you manually create a data selection file instead of generating the default data selection file. For more information, see <a class="xref" href="OPCUADataSelectionConfiguration_1-0.html" data-raw-source="[Data selection configuration](xref:OPCUADataSelectionConfiguration1-0)" sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">Data selection configuration</a>.</p>
</blockquote>
<p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">Complete the following steps in order for this default data selection file to be generated:</p>
<ol sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="57">
<li sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="17"><p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">Add an <a class="xref" href="../Configuration/EdgeSystemConfiguration_1-0.html" data-raw-source="[OPC UA EDS adapter](xref:EdgeDataStoreConfiguration1-0)" sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">OPC UA EDS adapter</a> with a unique ComponentId. </p>
<p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="17">During the installation of Edge Data Store, enabling the OPC UA EDS adapter results in addition of a unique component that also satisfies this condition.</p>
</li>
<li sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="19" sourceendlinenumber="29"><p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="19" sourceendlinenumber="19">Configure a valid <a class="xref" href="OpcUaOverview_1-0.html" data-raw-source="[OPC UA data source](xref:opcUaOverview1-0)" sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="19" sourceendlinenumber="19">OPC UA data source</a>.</p>
<p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="21" sourceendlinenumber="21">Once you complete these steps, a default OPC UA data selection configuration file will be generated in the configuration directory for the corresponding platform.</p>
<p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="23" sourceendlinenumber="23">The following are example locations of the file created. In this example, it is assumed that the ComponentId of the OPC UA component is the default OpcUa1:</p>
<pre sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="25" sourceendlinenumber="29"><code class="lang-bash">Windows: %programdata%\OSIsoft\EdgeDataStore\Configuration\OpcUa1_DataSelection.json

Linux: /usr/share/OSIsoft/EdgeDataStore/Configuration/OpcUa1_DataSelection.json
</code></pre></li>
<li sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="31" sourceendlinenumber="50"><p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="31" sourceendlinenumber="31">Copy the file to a different directory.</p>
<p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="33">The contents of the file will look something like:</p>
<pre sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="35" sourceendlinenumber="50"><code class="lang-json">[
{
  &quot;Selected&quot;: false,
  &quot;Name&quot;: &quot;Cold Side Inlet Temperature&quot;,
  &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature&quot;,
  &quot;StreamId&quot;: null
 },
 {
  &quot;Selected&quot;: false,
  &quot;Name&quot;: &quot;Cold Side Outlet Temperature&quot;,
  &quot;NodeId&quot;: &quot;ns=2;s=Line1.HeatExchanger1001.ColdSideOutletTemperature&quot;,
  &quot;StreamId&quot;: null
 }
]
</code></pre></li>
<li sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="52" sourceendlinenumber="52"><p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="52" sourceendlinenumber="52">In a text editor, edit the file and change the value of any Selected key from false to true in order to transfer the OPC UA data to be stored in Edge Data Store. </p>
</li>
<li sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="53" sourceendlinenumber="57"><p sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="53" sourceendlinenumber="53">In the same directory where you edited the file, run the following curl command:</p>
<pre sourcefile="V1/OpcUa/OpcUaDataSelection_1-0.md" sourcestartlinenumber="55" sourceendlinenumber="57"><code class="lang-bash">curl -i -d &quot;@OpcUa1_DataSelection.json&quot; -H &quot;Content-Type: application/json&quot; -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
</code></pre></li>
</ol>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/OpcUa/OpcUaDataSelection_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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