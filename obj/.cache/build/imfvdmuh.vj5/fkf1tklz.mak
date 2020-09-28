<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>REST commands </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="REST commands ">
    <meta name="generator" content="docfx 2.43.2.0">
    
    <link rel="shortcut icon" href="../../favicon.ico">
    <link rel="stylesheet" href="../../styles/docfx.vendor.css">
    <link rel="stylesheet" href="../../styles/docfx.css">
    <link rel="stylesheet" href="../../styles/main.css">
    <meta property="docfx:navrel" content="../../toc.html">
    <meta property="docfx:tocrel" content="toc.html">
    
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
            <article class="content wrap" id="_content" data-uid="RestCommands1-0">
<h1 id="rest-commands" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">REST commands</h1>

<p sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">The following tables provide an overview of available REST commands that you can use with components of Edge Data Store.</p>
<p sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="11"><strong>Note:</strong> The difference between the POST and PUT methods is that POST enables you to create a
configuration, while PUT replaces a configuration. If you use POST on an existing
configuration, the request will fail.</p>
<h2 id="administration" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">Administration</h2>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="20">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Delete and reset all event and configuration data related to the Edge Data Store component</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/administration/Storage/Reset</code></td>
</tr>
<tr>
<td>Reset Edge Data Store</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/administration/System/Reset</code></td>
</tr>
<tr>
<td>Stop an individual EDS adapter</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/administration/EDS adapterId/Stop</code></td>
</tr>
<tr>
<td>Start an individual EDS adapter</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/administration/EDS adapterId/Start</code></td>
</tr>
</tbody>
</table>
<h2 id="configuration" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="22" sourceendlinenumber="22">Configuration</h2>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="24" sourceendlinenumber="26">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Verify correct installation of Edge Data Store<br><br> Configure minimum Edge Data Store<br><br>Configure maximum Ede Data Store</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration</code></td>
</tr>
</tbody>
</table>
<h3 id="system" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="28" sourceendlinenumber="28">System</h3>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="30" sourceendlinenumber="35">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Configure system components</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/system/components</code></td>
</tr>
<tr>
<td>Configure system port</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/system/port</code></td>
</tr>
<tr>
<td>Configure system logging</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/System/Logging</code></td>
</tr>
<tr>
<td>Configure system health endpoints</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/System/HealthEndpoints</code></td>
</tr>
</tbody>
</table>
<h3 id="storage" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="37" sourceendlinenumber="37">Storage</h3>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="39" sourceendlinenumber="41">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Configure data egress (to either OCS or PI Web API)</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/</code></td>
</tr>
</tbody>
</table>
<h3 id="eds-adapters" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="43" sourceendlinenumber="43">EDS adapters</h3>
<p sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="45" sourceendlinenumber="45"><strong>Note:</strong> Substitute the ID number of the adapter that you are configuring, for example <code>OpcUa1</code> or <code>OpcUa2</code> or <code>Modbus3</code>, and so on.</p>
<h4 id="opc-ua" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="47" sourceendlinenumber="47">OPC UA</h4>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="49" sourceendlinenumber="53">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Configure an OPC UA data source</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/OpcUa1/Datasource</code></td>
</tr>
<tr>
<td>Configure OPC UA data selection</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection</code></td>
</tr>
<tr>
<td>Change OPC UA logging configuration</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/OpcUa1/Logging</code></td>
</tr>
</tbody>
</table>
<h4 id="modbus-tcp" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="56" sourceendlinenumber="56">Modbus TCP</h4>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="58" sourceendlinenumber="62">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Configure a Modbus TCP data source</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/Modbus1/Datasource</code></td>
</tr>
<tr>
<td>Configure Modbus TCP data selection</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/Modbus1/Datasource</code></td>
</tr>
<tr>
<td>Change Modbus TCP logging configuration</td>
<td>PUT</td>
<td><code>http://localhost:5590/api/v1/configuration/Modbus1/Logging</code></td>
</tr>
</tbody>
</table>
<h2 id="tenants" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="64" sourceendlinenumber="64">Tenants</h2>
<h3 id="types" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="66" sourceendlinenumber="66">Types</h3>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="68" sourceendlinenumber="70">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Create an SDS type</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/types/Simple</code></td>
</tr>
</tbody>
</table>
<h3 id="streams" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="72" sourceendlinenumber="72">Streams</h3>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="74" sourceendlinenumber="82">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Create an SDS stream</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple</code></td>
</tr>
<tr>
<td>View streams that have been created in Storage</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/</code></td>
</tr>
<tr>
<td>Write data events to the SDS stream</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data</code></td>
</tr>
<tr>
<td>Read last data value written to server</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data/Last</code></td>
</tr>
<tr>
<td>Read a time range of values written to server.<br><strong>(Example)</strong></td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data?startIndex=2017-07-08T13:00:00Z&amp;count=100</code></td>
</tr>
<tr>
<td>Read last container data value written to the server (using SDS)</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data/Last</code></td>
</tr>
<tr>
<td>Read a time range of container values written to server (using SDS) <strong>(Example)</strong></td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data?startIndex=2017-07-08T13:00:00Z&amp;count=100</code></td>
</tr>
</tbody>
</table>
<h3 id="omf" sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="85" sourceendlinenumber="85">OMF</h3>
<table sourcefile="V1/Reference/REST commands_1-0.md" sourcestartlinenumber="86" sourceendlinenumber="89">
<thead>
<tr>
<th>Description</th>
<th>Method</th>
<th>Endpoint</th>
</tr>
</thead>
<tbody>
<tr>
<td>Create an OMF type <br><br>Create an OMF container<br><br>Write data events to the OMF container</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/</code></td>
</tr>
<tr>
<td>Create an OMF container</td>
<td>POST</td>
<td><code>http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/</code></td>
</tr>
</tbody>
</table>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/Reference/REST commands_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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