<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Streams </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Streams ">
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
            <article class="content wrap" id="_content" data-uid="sdsStreams1-0">
<h1 id="streams" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Streams</h1>

<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">SdsStreams are collections of sequentially occurring values indexed by a single property, typically time series data. You define SdsStreams to organize incoming data from another system into the OCS. To define an SdsStream, you must first define an SdsType, which defines the structure of the data you want to stream into a selected namespace.</p>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">SdsStreams are referenced by their identifier, which is the <code>Id</code> field. SdsStream identifiers must be unique within a namespace. An SdsStream must include a <code>TypeId</code> that references the identifier of an existing SdsType. When an SdsStream contains data, you must use a stream view to update the stream type.</p>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">The following table shows the SdsStream fields. Fields not listed are reserved for internal SDS use.</p>
<table sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="22">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Optionality</th>
<th>Searchable</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>Id</td>
<td>String</td>
<td>Required</td>
<td>Yes</td>
<td>An identifier for referencing the stream.</td>
</tr>
<tr>
<td>TypeId</td>
<td>String</td>
<td>Required</td>
<td>Yes</td>
<td>The SdsType identifier of the type to be used for this stream.</td>
</tr>
<tr>
<td>Name</td>
<td>String</td>
<td>Optional</td>
<td>Yes</td>
<td>Friendly name.</td>
</tr>
<tr>
<td>Description</td>
<td>String</td>
<td>Optional</td>
<td>Yes</td>
<td>Description text.</td>
</tr>
<tr>
<td>Indexes</td>
<td>IList&lt;SdsStreamIndex></td>
<td>Optional</td>
<td>No</td>
<td>Used to define secondary indexes for stream.</td>
</tr>
<tr>
<td>InterpolationMode</td>
<td>SdsInterpolationMode</td>
<td>Optional</td>
<td>No</td>
<td>Interpolation setting of the stream. Default is null.</td>
</tr>
<tr>
<td>ExtrapolationMode</td>
<td>SdsExtrapolationMode</td>
<td>Optional</td>
<td>No</td>
<td>Extrapolation setting of the stream. Default is null.</td>
</tr>
<tr>
<td>PropertyOverrides</td>
<td>IList&lt;SdsStreamPropertyOverride></td>
<td>Optional</td>
<td>No</td>
<td>Used to define unit of measure and interpolation mode overrides for a stream.</td>
</tr>
</tbody>
</table>
<h2 id="rules-for-the-stream-identifier-sdsstreamid" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="24" sourceendlinenumber="24">Rules for the stream identifier (SdsStream.Id)</h2>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="26" sourceendlinenumber="26">The stream identifier, SdsStream.Id, has the following requirements:</p>
<ul sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="28" sourceendlinenumber="31">
<li sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="28" sourceendlinenumber="28">Is not case sensitive.</li>
<li sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="29" sourceendlinenumber="29">Can contain spaces.</li>
<li sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="30" sourceendlinenumber="30">Cannot contain forward slash (&quot;/&quot;).</li>
<li sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="31" sourceendlinenumber="31">Contains a maximum of 100 characters.</li>
</ul>
<h2 id="indexes" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="33">Indexes</h2>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="35" sourceendlinenumber="35">The key or primary index is defined at the SdsType. Secondary indexes are defined at the SdsStream. Secondary indexes are applied to a single property; there are no compound secondary indexes. Only SdsTypeCodes that can be ordered are supported for use in a secondary index.</p>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="37" sourceendlinenumber="37">For more information about indexes, see <a class="xref" href="indexes_1-0.html" data-raw-source="[Indexes](xref:sdsIndexes1-0)" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="37" sourceendlinenumber="37">Indexes</a>.</p>
<h2 id="interpolation-and-extrapolation" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="39" sourceendlinenumber="39">Interpolation and extrapolation</h2>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="41" sourceendlinenumber="41">The InterpolationMode, ExtrapolationMode, and <a href="#propertyoverrides" data-raw-source="[PropertyOverrides](#propertyoverrides)" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="41" sourceendlinenumber="41">PropertyOverrides</a> can be used to determine how a specific stream reads data. These read characteristics are inherited from the type if they are not defined at the stream level. For more information about type read characteristics and how these characteristics dictate how events are read, see <a class="xref" href="SDS_Types_1-0.html" data-raw-source="[Types](xref:sdsTypes1-0)" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="41" sourceendlinenumber="41">Types</a>.</p>
<h2 id="propertyoverrides" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="43" sourceendlinenumber="43">PropertyOverrides</h2>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="45" sourceendlinenumber="45">PropertyOverrides are used to override interpolation behavior and unit of measure for individual SdsType Properties for a specific SdsStream.</p>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="47" sourceendlinenumber="47">The <code>SdsStreamPropertyOverride</code> object has the following structure:</p>
<table sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="49" sourceendlinenumber="53">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Optionality</th>
<th>Details</th>
</tr>
</thead>
<tbody>
<tr>
<td>SdsTypePropertyId</td>
<td>String</td>
<td>Required</td>
<td>SdsTypeProperty identifier.</td>
</tr>
<tr>
<td>InterpolationMode</td>
<td>SdsInterpolationMode</td>
<td>Optional</td>
<td>Interpolation setting. Default is null.</td>
</tr>
<tr>
<td>Uom</td>
<td>String</td>
<td>Optional</td>
<td>Unit of measure.</td>
</tr>
</tbody>
</table>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="55" sourceendlinenumber="55">The unit of measure can be overridden for any type property defined by the stream type, including primary keys and secondary indexes. For more information about type property units of measure, see <a class="xref" href="SDS_Types_1-0.html" data-raw-source="[Types](xref:sdsTypes1-0)" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="55" sourceendlinenumber="55">Types</a>.</p>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="57" sourceendlinenumber="57">Read characteristics of the stream are determined by the type and the PropertyOverrides of the stream. The interpolation mode for non-index properties can be defined and overridden at the stream level. For more information about type read characteristics, see <a class="xref" href="SDS_Types_1-0.html" data-raw-source="[Types](xref:sdsTypes1-0)" sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="57" sourceendlinenumber="57">Types</a>.</p>
<p sourcefile="V1/SDS/SDS_Streams_1-0.md" sourcestartlinenumber="59" sourceendlinenumber="59">If the SdsType InterpolationMode is <code>Discrete</code>, it cannot be overridden at any level. When InterpolationMode is set to <code>Discrete</code> and an event is not defined for that index, a null value is returned for the entire event.</p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/SDS/SDS_Streams_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
