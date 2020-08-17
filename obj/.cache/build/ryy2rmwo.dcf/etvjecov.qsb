<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Storage runtime configuration </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="Storage runtime configuration ">
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
            <article class="content wrap" id="_content" data-uid="storageruntime1-0">
<h1 id="storage-runtime-configuration" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">Storage runtime configuration</h1>

<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">The Edge Data Store storage component is install with default configurations that are sufficient for most scenarios; however, the runtime characteristics of the storage component can be configured.  </p>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="9" sourceendlinenumber="9"><strong>Note:</strong> Consult with OSIsoft Support personnel before modifying the default configuration.</p>
<h2 id="configure-storage-runtime" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="11" sourceendlinenumber="11">Configure storage runtime</h2>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="13" sourceendlinenumber="13">To update the storage runtime configuration, complete the following:</p>
<ol sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="27">
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="18"><p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="15" sourceendlinenumber="15">Create a JSON file with the storage runtime configuration.</p>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="17" sourceendlinenumber="18"><strong>Note:</strong> See the following <em>Parameters</em> table for all available runtime parameters to define.
       See the following <em>Examples</em> section for an example of a valid runtime configuration file.</p>
</li>
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="20"><p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="20">Save the JSON file with the name Storage_Runtime.config.json.</p>
</li>
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="21" sourceendlinenumber="27"><p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="21" sourceendlinenumber="21">From the same directory where the file exists, run the following curl script:</p>
<pre sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="23" sourceendlinenumber="25"><code class="lang-bash">curl -i -d &quot;@Storage_Runtime.config.json&quot; -H &quot;Content-Type: application/json&quot; -X PUT http://localhost:5590/api/v1/configuration/storage/Runtime
</code></pre><p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="27" sourceendlinenumber="27"><strong>Note:</strong> The @ symbol is a required prefix for the above command.</p>
</li>
</ol>
<h3 id="parameters" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="29" sourceendlinenumber="29">Parameters</h3>
<table sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="31" sourceendlinenumber="38">
<thead>
<tr>
<th>Parameter</th>
<th>Required</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>IngressDebugExpiration</strong></td>
<td>Required</td>
<td>string</td>
<td>If set, defines how long OMF ingress debug files should be produced.</td>
</tr>
<tr>
<td><strong>StreamStorageLimitMb</strong></td>
<td>Required</td>
<td>integer</td>
<td>The maximum size in megabytes that a stream can reach.</td>
</tr>
<tr>
<td><strong>StreamStorageTargetMb</strong></td>
<td>Required</td>
<td>integer</td>
<td>The size in megabytes that a stream will be reduced to after StreamStorageLimitMb size is reached for a single stream.</td>
</tr>
<tr>
<td><strong>EnableTransactionLog</strong></td>
<td>No</td>
<td>Boolean</td>
<td>Enables or disables the transaction log. The transaction log helps to ensure no data is lost should a device lose power.</td>
</tr>
<tr>
<td><strong>TransactionLogLimitMB</strong></td>
<td>No</td>
<td>integer</td>
<td>Maximum size for transaction log file. Transaction log files larger than this size will be deleted, resulting is loss of data should the device lose power.</td>
</tr>
<tr>
<td><strong>CheckpointRateInSec</strong></td>
<td>No</td>
<td>integer</td>
<td>How often to flush new data to store.</td>
</tr>
</tbody>
</table>
<h3 id="examples" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="41" sourceendlinenumber="41">Examples</h3>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="43" sourceendlinenumber="43">The following is a valid runtime configuration example.</p>
<pre sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="45" sourceendlinenumber="54"><code>{
  &quot;streamStorageLimitMb&quot;: 2,
  &quot;streamStorageTargetMb&quot;: 1,
  &quot;ingressDebugExpiration&quot;: &quot;0001-01-01T00:00:00&quot;,
  &quot;checkpointRateInSec&quot;: 30,
  &quot;transactionLogLimitMB&quot;: 250,
  &quot;enableTransactionLog&quot;: true
}
</code></pre><h2 id="storage-runtime-configuration-properties" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="56" sourceendlinenumber="56">Storage runtime configuration properties</h2>
<table sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="58" sourceendlinenumber="65">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Required</th>
<th>Nullable</th>
<th>Defined by</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="#ingressdebugexpiration" data-raw-source="[IngressDebugExpiration](#ingressdebugexpiration)" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="60" sourceendlinenumber="60">IngressDebugExpiration</a></td>
<td><code>string</code></td>
<td><strong>Required</strong></td>
<td>No</td>
<td>StorageRuntimeConfiguration (this schema)</td>
</tr>
<tr>
<td><a href="#streamstoragelimitmb" data-raw-source="[StreamStorageLimitMb](#streamstoragelimitmb)" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="61" sourceendlinenumber="61">StreamStorageLimitMb</a></td>
<td><code>integer</code></td>
<td><strong>Required</strong></td>
<td>No</td>
<td>StorageRuntimeConfiguration (this schema)</td>
</tr>
<tr>
<td><a href="#streamstoragetargetmb" data-raw-source="[StreamStorageTargetMb](#streamstoragetargetmb)" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="62" sourceendlinenumber="62">StreamStorageTargetMb</a></td>
<td><code>integer</code></td>
<td><strong>Required</strong></td>
<td>No</td>
<td>StorageRuntimeConfiguration (this schema)</td>
</tr>
<tr>
<td><a href="#enabletransactionlog" data-raw-source="[EnableTransactionLog](#enabletransactionlog)" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="63" sourceendlinenumber="63">EnableTransactionLog</a></td>
<td><code>bool</code></td>
<td>No</td>
<td>No</td>
<td>StorageRuntimeConfiguration (this schema)</td>
</tr>
<tr>
<td><a href="#transactionloglimitmb" data-raw-source="[TransactionLogLimitMB](#transactionloglimitmb)" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="64" sourceendlinenumber="64">TransactionLogLimitMB</a></td>
<td><code>integer</code></td>
<td>No</td>
<td>No</td>
<td>StorageRuntimeConfiguration (this schema)</td>
</tr>
<tr>
<td><a href="#checkpointrateinsec" data-raw-source="[CheckpointRateInSec](#checkpointrateinsec)" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="65" sourceendlinenumber="65">CheckpointRateInSec</a></td>
<td><code>integer</code></td>
<td>No</td>
<td>No</td>
<td>StorageRuntimeConfiguration (this schema)</td>
</tr>
</tbody>
</table>
<h3 id="ingressdebugexpiration" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="67" sourceendlinenumber="67">IngressDebugExpiration</h3>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="69" sourceendlinenumber="69">Use the Ingress Debug Expiration property when debugging OMF to set the date and time when debugging should be disabled. If a future date and time is is specified, incoming OMF messages are logged and HTTP request and response content is stored to disk for review. The debug logging stops at the data and time specified. Set the value to <em>null</em> to disable logging.</p>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="71" sourceendlinenumber="71">Examples of valid strings representing date and time:</p>
<pre sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="73" sourceendlinenumber="75"><code>UTC: “yyyy-mm-ddThh:mm:ssZ”

