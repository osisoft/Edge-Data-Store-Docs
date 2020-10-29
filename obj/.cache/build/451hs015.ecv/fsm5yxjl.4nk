<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>SdsType API </title>
    <meta name="viewport" content="width=device-width">
    <meta name="title" content="SdsType API ">
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
            <article class="content wrap" id="_content" data-uid="sdsTypeAPI1-0">
<h1 id="sdstype-api" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="5" sourceendlinenumber="5">SdsType API</h1>

<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">The REST APIs provide programmatic access to read and write SDS data. The following APIs interact with SdsTypes. See <a class="xref" href="../SDS_Types_1-0.html" data-raw-source="[Types](xref:sdsTypes1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="7" sourceendlinenumber="7">Types</a> for general SdsType information.</p>
<hr>
<h2 id="get-type" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="10" sourceendlinenumber="10"><code>Get Type</code></h2>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="12" sourceendlinenumber="12">Returns the type corresponding to the specified typeId within a given namespace.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="14" sourceendlinenumber="14"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="16" sourceendlinenumber="18"><code class="lang-text">GET api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}
</code></pre><p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="20" sourceendlinenumber="22"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="24" sourceendlinenumber="25"><code>string typeId</code><br>The type identifier.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="27" sourceendlinenumber="28"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="30" sourceendlinenumber="31"><strong>Response body</strong><br>The requested SdsType.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="33" sourceendlinenumber="33">Example response body:</p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="35" sourceendlinenumber="88"><code class="lang-json">HTTP/1.1 200
Content-Type: application/json

