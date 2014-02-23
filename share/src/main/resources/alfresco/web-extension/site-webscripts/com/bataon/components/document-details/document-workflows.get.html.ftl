<@markup id="css" >
   <#-- CSS Dependencies -->
   <@link href="${url.context}/res/components/document-details/document-workflows.css" group="document-details"/>
</@>

<@markup id="js">
   <#-- JavaScript Dependencies -->
   <@script src="${url.context}/res/components/document-details/document-workflows.js" group="document-details"/>
</@>

<@markup id="widgets">
   <#if workflows??>
      <@createWidgets group="document-details"/>
      <@inlineScript group="document-details">
         YAHOO.util.Event.onContentReady("${args.htmlid?js_string}-heading", function() {
            Alfresco.util.createTwister("${args.htmlid?js_string}-heading", "DocumentWorkflows");
         });
      </@>
   </#if>
</@>

<@markup id="html">
   <@uniqueIdDiv>
      <#if workflows??>
         <#include "/org/alfresco/include/alfresco-macros.lib.ftl" />
         <#assign el=args.htmlid?html>
         <div id="${el}-body" class="document-workflows-diagram document-details-panel">
            <h2 id="${el}-heading" class="thin dark">
               ${msg("header.workflows.diagram")}
            </h2>
            <div class="panel-body">
               <#if workflows?size &gt; 0>
               <hr/>
               <div class="workflows">
                  <#list workflows as workflow>
                     <div class="workflow <#if !workflow_has_next>workflow-last</#if>">
			<div class="title"><b>${workflow.title?html}</b></div>
			<div><img style="max-width:100%;" src="${url.context}/proxy/alfresco/api/workflow-instances/${workflow.id?js_string}/diagram" alt="${workflow.title?html}"/></div>
                        <div class="clear"></div>
                     </div>
                  </#list>
               </div>
               </#if>
            </div>
         </div>
      </#if>
   </@>
</@>
