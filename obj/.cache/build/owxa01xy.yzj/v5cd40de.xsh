<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Read characteristics </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Read characteristics ">
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
            <article class="content wrap" id="_content" data-uid="ReadCharacteristics1-0">
<h1 id="read-characteristics" sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Read characteristics</h1>

<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">When data is requested at an index for which no stored event exists, the read characteristics determine whether the result is an error, no event, interpolated event, or extrapolated event. The combination of the type of the index and the interpolation and extrapolation modes of the SdsType and the SdsStream determine the read characteristics.</p>
<h3 id="interpolation" sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">Interpolation</h3>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">Interpolation determines how a stream behaves when asked to return an event at an index between two existing events. InterpolationMode determines how the returned event is constructed. The table below lists InterpolationModes:</p>
<table sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="19">
<thead>
<tr>
<th>Mode</th>
<th>Enumeration value</th>
<th>Operation</th>
</tr>
</thead>
<tbody>
<tr>
<td>Default</td>
<td>0</td>
<td>The default InterpolationMode is Continuous.</td>
</tr>
<tr>
<td>Continuous</td>
<td>0</td>
<td>Interpolates the data using previous and next index values.</td>
</tr>
<tr>
<td>StepwiseContinuousLeading</td>
<td>1</td>
<td>Returns the data from the previous index.</td>
</tr>
<tr>
<td>StepwiseContinuousTrailing</td>
<td>2</td>
<td>Returns the data from the next index.</td>
</tr>
<tr>
<td>Discrete</td>
<td>3</td>
<td>Returns ‘null’.</td>
</tr>
</tbody>
</table>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="21" sourceendlinenumber="21">Note that <code>Continuous</code> cannot return events for values that cannot be interpolated, such as when the type is not numeric.</p>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="23" sourceendlinenumber="23">The table below describes how the <strong>Continuous InterpolationMode</strong> affects indexes that occur between data in a stream:</p>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="25" sourceendlinenumber="25"><strong>InterpolationMode = Continuous or Default</strong></p>
<table sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="27" sourceendlinenumber="38">
<thead>
<tr>
<th>Type</th>
<th>Result for an index between data in a stream</th>
<th>Comment</th>
</tr>
</thead>
<tbody>
<tr>
<td>Numeric Types</td>
<td>Interpolated*</td>
<td>Rounding is done as needed for integer types.</td>
</tr>
<tr>
<td>Time related Types</td>
<td>Interpolated</td>
<td>DateTime, DateTimeOffset, TimeSpan</td>
</tr>
<tr>
<td>Nullable Types</td>
<td>Interpolated**</td>
<td>Limited support for nullable numeric types.</td>
</tr>
<tr>
<td>Array and List Types</td>
<td>No event is returned</td>
<td></td>
</tr>
<tr>
<td>String Type</td>
<td>No event is returned</td>
<td></td>
</tr>
<tr>
<td>Boolean Type</td>
<td>Returns value of nearest index</td>
<td></td>
</tr>
<tr>
<td>Enumeration Types</td>
<td>Returns Enum value at 0</td>
<td>This may have a value for the enumeration.</td>
</tr>
<tr>
<td>GUID</td>
<td>No event is returned</td>
<td></td>
</tr>
<tr>
<td>Version</td>
<td>No event is returned</td>
<td></td>
</tr>
<tr>
<td>IDictionary or IEnumerable</td>
<td>No event is returned</td>
<td>Dictionary, Array, List, and so on.</td>
</tr>
</tbody>
</table>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="40" sourceendlinenumber="40">*When extreme values are involved in an interpolation (for example, Decimal.MaxValue) the call might result in a BadRequest exception.</p>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="42" sourceendlinenumber="42">**For the Continuous interpolation mode, nullable types are interpolated in the same manner as their non-nullable equivalents as long as the values surrounding the requested interpolation index are non-null. If either of the values are null, the interpolated value will be null.</p>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="44" sourceendlinenumber="44">If the InterpolationMode is not assigned, the events are interpolated in the default manner, unless the interpolation mode is overridden in the SdsTypeProperty or the SdsStream. For more information on overriding the interpolation mode on a specific type property, see <a class="xref" href="../Types/SdsTypeProperty_1-0.html" data-raw-source="[SdsTypeProperty](xref:sdsTypeProperty1-0)" sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="44" sourceendlinenumber="44">SdsTypeProperty</a>. For more information on overriding the interpolation mode for a specific stream, see <a class="xref" href="../SDS_Streams_1-0.html" data-raw-source="[Streams](xref:sdsStreams1-0)" sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="44" sourceendlinenumber="44">Streams</a>.</p>
<h3 id="extrapolation" sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="46" sourceendlinenumber="46">Extrapolation</h3>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="48" sourceendlinenumber="48">Extrapolation defines how a stream responds to requests with indexes that precede or follow all data in the steam. ExtrapolationMode acts as a master switch to determine whether extrapolation occurs and at which end of the data.</p>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="50" sourceendlinenumber="50">ExtrapolationMode works with the InterpolationMode to determine how a stream responds. The following tables show how ExtrapolationMode affects returned values for each InterpolationMode value:</p>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="52" sourceendlinenumber="52"><strong>ExtrapolationMode with InterpolationMode = Default (or Continuous), StepwiseContinuousLeading and StepwiseContinuousTrailing</strong> </p>
<table sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="54" sourceendlinenumber="59">
<thead>
<tr>
<th>ExtrapolationMode</th>
<th>Enumeration value</th>
<th>Index before data</th>
<th>Index after data</th>
</tr>
</thead>
<tbody>
<tr>
<td>All</td>
<td>0</td>
<td>Returns first data value</td>
<td>Returns last data value.</td>
</tr>
<tr>
<td>None</td>
<td>1</td>
<td>No event is returned</td>
<td>No event is returned.</td>
</tr>
<tr>
<td>Forward</td>
<td>2</td>
<td>No event is returned</td>
<td>Returns last data value.</td>
</tr>
<tr>
<td>Backward</td>
<td>3</td>
<td>Returns first data value</td>
<td>No event is returned.</td>
</tr>
</tbody>
</table>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="61" sourceendlinenumber="61"><strong>ExtrapolationMode with InterpolationMode = Discrete</strong>  </p>
<table sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="63" sourceendlinenumber="68">
<thead>
<tr>
<th>ExtrapolationMode</th>
<th>Enumeration value</th>
<th>Index before data</th>
<th>Index after data</th>
</tr>
</thead>
<tbody>
<tr>
<td>All</td>
<td>0</td>
<td>No event is returned.</td>
<td>No event is returned.</td>
</tr>
<tr>
<td>None</td>
<td>1</td>
<td>No event is returned.</td>
<td>No event is returned.</td>
</tr>
<tr>
<td>Forward</td>
<td>2</td>
<td>No event is returned.</td>
<td>No event is returned.</td>
</tr>
<tr>
<td>Backward</td>
<td>3</td>
<td>No event is returned.</td>
<td>No event is returned.</td>
</tr>
</tbody>
</table>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="70" sourceendlinenumber="70">If the ExtrapolationMode is not assigned, the events are extrapolated in the default manner, unless the extrapolation mode is overridden on the SdsStream. For more information on overriding the extrapolation mode on a specific stream, see <a class="xref" href="../SDS_Streams_1-0.html" data-raw-source="[Streams](xref:sdsStreams1-0)" sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="70" sourceendlinenumber="70">Streams</a>.</p>
<p sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="72" sourceendlinenumber="72">For additional information about the effect of read characteristics for the available read methods, see <a class="xref" href="Reading_Data_API_1-0.html" data-raw-source="[Read data API](xref:sdsReadingDataApi1-0)" sourcefile="V1/SDS/Read data/Read_characteristics_1-0.md" sourcestartlinenumber="72" sourceendlinenumber="72">Read data API</a>.</p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/SDS/Read data/Read_characteristics_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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