{
    &quot;Id&quot;: &quot;Simple&quot;,
    &quot;Name&quot;: &quot;Simple&quot;,
    &quot;SdsTypeCode&quot;: 1,
    &quot;Properties&quot;: [
        {
            &quot;Id&quot;: &quot;Time&quot;,
            &quot;Name&quot;: &quot;Time&quot;,
            &quot;IsKey&quot;: true,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;19a87a76-614a-385b-ba48-6f8b30ff6ab2&quot;,
                &quot;Name&quot;: &quot;DateTime&quot;,
                &quot;SdsTypeCode&quot;: 16
            }
        },
        {
            &quot;Id&quot;: &quot;State&quot;,
            &quot;Name&quot;: &quot;State&quot;,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;e20bdd7e-590b-3372-ab39-ff61950fb4f3&quot;,
                &quot;Name&quot;: &quot;State&quot;,
                &quot;SdsTypeCode&quot;: 609,
                &quot;Properties&quot;: [
                    {
                        &quot;Id&quot;: &quot;Ok&quot;,
                        &quot;Value&quot;: 0
                    },
                    {
                        &quot;Id&quot;: &quot;Warning&quot;,
                        &quot;Value&quot;: 1
                    },
                    {
                        &quot;Id&quot;: &quot;Alarm&quot;,
                        &quot;Value&quot;: 2
                    }
                ]
            }
        },
        {
            &quot;Id&quot;: &quot;Measurement&quot;,
            &quot;Name&quot;: &quot;Measurement&quot;,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;6fecef77-20b1-37ae-aa3b-e6bb838d5a86&quot;,
                &quot;Name&quot;: &quot;Double&quot;,
                &quot;SdsTypeCode&quot;: 14
            }
        }
    ]
}
</code></pre><hr>
<h2 id="get-type-reference-count" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="92" sourceendlinenumber="92"><code>Get Type Reference Count</code></h2>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="94" sourceendlinenumber="94">Returns a dictionary mapping the object name to the number of references held by streams, stream views, and parent types for the specified type. For more information on the use of types to define streams and stream views, see <a class="xref" href="../SDS_Streams_1-0.html" data-raw-source="[Streams](xref:sdsStreams1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="94" sourceendlinenumber="94">Streams</a> and <a class="xref" href="../SDS_Views_1-0.html" data-raw-source="[Stream views](xref:sdsStreamViews1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="94" sourceendlinenumber="94">Stream views</a>. For further details about type referencing, see <a class="xref" href="SDS_Type_reusability_1-0.html" data-raw-source="[Type reusability](xref:sdsTypeReusability1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="94" sourceendlinenumber="94">Type reusability</a>.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="96" sourceendlinenumber="96"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="98" sourceendlinenumber="100"><code class="lang-text">GET api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}/ReferenceCount
</code></pre><p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="102" sourceendlinenumber="104"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="106" sourceendlinenumber="107"><code>string typeId</code><br>The type identifier.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="109" sourceendlinenumber="110"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="112" sourceendlinenumber="113"><strong>Response body</strong><br>A dictionary mapping object name to number of references.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="115" sourceendlinenumber="115">Example response body:</p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="117" sourceendlinenumber="123"><code class="lang-json">    {
        &quot;SdsStream&quot;: 3,
        &quot;SdsStreamView&quot;: 2,
        &quot;SdsType&quot;: 1
    }
</code></pre><hr>
<h2 id="get-types" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="127" sourceendlinenumber="127"><code>Get Types</code></h2>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="129" sourceendlinenumber="129">Returns a list of types within a given namespace.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="131" sourceendlinenumber="131">If you specify the optional search query parameter, the list of types returned will match the search criteria. If you do not specify the search query parameter, the list will include all types in the namespace. For information about specifying those respective parameters, see <a class="xref" href="../Search_1-0.html" data-raw-source="[Search in SDS](xref:sdsSearching1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="131" sourceendlinenumber="131">Search in SDS</a>.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="133" sourceendlinenumber="133"><strong>Note:</strong> The results will also include types that were automatically created by SDS as a result of type referencing. For further details about type referencing, see <a class="xref" href="SDS_Type_reusability_1-0.html" data-raw-source="[Type reusability](xref:sdsTypeReusability1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="133" sourceendlinenumber="133">Type reusability</a>.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="135" sourceendlinenumber="135"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="137" sourceendlinenumber="139"><code class="lang-text">GET api/v1/Tenants/default/Namespaces/{namespaceId}/Types?query={query}&amp;skip={skip}&amp;count={count}&amp;orderby={orderby}
</code></pre><p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="141" sourceendlinenumber="143"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="145" sourceendlinenumber="146"><code>string query</code><br>An optional query string to match which SdsTypes will be returned. For information about specifying the query parameter, see <a class="xref" href="../Search_1-0.html" data-raw-source="[Search in SDS](xref:sdsSearching1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="146" sourceendlinenumber="146">Search in SDS</a>.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="148" sourceendlinenumber="149"><code>int skip</code><br>An optional value representing the zero-based offset of the first SdsType to retrieve. If not specified, a default value of 0 is used.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="151" sourceendlinenumber="152"><code>int count</code><br>An optional value representing the maximum number of SdsTypes to retrieve. If not specified, a default value of 100 is used.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="154" sourceendlinenumber="155"><code>string orderby</code><br>An optional parameter representing sorted order which SdsTypes will be returned. A field name is required. The sorting is based on the stored values for the given field (of type string). For example, <code>orderby=name</code> would sort the returned results by the <code>name</code> values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values <code>asc</code> or <code>desc</code>, respectively. For example, <code>orderby=name desc</code> would sort the returned results by the <code>name</code> values, descending. If no value is specified, there is no sorting of results.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="157" sourceendlinenumber="158"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="160" sourceendlinenumber="161"><strong>Response body</strong><br>A collection of zero or more SdsTypes.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="163" sourceendlinenumber="163">Example response body:</p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="165" sourceendlinenumber="220"><code class="lang-json">HTTP/1.1 200
Content-Type: application/json

[
    {
        &quot;Id&quot;: &quot;Simple&quot;,
        &quot;Name&quot;: &quot;Simple&quot;,
        &quot;SdsTypeCode&quot;: 1,
        &quot;Properties&quot;: [
            {
                &quot;Id&quot;: &quot;Time&quot;,
                &quot;Name&quot;: &quot;Time&quot;,
                &quot;IsKey&quot;: true,
                &quot;SdsType&quot;: {
                    &quot;Id&quot;: &quot;19a87a76-614a-385b-ba48-6f8b30ff6ab2&quot;,
                    &quot;Name&quot;: &quot;DateTime&quot;,
                    &quot;SdsTypeCode&quot;: 16
                }
            },
            {
                &quot;Id&quot;: &quot;State&quot;,
                &quot;Name&quot;: &quot;State&quot;,
                &quot;SdsType&quot;: {
                    &quot;Id&quot;: &quot;e20bdd7e-590b-3372-ab39-ff61950fb4f3&quot;,
                    &quot;Name&quot;: &quot;State&quot;,
                    &quot;SdsTypeCode&quot;: 609,
                    &quot;Properties&quot;: [
                        {
                            &quot;Id&quot;: &quot;Ok&quot;,
                            &quot;Value&quot;: 0
                        },
                        {
                            &quot;Id&quot;: &quot;Warning&quot;,
                            &quot;Value&quot;: 1
                        },
                        {
                            &quot;Id&quot;: &quot;Alarm&quot;,
                            &quot;Value&quot;: 2
                        }
                    ]
                }
            },
            {
                &quot;Id&quot;: &quot;Measurement&quot;,
                &quot;Name&quot;: &quot;Measurement&quot;,
                &quot;SdsType&quot;: {
                    &quot;Id&quot;: &quot;6fecef77-20b1-37ae-aa3b-e6bb838d5a86&quot;,
                    &quot;Name&quot;: &quot;Double&quot;,
                    &quot;SdsTypeCode&quot;: 14
                }
            }
        ]
    },
]
</code></pre><hr>
<h2 id="get-or-create-type" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="224" sourceendlinenumber="224"><code>Get or Create Type</code></h2>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="226" sourceendlinenumber="226">Creates the specified type. If a type with a matching identifier already exists, SDS compares the existing type with the type that was sent.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="228" sourceendlinenumber="228">If the types are identical, a <code>Found</code> (302) error is returned with the Location header set to the URI where the type may be retrieved using a Get function.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="230" sourceendlinenumber="230">If the types do not match, a <code>Conflict</code> (409) error is returned. <strong>Note:</strong> A <code>Conflict</code> (409) error will also be returned if the type contains reference to any existing type, but the referenced type definition in the body does not match the existing type. You may reference an existing type without including the reference type definition in the body by using only the Ids. For further details about type referencing, see <a class="xref" href="SDS_Type_reusability_1-0.html" data-raw-source="[Type reusability](xref:sdsTypeReusability1-0)" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="230" sourceendlinenumber="230">Type reusability</a>.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="232" sourceendlinenumber="232">For a matching type (<code>Found</code>), clients that are capable of performing a redirect that includes the authorization header can automatically redirect to retrieve the type. However, most clients, including the .NET HttpClient, consider redirecting with the authorization token to be a security vulnerability.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="234" sourceendlinenumber="234">When a client performs a redirect and strips the authorization header, SDS cannot authorize the request and returns <code>Unauthorized</code> (401). For this reason, OSIsoft recommends that when using clients that do not redirect with the authorization header, you should disable automatic redirect and perform the redirect manually.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="236" sourceendlinenumber="236"><strong>Request</strong>  </p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="238" sourceendlinenumber="240"><code class="lang-text">POST api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}
</code></pre><p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="242" sourceendlinenumber="244"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="246" sourceendlinenumber="247"><code>string typeId</code><br>The type identifier. The identifier must match the <code>SdsType.Id</code> field in the request body.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="249" sourceendlinenumber="250"><strong>Request body</strong><br>The request content is the serialized SdsType.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="252" sourceendlinenumber="252">Example SdsType content:</p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="254" sourceendlinenumber="304"><code class="lang-json">{
    &quot;Id&quot;: &quot;Simple&quot;,
    &quot;Name&quot;: &quot;Simple&quot;,
    &quot;SdsTypeCode&quot;: 1,
    &quot;Properties&quot;: [
        {
            &quot;Id&quot;: &quot;Time&quot;,
            &quot;Name&quot;: &quot;Time&quot;,
            &quot;IsKey&quot;: true,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;19a87a76-614a-385b-ba48-6f8b30ff6ab2&quot;,
                &quot;Name&quot;: &quot;DateTime&quot;,
                &quot;SdsTypeCode&quot;: 16
            }
        },
        {
            &quot;Id&quot;: &quot;State&quot;,
            &quot;Name&quot;: &quot;State&quot;,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;e20bdd7e-590b-3372-ab39-ff61950fb4f3&quot;,
                &quot;Name&quot;: &quot;State&quot;,
                &quot;SdsTypeCode&quot;: 609,
                &quot;Properties&quot;: [
                    {
                        &quot;Id&quot;: &quot;Ok&quot;,
                        &quot;Value&quot;: 0
                    },
                    {
                        &quot;Id&quot;: &quot;Warning&quot;,
                        &quot;Value&quot;: 1
                    },
                    {
                        &quot;Id&quot;: &quot;Alarm&quot;,
                        &quot;Value&quot;: 2
                    }
                ]
            }
        },
        {
            &quot;Id&quot;: &quot;Measurement&quot;,
            &quot;Name&quot;: &quot;Measurement&quot;,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;6fecef77-20b1-37ae-aa3b-e6bb838d5a86&quot;,
                &quot;Name&quot;: &quot;Double&quot;,
                &quot;SdsTypeCode&quot;: 14
            }
        }
    ]
}
</code></pre><p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="306" sourceendlinenumber="307"><strong>Response</strong><br>The response includes a status code and a response body.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="309" sourceendlinenumber="310"><strong>Response body</strong><br>The request content is the serialized SdsType. OSIsoft recommends that you use JSON.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="312" sourceendlinenumber="312">Example Response body:</p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="314" sourceendlinenumber="445"><code class="lang-json">HTTP/1.1 201
Content-Type: application/json

