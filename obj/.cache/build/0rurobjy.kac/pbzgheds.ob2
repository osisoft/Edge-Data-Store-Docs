<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>SdsStreamView API </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="SdsStreamView API ">
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
            <article class="content wrap" id="_content" data-uid="sdsStreamViewsAPI1-0">
<h1 id="sdsstreamview-api" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">SdsStreamView API</h1>

<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with SdsStreamViews. For general SdsStreamView information, see <a class="xref" href="../SDS_Views_1-0.html" data-raw-source="[Stream views](xref:sdsStreamViews1-0)" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">Stream views</a>.</p>
<hr>
<h2 id="get-stream-view" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="10" sourceendlinenumber="10"><code>Get Stream View</code></h2>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="12" sourceendlinenumber="12">Returns the stream view corresponding to the specified streamViewId within a given namespace.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="14" sourceendlinenumber="14"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="18"><code class="lang-text">GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
</code></pre><p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="22"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="24" sourceendlinenumber="25"><code>string streamViewId</code><br>The stream view identifier.  </p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="27" sourceendlinenumber="28"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="30" sourceendlinenumber="31"><strong>Response body</strong><br>The requested SdsStreamView.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="33">Example response body:</p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="35" sourceendlinenumber="58"><code class="lang-json">HTTP/1.1 200
Content-Type: application/json
{  
   &quot;Id&quot;:&quot;StreamView&quot;,
   &quot;Name&quot;:&quot;StreamView&quot;,
   &quot;SourceTypeId&quot;:&quot;Simple&quot;,
   &quot;TargetTypeId&quot;:&quot;Simple3&quot;,
   &quot;Properties&quot;:[  
      {  
         &quot;SourceId&quot;:&quot;Time&quot;,
         &quot;TargetId&quot;:&quot;Time&quot;
      },
      {  
         &quot;SourceId&quot;:&quot;State&quot;,
         &quot;TargetId&quot;:&quot;State&quot;
      },
      {  
         &quot;SourceId&quot;:&quot;Measurement&quot;,
         &quot;TargetId&quot;:&quot;Value&quot;
      }
   ]
}
</code></pre><hr>
<h2 id="get-stream-view-map" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="62" sourceendlinenumber="62"><code>Get Stream View Map</code></h2>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="64" sourceendlinenumber="64">Returns the stream view map corresponding to the specified streamViewId within a given namespace.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="66" sourceendlinenumber="66"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="68" sourceendlinenumber="70"><code class="lang-text">GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}/Map
</code></pre><p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="72" sourceendlinenumber="74"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="76" sourceendlinenumber="77"><code>string streamViewId</code><br>The stream view identifier.  </p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="79" sourceendlinenumber="80"><strong>Response</strong><br> The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="82" sourceendlinenumber="83"><strong>Response body</strong><br>The requested SdsStreamView.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="85" sourceendlinenumber="85">Example response body:</p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="87" sourceendlinenumber="114"><code class="lang-json">HTTP/1.1 200
Content-Type: application/json

