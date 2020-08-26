<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Edge Data Store </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Edge Data Store ">
    <meta name="generator" content="docfx 2.43.2.0">
    
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" href="../styles/docfx.vendor.css">
    <link rel="stylesheet" href="../styles/docfx.css">
    <link rel="stylesheet" href="../styles/main.css">
    <meta property="docfx:navrel" content="../toc.html">
    <meta property="docfx:tocrel" content="toc.html">
    
    <meta property="docfx:rel" content="../">
    
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
              <a class="navbar-brand" href="../V1/index.html" width="46">
                <img id="logo" src="../V1/images/atlas_icon.png" height="46" width="46" alt="OSIsoft Edge Data Store"> 
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
            <article class="content wrap" id="_content" data-uid="EdgeDataStore1-0">
<h1 id="edge-data-store" sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Edge Data Store</h1>

<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">Edge Data Store (EDS) is a lightweight data collection and storage application designed to capture data at the edge of networks for historical storage and analysis. It runs on small, rugged devices or embedded in existing industrial hardware, and is designed to be resilient and require minimal installation and administration. While not a replacement for a PI System or OSIsoft Cloud Services (OCS), EDS augments the PI System and OCS by collecting and storing data in situations where deploying a full system is impractical. </p>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">The following diagram shows conceptually how EDS captures data and sends to permanent storage:</p>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11"><img src="https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSConceptualDiag.jpg" alt="EDS conceptual diagram" title="EDS conecptual diagram" sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11"></p>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">EDS collects data using any of the following methods:</p>
<ul sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="18">
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">Built-in OPC UA connectivity</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="16">Built-in Modbus TCP connectivity</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="17">Custom application using OSIsoft Message Format (OMF)</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="18" sourceendlinenumber="18">Custom application using REST API</li>
</ul>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="20">Once collected, the data is stored locally in configurable data storage within EDS, until it can be sent to permanent storage in a PI System or in OSIsoft Cloud Services through periodic egress. The data can also be read from local storage by custom applications using REST APIs.</p>
<h2 id="edge-data-store-architecture" sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="22" sourceendlinenumber="22">Edge Data Store architecture</h2>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="23" sourceendlinenumber="23">EDS runs on both Linux and Windows platforms and is comprised of separate components that each perform a specific function within EDS. The following diagram shows Edge Data Store architecture with all of its components and how the data flow through those components:</p>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="25" sourceendlinenumber="25"><img src="https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSArchitecturalDiag.jpg" alt="EDS architecture" title="EDS architecture" sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="25" sourceendlinenumber="25"></p>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="27" sourceendlinenumber="27">EDS components are shown in grey within the Edge Data Store in the diagram:</p>
<ul sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="29" sourceendlinenumber="33">
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="29" sourceendlinenumber="29">Modbus TCP EDS adapter – Collects data from Modbus TCP devices and writes it to data storage</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="30" sourceendlinenumber="30">OPC UA EDS adapter – Collects data from OPC UA devices and writes it to data storage</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="31" sourceendlinenumber="31">Data Storage – Stores data locally until it can be egressed</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="32" sourceendlinenumber="32">Data egress – Sends data from storage to PI Server or OSIsoft Cloud Services</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="33">Health – Records health information of components and sends it to PI Server or OSIsoft Cloud Services</li>
</ul>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="35" sourceendlinenumber="35">Blue boxes in the diagram show ways to interact with EDS from the local device:</p>
<ul sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="37" sourceendlinenumber="39">
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="37" sourceendlinenumber="37">OMF REST – Use OSIsoft Message Format to write data to the data storage component programmatically</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="38" sourceendlinenumber="38">SDS REST APIs – Use SDS REST APIs to read data from and write data to the data storage component programmatically</li>
<li sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="39" sourceendlinenumber="39">Configuration – Use REST or the EdgeCmd tool to configure EDS as a whole or each component individually and to view the current configuration</li>
</ul>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="41" sourceendlinenumber="41">EDS requires an endpoint to connect to REST APIs on the local device, which is shown outlined in blue in the diagram. By default, the endpoint uses port 5590; however, it can be configured to use another port. </p>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="43" sourceendlinenumber="43">Orange arrows show data flowing into EDS and blue arrows show data flowing out of EDS.</p>
<p sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="45" sourceendlinenumber="45">For detailed information about configuring each component of EDS, see <a class="xref" href="Configuration/Configuration_1-0.html" data-raw-source="[Configuration](xref:Configuration1-0)" sourcefile="V1/Edge_Data_Store_1-0.md" sourcestartlinenumber="45" sourceendlinenumber="45">Configuration</a></p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/Edge_Data_Store_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
    
    <script type="text/javascript" src="../styles/docfx.vendor.js"></script>
    <script type="text/javascript" src="../styles/docfx.js"></script>
    <script type="text/javascript" src="../styles/main.js"></script>
  </body>
</html>