{
    &quot;Id&quot;: &quot;Simple&quot;,
    &quot;Name&quot;: &quot;Simple&quot;,
    &quot;Description&quot;: null,
    &quot;SdsTypeCode&quot;: 1,
    &quot;IsGenericType&quot;: false,
    &quot;IsReferenceType&quot;: false,
    &quot;GenericArguments&quot;: null,
    &quot;Properties&quot;: [
        {
            &quot;Id&quot;: &quot;Time&quot;,
            &quot;Name&quot;: &quot;Time&quot;,
            &quot;Description&quot;: null,
            &quot;Order&quot;: 0,
            &quot;IsKey&quot;: true,
            &quot;FixedSize&quot;: 0,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;19a87a76-614a-385b-ba48-6f8b30ff6ab2&quot;,
                &quot;Name&quot;: &quot;DateTime&quot;,
                &quot;Description&quot;: null,
                &quot;SdsTypeCode&quot;: 16,
                &quot;IsGenericType&quot;: false,
                &quot;IsReferenceType&quot;: false,
                &quot;GenericArguments&quot;: null,
                &quot;Properties&quot;: null,
                &quot;BaseType&quot;: null,
                &quot;DerivedTypes&quot;: null,
                &quot;InterpolationMode&quot;: 0,
                &quot;ExtrapolationMode&quot;: 0
            },
            &quot;Value&quot;: null,
            &quot;Uom&quot;: null,
            &quot;InterpolationMode&quot;: null
        },
        {
            &quot;Id&quot;: &quot;State&quot;,
            &quot;Name&quot;: &quot;State&quot;,
            &quot;Description&quot;: null,
            &quot;Order&quot;: 0,
            &quot;IsKey&quot;: false,
            &quot;FixedSize&quot;: 0,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;e20bdd7e-590b-3372-ab39-ff61950fb4f3&quot;,
                &quot;Name&quot;: &quot;State&quot;,
                &quot;Description&quot;: null,
                &quot;SdsTypeCode&quot;: 609,
                &quot;IsGenericType&quot;: false,
                &quot;IsReferenceType&quot;: false,
                &quot;GenericArguments&quot;: null,
                &quot;Properties&quot;: [
                    {
                        &quot;Id&quot;: &quot;Ok&quot;,
                        &quot;Name&quot;: null,
                        &quot;Description&quot;: null,
                        &quot;Order&quot;: 0,
                        &quot;IsKey&quot;: false,
                        &quot;FixedSize&quot;: 0,
                        &quot;SdsType&quot;: null,
                        &quot;Value&quot;: 0,
                        &quot;Uom&quot;: null,
                        &quot;InterpolationMode&quot;: null
                    },
                    {
                        &quot;Id&quot;: &quot;Warning&quot;,
                        &quot;Name&quot;: null,
                        &quot;Description&quot;: null,
                        &quot;Order&quot;: 0,
                        &quot;IsKey&quot;: false,
                        &quot;FixedSize&quot;: 0,
                        &quot;SdsType&quot;: null,
                        &quot;Value&quot;: 1,
                        &quot;Uom&quot;: null,
                        &quot;InterpolationMode&quot;: null
                    },
                    {
                        &quot;Id&quot;: &quot;Alarm&quot;,
                        &quot;Name&quot;: null,
                        &quot;Description&quot;: null,
                        &quot;Order&quot;: 0,
                        &quot;IsKey&quot;: false,
                        &quot;FixedSize&quot;: 0,
                        &quot;SdsType&quot;: null,
                        &quot;Value&quot;: 2,
                        &quot;Uom&quot;: null,
                        &quot;InterpolationMode&quot;: null
                    }
                ],
                &quot;BaseType&quot;: null,
                &quot;DerivedTypes&quot;: null,
                &quot;InterpolationMode&quot;: 0,
                &quot;ExtrapolationMode&quot;: 0
            },
            &quot;Value&quot;: null,
            &quot;Uom&quot;: null,
            &quot;InterpolationMode&quot;: null
        },
        {
            &quot;Id&quot;: &quot;Measurement&quot;,
            &quot;Name&quot;: &quot;Measurement&quot;,
            &quot;Description&quot;: null,
            &quot;Order&quot;: 0,
            &quot;IsKey&quot;: false,
            &quot;FixedSize&quot;: 0,
            &quot;SdsType&quot;: {
                &quot;Id&quot;: &quot;6fecef77-20b1-37ae-aa3b-e6bb838d5a86&quot;,
                &quot;Name&quot;: &quot;Double&quot;,
                &quot;Description&quot;: null,
                &quot;SdsTypeCode&quot;: 14,
                &quot;IsGenericType&quot;: false,
                &quot;IsReferenceType&quot;: false,
                &quot;GenericArguments&quot;: null,
                &quot;Properties&quot;: null,
                &quot;BaseType&quot;: null,
                &quot;DerivedTypes&quot;: null,
                &quot;InterpolationMode&quot;: 0,
                &quot;ExtrapolationMode&quot;: 0
            },
            &quot;Value&quot;: null,
            &quot;Uom&quot;: null,
            &quot;InterpolationMode&quot;: null
        }
    ],
    &quot;BaseType&quot;: null,
    &quot;DerivedTypes&quot;: null,
    &quot;InterpolationMode&quot;: 0,
    &quot;ExtrapolationMode&quot;: 0
}
</code></pre><hr>
<h2 id="delete-type" sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="449" sourceendlinenumber="449"><code>Delete Type</code></h2>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="451" sourceendlinenumber="451">Deletes a type from the specified tenant and namespace. Note that a type cannot be deleted if any streams, stream views, or other types reference it.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="453" sourceendlinenumber="453"><strong>Request</strong></p>
<pre sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="455" sourceendlinenumber="457"><code class="lang-text">DELETE api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}
</code></pre><p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="459" sourceendlinenumber="461"><strong>Parameters</strong><br><code>string namespaceId</code><br>The namespace; either default or diagnostics.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="463" sourceendlinenumber="464"><code>string typeId</code><br>The type identifier.</p>
<p sourcefile="V1/SDS/Types/SDSType_API_1-0.md" sourcestartlinenumber="466" sourceendlinenumber="467"><strong>Response</strong><br>The response includes a status code.</p>
<hr>
</article>
          </div>
          
          <div class="hidden-sm col-md-2" role="complementary">
            <div class="sideaffix">
              <div class="contribution">
                <ul class="nav">
                  <li>
                    <a href="https://github.com/osisoft/Edge-Data-Store-Docs/blob/master/V1/SDS/Types/SDSType_API_1-0.md/#L1" class="contribution-link">Improve this Doc</a>
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
