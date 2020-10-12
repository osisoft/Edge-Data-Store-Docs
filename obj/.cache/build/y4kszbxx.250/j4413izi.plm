<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Write data API </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Write data API ">
    <meta name="generator" content="docfx 2.43.2.0">
    
    <link rel="shortcut icon" href="../../../favicon.ico">
    <link rel="stylesheet" href="../../../styles/docfx.vendor.css">
    <link rel="stylesheet" href="../../../styles/docfx.css">
    <link rel="stylesheet" href="../../../styles/main.css">
    <meta property="docfx:navrel" content="../../../toc.html">
    <meta property="docfx:tocrel" content="../../toc.html">
    
    <meta property="docfx:rel" content="../../../">
    
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
              <a class="navbar-brand" href="../../../V1/index.html" width="46">
                <img id="logo" src="../../../V1/images/atlas_icon.png" height="46" width="46" alt="OSIsoft Edge Data Store"> 
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
            <article class="content wrap" id="_content" data-uid="sdsWritingDataApi1-0">
<h1 id="write-data-api" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Write data API</h1>

<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">The following example API calls show different methods for writing data.</p>
<h2 id="example-type-stream-and-data" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">Example type, stream, and data</h2>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">The descriptions of the following API methods contain example requests and responses in JSON to highlight usage and specific behaviors. The following type, stream, and data are used in the examples:</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="14"><strong>Example type</strong><br><code>SimpleType</code> is an SdsType with a single index and two additional properties. This type is defined in Python and Javascript:</p>
<h6 id="python" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="16">Python</h6>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="18" sourceendlinenumber="42"><code class="lang-python">class State(Enum):
  Ok = 0
  Warning = 1
  Alarm = 2

class SimpleType(object):
  Time = property(getTime, setTime)
  def getTime(self):
    return self.__time
  def setTime(self, time):
    self.__time = time

  State = property(getState, setState)
  def getState(self):
    return self.__state
  def setState(self, state):
    self.__state = state

  Measurement = property(getValue, setValue)
  def getValue(self):
    return self.__measurement
  def setValue(self, measurement):
    self.__measurement = measurement
</code></pre><h6 id="javascript" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="44" sourceendlinenumber="44">JavaScript</h6>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="46" sourceendlinenumber="59"><code class="lang-javascript">var State =
{
  Ok: 0,
  Warning: 1,
  Alarm: 2,
}

var SimpleType = function () {
  this.Time = null;
  this.State = null;
  this.Value = null;
}
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="61" sourceendlinenumber="62"><strong>Example stream</strong><br><code>Simple</code> is an SdsStream of type <code>SimpleType</code>.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="64" sourceendlinenumber="70"><strong>Example data</strong><br><code>Simple</code> has stored values as follows:
      11/23/2017 12:00:00 PM: Ok  0
      11/23/2017  1:00:00 PM: Ok 10
      11/23/2017  2:00:00 PM: Ok 20
      11/23/2017  3:00:00 PM: Ok 30
      11/23/2017  4:00:00 PM: Ok 40</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="72" sourceendlinenumber="72">All times are represented at offset 0, GMT.</p>
