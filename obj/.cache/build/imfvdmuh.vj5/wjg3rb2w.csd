<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Compression </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Compression ">
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
            <article class="content wrap" id="_content" data-uid="sdsCompression1-0">
<h1 id="compression" sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Compression</h1>

<p sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">To more efficiently utilize network bandwidth, the EDS Sequential Data Store supports compression for reading data and writing data through the REST API.</p>
<h2 id="supported-compression-schemes" sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9">Supported compression schemes</h2>
<p sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">the EDS Sequential Data Store supports the following compression schemes:</p>
<ul sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="14">
<li sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13"><code>gzip</code></li>
<li sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="14" sourceendlinenumber="14"><code>deflate</code></li>
</ul>
<h2 id="request-compression-write-data" sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="16">Request compression (write data)</h2>
<p sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="18" sourceendlinenumber="18">Specify the compression scheme in the <strong>Content-Encoding</strong> HTTP header of compressed-content requests. This header provides context to the API to properly decode the request content.</p>
<h2 id="response-compression-read-data" sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="20">Response compression (read data)</h2>
<p sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="22" sourceendlinenumber="22">Request compressed responses from the REST API by specifying one of the supported compression schemes using the <strong>Accept-Encoding</strong> HTTP header. Compressed responses from the REST API include a <strong>Content-Encoding</strong> HTTP header indicating the compression scheme used to compress the response content.</p>
<p sourcefile="V1/SDS/Compression_1-0.md" sourcestartlinenumber="24" sourceendlinenumber="24"><strong>Note:</strong> Specifying a compression scheme with the <strong>Accept-Encoding</strong> HTTP header does not guarantee a compressed response. Always refer to presence and value of the <strong>Content-Encoding</strong> HTTP header of the response to properly decode the response content.</p>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/SDS/Compression_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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