{  
   &quot;SourceTypeId&quot;:&quot;Simple&quot;,
   &quot;TargetTypeId&quot;:&quot;Simple3&quot;,
   &quot;Properties&quot;:[  
      {  
         &quot;SourceId&quot;:&quot;Time&quot;,
         &quot;TargetId&quot;:&quot;Time&quot;
      },
      {  
         &quot;SourceId&quot;:&quot;Measurement&quot;,
         &quot;TargetId&quot;:&quot;Value&quot;,
         &quot;Mode&quot;:20
      },
      {  
         &quot;SourceId&quot;:&quot;State&quot;,
         &quot;Mode&quot;:2
      },
      {  
         &quot;TargetId&quot;:&quot;State&quot;,
         &quot;Mode&quot;:1
      }
   ]
}
</code></pre><hr>
<h2 id="get-stream-views" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="118" sourceendlinenumber="118"><code>Get Stream Views</code></h2>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="120" sourceendlinenumber="120">Returns a list of stream views within a given namespace.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="122" sourceendlinenumber="124">If specifying the optional search query parameter, the list of stream views returned will match
the search criteria. If the search query parameter is not specified, the list will include
all stream views in the Namespace. See <a class="xref" href="../Search_1-0.html" data-raw-source="[Search in SDS](xref:sdsSearching1-0)" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="124" sourceendlinenumber="124">Search in SDS</a> for information about specifying those respective parameters.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="126" sourceendlinenumber="126"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="128" sourceendlinenumber="130"><code class="lang-text">GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews?query={query}&amp;skip={skip}&amp;count={count}&amp;orderby={orderby}
</code></pre><p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="132" sourceendlinenumber="134"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="136" sourceendlinenumber="137"><code>string query</code><br>An optional parameter representing a string search. For information about specifying the search parameter, see <a class="xref" href="../Search_1-0.html" data-raw-source="[Search in SDS](xref:sdsSearching1-0)" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="137" sourceendlinenumber="137">Search in SDS</a>.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="139" sourceendlinenumber="140"><code>int skip</code><br>An optional parameter representing the zero-based offset of the first SdsStreamView to retrieve. If not specified, a default value of 0 is used.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="142" sourceendlinenumber="143"><code>int count</code><br>An optional parameter representing the maximum number of SdsStreamViews to retrieve. If not specified, a default value of 100 is used.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="145" sourceendlinenumber="146"><code>string orderby</code><br>An optional parameter representing sorted order which SdsStreamViews will be returned. A field name is required. The sorting is based   on the stored values for the given field (of type string). For example, <code>orderby=name</code> would sort the returned results by the <code>name</code> values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values <code>asc</code> or <code>desc</code>, respectively. For example, <code>orderby=name desc</code> would sort the returned results by the <code>name</code> values, descending. If no value is specified, there is no sorting of results.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="148" sourceendlinenumber="149"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="151" sourceendlinenumber="152"><strong>Response body</strong><br>A collection of zero or more SdsStreamViews.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="154" sourceendlinenumber="154">Example response body:</p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="156" sourceendlinenumber="187"><code class="lang-json">HTTP/1.1 200
Content-Type: application/json
[  
  {  
     &quot;Id&quot;:&quot;StreamView&quot;,
     &quot;Name&quot;:&quot;StreamView&quot;,
     &quot;SourceTypeId&quot;:&quot;Simple&quot;,
     &quot;TargetTypeId&quot;:&quot;Simple3&quot;
  },
  {  
     &quot;Id&quot;:&quot;StreamViewWithProperties&quot;,
     &quot;Name&quot;:&quot;StreamViewWithProperties&quot;,
     &quot;SourceTypeId&quot;:&quot;Simple&quot;,
     &quot;TargetTypeId&quot;:&quot;Simple3&quot;,
     &quot;Properties&quot;:[  
        {  
           &quot;SourceId&quot;:&quot;Time&quot;,
           &quot;TargetId&quot;:&quot;Time&quot;
        },
        {
           &quot;SourceId&quot;:&quot;State&quot;,
           &quot;TargetId&quot;:&quot;State&quot;
        },
        {
           &quot;SourceId&quot;:&quot;Measurement&quot;,
           &quot;TargetId&quot;:&quot;Value&quot;
        }
     ]
  }
]
</code></pre><hr>
<h2 id="get-or-create-stream-view" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="191" sourceendlinenumber="191"><code>Get or Create Stream View</code></h2>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="193" sourceendlinenumber="193">If a stream view with a matching identifier already exists, the stream view passed in is compared with the existing stream view. If the stream views are identical, a Found (302) status is returned and the stream view. If the stream views are different, the Conflict (409) error is returned.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="195" sourceendlinenumber="195">If no matching identifier is found, the specified stream view is created.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="197" sourceendlinenumber="197"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="199" sourceendlinenumber="201"><code class="lang-text">POST api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
</code></pre><p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="203" sourceendlinenumber="205"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="207" sourceendlinenumber="208"><code>string streamViewId</code><br>The stream view identifier. The identifier must match the <code>SdsStreamView.Id</code> field.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="210" sourceendlinenumber="211"><strong>Request body</strong><br>The request content is the serialized SdsStreamView.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="213" sourceendlinenumber="214"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="216" sourceendlinenumber="217"><strong>Response body</strong><br>The newly created or matching SdsStreamView.</p>
<hr>
<h2 id="create-or-update-stream-view" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="220" sourceendlinenumber="220"><code>Create or Update Stream View</code></h2>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="222" sourceendlinenumber="222">Creates or updates the definition of a stream view.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="224" sourceendlinenumber="224"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="226" sourceendlinenumber="228"><code class="lang-text">PUT api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
</code></pre><p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="230" sourceendlinenumber="232"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="234" sourceendlinenumber="235"><code>string streamViewId</code><br>The stream view identifier.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="237" sourceendlinenumber="238"><strong>Request body</strong><br>The request content is the serialized SdsStreamView.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="240" sourceendlinenumber="241"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="243" sourceendlinenumber="244"><strong>Response body</strong><br>The newly created or updated SdsStreamView.</p>
<hr>
<h2 id="delete-stream-view" sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="247" sourceendlinenumber="247"><code>Delete Stream View</code></h2>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="249" sourceendlinenumber="249">Deletes a stream view from the specified tenant and namespace.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="251" sourceendlinenumber="251"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="253" sourceendlinenumber="255"><code class="lang-text">DELETE api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
</code></pre><p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="257" sourceendlinenumber="259"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="261" sourceendlinenumber="262"><code>string streamViewId</code><br>The stream view identifier.</p>
<p sourcefile="V1/SDS/Views/SDS_Stream_View_API_1-0.md" sourcestartlinenumber="264" sourceendlinenumber="265"><strong>Response</strong><br>The response includes a status code.</p>
<hr>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/SDS/Views/SDS_Stream_View_API_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