<hr>
<h2 id="insert-values" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="75" sourceendlinenumber="75"><code>Insert Values</code></h2>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="77" sourceendlinenumber="77">Inserts data into the specified stream. Returns an error if data is already present at the index of any event.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="79" sourceendlinenumber="79"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="81" sourceendlinenumber="83"><code class="lang-text">POST api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="85" sourceendlinenumber="87"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="89" sourceendlinenumber="90"><code>string streamId</code><br>The stream identifier. </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="92" sourceendlinenumber="93"><strong>Request body</strong><br>A serialized list of one or more events of the stream type.  </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="95" sourceendlinenumber="96"><strong>Response</strong><br>The response includes a status code.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="98" sourceendlinenumber="98"><strong>Note:</strong> This request will return an error if an event already exists for any index in the request. If any individual index encounters a problem, the entire operation is rolled back and no insertions are made. The <code>streamId</code> and <code>index</code> that caused the issue are included in the error response.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="100" sourceendlinenumber="101"><strong>Example</strong><br>The following request is used to insert events into stream <code>Simple</code> of <code>SimpleType</code>,</p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="103" sourceendlinenumber="105"><code class="lang-text">POST api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="107" sourceendlinenumber="107">The request body specifies the values to insert:</p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="109" sourceendlinenumber="122"><code class="lang-json">[
    {
        &quot;Time&quot;: &quot;2017-11-23T17:00:00Z&quot;,
        &quot;State&quot;: 0,
        &quot;Measurement&quot;: 50
    },
    {
        &quot;Time&quot;: &quot;2017-11-23T18:00:00Z&quot;,
        &quot;State&quot;: 0,
        &quot;Measurement&quot;: 60
    }
]
</code></pre><hr>
<h2 id="patch-values" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="126" sourceendlinenumber="126"><code>Patch Values</code></h2>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="128" sourceendlinenumber="128">Modifies the specified stream event(s). Patching affects only the data item parameters that are included in the call.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="130" sourceendlinenumber="130"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="132" sourceendlinenumber="135"><code class="lang-text">PATCH api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
  ?select={selectExpression}
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="137" sourceendlinenumber="139"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="141" sourceendlinenumber="142"><code>string streamId</code><br>The stream identifier.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="144" sourceendlinenumber="145"><code>string selectExpression</code><br>Comma-separated list of strings that indicates the event fields to be changed in stream events.  </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="147" sourceendlinenumber="148"><strong>Request body</strong><br>A serialized collection of one or more patch property events.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="150" sourceendlinenumber="151"><strong>Response</strong><br>The response includes a status code.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="153" sourceendlinenumber="153">Consider you have a stream <code>Simple</code> of <code>SimpleType</code>, to change one property, <code>Measurement</code>, for one event specify the following request:</p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="155" sourceendlinenumber="158"><code class="lang-text">PATCH api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/Simple/Data
  ?select=measurement
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="160" sourceendlinenumber="160">With the following request body,</p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="162" sourceendlinenumber="169"><code class="lang-json">[
  {  
    &quot;Time&quot;:&quot;2017-11-23T12:00:00Z&quot;,
    &quot;Measurement&quot;:500.0
  }
]
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="171" sourceendlinenumber="171">This request will only change the <code>Measurement</code> value at the specified event index.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="173" sourceendlinenumber="174"><strong>Note:</strong><br>Patching is used to patch the events of the selected fields for one or more events in the stream. Only the fields indicated in <code>selectExpression</code> are modified. The events to be modified are indicated by the index value of each entry in the collection. If there is a problem patching any individual event, the entire operation is rolled back and the error will indicate the <code>streamId</code> and <code>index</code> of the problem.  </p>
<hr>
<h2 id="remove-values" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="177" sourceendlinenumber="177"><code>Remove Values</code></h2>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="179" sourceendlinenumber="179">There are two options for specifying which events to remove from a stream:</p>
<ul sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="181" sourceendlinenumber="182">
<li sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="181" sourceendlinenumber="181"><a href="#removeindexcollection" data-raw-source="[Index Collection](#removeindexcollection)" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="181" sourceendlinenumber="181">Index Collection</a>: One or more indexes can be specified in the request.</li>
<li sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="182" sourceendlinenumber="182"><a href="#removewindow" data-raw-source="[Window](#removewindow)" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="182" sourceendlinenumber="182">Window</a>: A window can be specified with a start index and end index.</li>
</ul>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="184" sourceendlinenumber="184"><a name="removeindexcollection"></a></p>
<h3 id="index-collection" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="186" sourceendlinenumber="186"><code>Index Collection</code></h3>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="188" sourceendlinenumber="188">Removes the event at each index from the specified stream. Different overloads are available to make it easier to indicate the index where you want to remove a data event.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="190" sourceendlinenumber="190"><strong>Request</strong>  </p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="192" sourceendlinenumber="195"><code class="lang-text">DELETE api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
  ?index={index}[&amp;index={index}…]
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="197" sourceendlinenumber="199"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="201" sourceendlinenumber="202"><code>string streamId</code><br>The stream identifier.  </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="204" sourceendlinenumber="205"><code>string index</code><br>One or more indexes of events to remove.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="207" sourceendlinenumber="208"><strong>Response</strong><br>The response includes a status code.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="210" sourceendlinenumber="211"><strong>Note:</strong><br>If any individual event fails to be removed, the entire operation is rolled back and no events are removed. The streamId and index that caused the issue are included in the error response. If you attempt to remove events at indexes that have no events, an error is returned. If this occurs, you can use <a href="#removewindow" data-raw-source="[Window](#removewindow)" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="211" sourceendlinenumber="211">Window</a> request format to remove any events from a specified ‘window’ of indexes, which will not return an error if no data is found.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="213" sourceendlinenumber="213"><a name="removewindow"></a></p>
<h3 id="window" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="215" sourceendlinenumber="215"><code>Window</code></h3>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="217" sourceendlinenumber="217">Removes events at and between the start index and end index.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="219" sourceendlinenumber="219"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="221" sourceendlinenumber="224"><code class="lang-text">DELETE api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
  ?startIndex={startIndex}&amp;endIndex={endIndex}
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="226" sourceendlinenumber="228"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="230" sourceendlinenumber="231"><code>string streamId</code><br>The stream identifier.  </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="233" sourceendlinenumber="234"><code>string startIndex</code><br>The index defining the beginning of the window.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="236" sourceendlinenumber="237"><code>string endIndex</code><br>The index defining the end of the window.  </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="239" sourceendlinenumber="240"><strong>Response</strong><br>The response includes a status code.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="242" sourceendlinenumber="242"><strong>Note:</strong> If any individual event fails to be removed, the entire operation is rolled back and no removes are done.</p>
<hr>
<h2 id="replace-values" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="245" sourceendlinenumber="245"><code>Replace Values</code></h2>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="247" sourceendlinenumber="247">Writes one or more events over existing events in the specified stream.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="249" sourceendlinenumber="249"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="251" sourceendlinenumber="254"><code class="lang-text">PUT api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
  ?allowCreate=false
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="256" sourceendlinenumber="258"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="260" sourceendlinenumber="261"><code>string streamId</code><br>The stream identifier.  </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="263" sourceendlinenumber="264"><strong>Request body</strong>
A serialized list of one or more events of the stream type.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="266" sourceendlinenumber="267"><strong>Response</strong><br>The response includes a status code.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="269" sourceendlinenumber="269"><strong>Note:</strong> This request returns an error if the stream does not have an event to be replaced at the specified index. If any individual event fails to be replaced, the entire operation is rolled back and no replaces are performed. The index that caused the issue and the streamId are included in the error response.</p>
<hr>
<h2 id="update-values" sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="272" sourceendlinenumber="272"><code>Update Values</code></h2>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="274" sourceendlinenumber="274">Writes one or more events to the specified stream.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="276" sourceendlinenumber="276"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="278" sourceendlinenumber="280"><code class="lang-text">PUT api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
</code></pre><p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="282" sourceendlinenumber="284"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="286" sourceendlinenumber="287"><code>string streamId</code><br>The stream identifier.  </p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="289" sourceendlinenumber="290"><strong>Request body</strong><br>A serialized list of one or more events of the stream type.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="292" sourceendlinenumber="293"><strong>Response</strong><br>The response includes a status code.</p>
<p sourcefile="V1/SDS/Write data/Writing_Data_API_1-0.md" sourcestartlinenumber="295" sourceendlinenumber="295"><strong>Note:</strong> This request performs an insert or a replace depending on whether an event already exists at the event indexes. If any item fails to write, the entire operation is rolled back and no events are written to the stream. The index that caused the issue is included in the error response.</p>
<hr>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/SDS/Write data/Writing_Data_API_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
    
    <script type="text/javascript" src="../../../styles/docfx.vendor.js"></script>
    <script type="text/javascript" src="../../../styles/docfx.js"></script>
    <script type="text/javascript" src="../../../styles/main.js"></script>
  </body>
</html>