Local: “mm-dd-yyyy hh:mm:ss”
</code></pre><p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="77" sourceendlinenumber="77">When logging is activated, the content of an incoming OMF message, including the headers, is written to a file in the Logs directory. For an active application, this file can become quite large. As a result, debug information is stored to disk in another format than usual log messages. A single file is written to the usual logs directory for every incoming OMF type, container, and data message.</p>
<h4 id="ingressdebugexpiration-type" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="79" sourceendlinenumber="79">IngressDebugExpiration type</h4>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="81" sourceendlinenumber="81"><code>string</code></p>
<ul sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="83" sourceendlinenumber="84">
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="83" sourceendlinenumber="83">format: <code>date-time</code> date and time (according to <a href="http://tools.ietf.org/html/rfc3339" data-raw-source="[RFC 3339, section 5.6](http://tools.ietf.org/html/rfc3339)" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="83" sourceendlinenumber="83">RFC 3339, section 5.6</a>)</li>
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="84" sourceendlinenumber="84">minimum length: 1 character</li>
</ul>
<h3 id="streamstoragelimitmb" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="86" sourceendlinenumber="86">StreamStorageLimitMb</h3>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="88" sourceendlinenumber="88">Use the StreamStorageLimitMb property to set the maximum size in megabytes that a stream can reach. When a stream exceeds the size specified, older data is deleted from the file until the stream is at or below the StreamStorageTargetMb value. The target value, set in the StreamStorageTargetMb property, needs to be smaller than the maximum specified in this property.</p>
<h4 id="streamstoragelimitmb-type" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="90" sourceendlinenumber="90">StreamStorageLimitMb type</h4>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="92" sourceendlinenumber="92"><code>integer</code></p>
<ul sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="94" sourceendlinenumber="95">
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="94" sourceendlinenumber="94">minimum value: <code>2</code></li>
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="95" sourceendlinenumber="95">maximum value: <code>2147483647</code></li>
</ul>
<h3 id="streamstoragetargetmb" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="97" sourceendlinenumber="97">StreamStorageTargetMb</h3>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="99" sourceendlinenumber="99">Use the StreamStorageTargetMb property to set the size in megabytes that a stream will be reduced to after StreamStorageLimitMb size is reached for a single stream. When a stream exceeds the size specified in the StreamStorageLimitMb property, older data is deleted from the file until the stream is at or below the StreamStorageTargetMb value. The target value needs to be smaller than the maximum specified in the StreamStorageLimitMb property.</p>
<h4 id="streamstoragetargetmb-type" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="101" sourceendlinenumber="101">StreamStorageTargetMb type</h4>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="103" sourceendlinenumber="103"><code>integer</code></p>
<ul sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="105" sourceendlinenumber="106">
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="105" sourceendlinenumber="105">minimum value: <code>1</code></li>
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="106" sourceendlinenumber="106">maximum value: <code>2147483647</code></li>
</ul>
<h3 id="enabletransactionlog" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="108" sourceendlinenumber="108">EnableTransactionLog</h3>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="110" sourceendlinenumber="110">Use the EnableTransactionLog property to define whether the Storage component maintains a transaction log between checkpoint operations. The transaction log helps the product reduce data loss, should the host device lose power.</p>
<h4 id="enabletransactionlog-type" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="112" sourceendlinenumber="112">EnableTransactionLog type</h4>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="114" sourceendlinenumber="114"><code>bool</code></p>
<h3 id="transactionloglimitmb" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="116" sourceendlinenumber="116">TransactionLogLimitMB</h3>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="118" sourceendlinenumber="118">Use the TransactionLogLimitMB property to define the maximum size, in MB, of a transaction log. When a transaction log exceeds this size, it is deleted, which reduces the amount of data that can be recovered should the host device lose power.</p>
<h4 id="transactionloglimitmb-type" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="120" sourceendlinenumber="120">TransactionLogLimitMB type</h4>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="122" sourceendlinenumber="122"><code>integer</code></p>
<ul sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="124" sourceendlinenumber="125">
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="124" sourceendlinenumber="124">minimum value: <code>1</code></li>
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="125" sourceendlinenumber="125">maximum value: <code>2147483647</code></li>
</ul>
<h3 id="checkpointrateinsec" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="127" sourceendlinenumber="127">CheckpointRateInSec</h3>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="129" sourceendlinenumber="129">Use the CheckpointRateInSec property to define, in seconds, how often the storage component ensures recent data and configuration changes are flushed to storage.  </p>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="131" sourceendlinenumber="131">A setting of 0 disables checkpointing. Disabling checkpointing reduces the resiliency of the product and thus data loss can occur if the host device loses power.</p>
<h4 id="checkpointrateinsec-type" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="133" sourceendlinenumber="133">CheckpointRateInSec type</h4>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="135" sourceendlinenumber="135"><code>integer</code></p>
<ul sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="137" sourceendlinenumber="138">
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="137" sourceendlinenumber="137">minimum value: <code>0</code></li>
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="138" sourceendlinenumber="138">maximum value: <code>86400</code></li>
</ul>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="140" sourceendlinenumber="140"><strong>Note:</strong> All of the following <em>requirements</em> need to be fulfilled.</p>
<h5 id="requirement-1" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="142" sourceendlinenumber="142">Requirement 1</h5>
<ul sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="144" sourceendlinenumber="144">
<li sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="144" sourceendlinenumber="144"><a href="" data-raw-source="[]()" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="144" sourceendlinenumber="144"></a> <code>#/definitions/EdgeConfigurationBase</code></li>
</ul>
<h5 id="requirement-2" sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="146" sourceendlinenumber="146">Requirement 2</h5>
<p sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="148" sourceendlinenumber="148"><code>object</code> with following properties:</p>
<table sourcefile="V1/Configuration/Storage runtime config_1-0.md" sourcestartlinenumber="150" sourceendlinenumber="157">
<thead>
<tr>
<th>Property</th>
<th>Type</th>
<th>Required</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>IngressDebugExpiration</code></td>
<td>string</td>
<td><strong>Required</strong></td>
</tr>
<tr>
<td><code>StreamStorageLimitMb</code></td>
<td>integer</td>
<td><strong>Required</strong></td>
</tr>
<tr>
<td><code>StreamStorageTargetMb</code></td>
<td>integer</td>
<td><strong>Required</strong></td>
</tr>
<tr>
<td><code>EnableTransactionLog</code></td>
<td>Boolean</td>
<td>Optional</td>
</tr>
<tr>
<td><code>TransactionLogLimitMB</code></td>
<td>integer</td>
<td>Optional</td>
</tr>
<tr>
<td><code>CheckpointRateInSec</code></td>
<td>integer</td>
<td>Optional</td>
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
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/Configuration/Storage runtime config_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
