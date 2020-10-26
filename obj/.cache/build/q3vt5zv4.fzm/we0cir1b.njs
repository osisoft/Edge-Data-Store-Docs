a   t  a   v     -  �  �    ,  g  |  �  �  �  �  �  �  �  �  e  �  U  k     v   FileAndType�     �{"baseDir":"C:/agent/_work/4/s","file":"V1/Configuration/System port configuration_1-0.md","type":"article","sourceDir":"","destinationDir":""}   -  OriginalFileAndType�   �  �{"baseDir":"C:/agent/_work/4/s","file":"V1/Configuration/System port configuration_1-0.md","type":"article","sourceDir":"","destinationDir":""}   �  Key=     3~/V1/Configuration/System port configuration_1-0.md   ,  LocalPathFromRoot;   g  1V1/Configuration/System port configuration_1-0.md   |  LinkToFiles	   �     �  
LinkToUids	   �     �  FileLinkSources   �  {}   �  UidLinkSources   �  {}   �  Uidsl   e  b[{"name":"SystemPortConfiguration1-0","file":"V1/Configuration/System port configuration_1-0.md"}]   �  ManifestProperties�   U  �{"rawTitle":"<h1 id=\"system-port-configuration\" sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"5\" sourceendlinenumber=\"5\">System port configuration</h1>"}   k  DocumentType	   t   T  �  {"$type":"System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.Object, mscorlib]], mscorlib","conceptual":"\n<p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"7\" sourceendlinenumber=\"7\">The <em>System_Port.json</em> file specifies the port on which Edge Data Store is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default port is 5590. Valid ports are in the range of 1024-65535. </p>\n<h2 id=\"configure-system-port\" sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"9\" sourceendlinenumber=\"9\">Configure system port</h2>\n<p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"11\" sourceendlinenumber=\"11\">Before changing the port, ensure that no other service or application on the device running EDS is using that port because only one application or service can use a port. If you change the port number through the REST API, you must restart EDS.</p>\n<ol sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"13\" sourceendlinenumber=\"30\">\n<li sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"13\" sourceendlinenumber=\"19\"><p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"13\" sourceendlinenumber=\"13\">Using any text editor, create a JSON file based on the following example and enter the new port number:</p>\n<pre sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"15\" sourceendlinenumber=\"19\"><code class=\"lang-json\">{\n  &quot;Port&quot;: 5590\n}\n</code></pre></li>\n<li sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"21\" sourceendlinenumber=\"21\"><p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"21\" sourceendlinenumber=\"21\">Save the JSON file with the name <em>EdgePort.json</em> </p>\n</li>\n<li sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"22\" sourceendlinenumber=\"28\"><p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"22\" sourceendlinenumber=\"22\">Run the following script:</p>\n<pre sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"24\" sourceendlinenumber=\"26\"><code class=\"lang-bash\">curl -i -d &quot;@EdgePort.json&quot; -H &quot;Content-Type: application/json&quot; -X PUT http://localhost:5590/api/v1/configuration/system/port\n</code></pre><p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"28\" sourceendlinenumber=\"28\"> <strong>Note:</strong> The port number in the script must be the current port number, not the new port number in the file.</p>\n</li>\n<li sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"30\" sourceendlinenumber=\"30\"><p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"30\" sourceendlinenumber=\"30\">After the REST command completes, restart EDS for the change to take effect.</p>\n</li>\n</ol>\n<h2 id=\"parameters-for-system-port\" sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"32\" sourceendlinenumber=\"32\">Parameters for system port</h2>\n<p sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"34\" sourceendlinenumber=\"34\">The following parameters is used to specify the system port.</p>\n<table sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"36\" sourceendlinenumber=\"38\">\n<thead>\n<tr>\n<th>Parameter</th>\n<th>Required</th>\n<th>Type</th>\n<th>Nullable</th>\n<th>Description</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><strong>Port</strong></td>\n<td>Required</td>\n<td><code>integer</code></td>\n<td>No</td>\n<td>The TCP port to bind EDS to. (Range [1024,65535]) Example: 5590</td>\n</tr>\n</tbody>\n</table>\n","type":"Conceptual","source":{"$type":"Microsoft.DocAsCode.DataContracts.Common.SourceDetail, Microsoft.DocAsCode.DataContracts.Common","remote":{"$type":"Microsoft.DocAsCode.Common.Git.GitDetail, Microsoft.DocAsCode.Common","path":"V1/Configuration/System port configuration_1-0.md","branch":"master","repo":"https://github.com/osisoft/Edge-Data-Store-Docs"},"startLine":0,"endLine":0,"isExternal":false},"path":"V1/Configuration/System port configuration_1-0.md","documentation":{"$type":"Microsoft.DocAsCode.DataContracts.Common.SourceDetail, Microsoft.DocAsCode.DataContracts.Common","remote":{"$type":"Microsoft.DocAsCode.Common.Git.GitDetail, Microsoft.DocAsCode.Common","path":"V1/Configuration/System port configuration_1-0.md","branch":"master","repo":"https://github.com/osisoft/Edge-Data-Store-Docs"},"startLine":0,"endLine":0,"isExternal":false},"_enableSearch":true,"_docfxVersion":"2.43.2.0","_systemKeys":{"$type":"System.String[], mscorlib","$values":["conceptual","type","source","path","documentation","title","rawTitle","wordCount"]},"title":"System port configuration","rawTitle":"<h1 id=\"system-port-configuration\" sourcefile=\"V1/Configuration/System port configuration_1-0.md\" sourcestartlinenumber=\"5\" sourceendlinenumber=\"5\">System port configuration</h1>","uid":"SystemPortConfiguration1-0"}r  :  {"$type":"System.Collections.Generic.Dictionary`2[[System.String, mscorlib],[System.Object, mscorlib]], mscorlib","IsUserDefinedTitle":false,"XrefSpec":{"$type":"Microsoft.DocAsCode.Plugins.XRefSpec, Microsoft.DocAsCode.Plugins","uid":"SystemPortConfiguration1-0","name":"System port configuration","href":"~/V1/Configuration/System port configuration_1-0.md"}}	   C   