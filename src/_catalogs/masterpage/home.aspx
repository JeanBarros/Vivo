<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:FieldValue id="PageTitle" FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
<WebPartPages:SPProxyWebPartManager runat="server" id="spproxywebpartmanager"></WebPartPages:SPProxyWebPartManager>
<style type="text/css">	
.wrap {
    width: 320px;
    height: 192px;
    padding: 0;
    overflow: hidden;
}
iframe {
    width: 1280px;
    height: 786px;
    border: 0;
    -ms-transform: scale(0.25);
    -moz-transform: scale(0.25);
    -o-transform: scale(0.25);
    -webkit-transform: scale(0.25);
    transform: scale(0.25);
    
    -ms-transform-origin: 0 0;
    -moz-transform-origin: 0 0;
    -o-transform-origin: 0 0;
    -webkit-transform-origin: 0 0;
    transform-origin: 0 0;
}						
</style>
<div class="container-fluid">
	<div class="row"> 
	  <div class="col-sm-9">
		  <div class="row">
			  <div class="col-sm-4 small-column">
					<div class="wrap">
						<WebPartPages:WebPartZone id="g_AA7471658CFF40EAB08FB7D851CF9E78" runat="server" title="Zone 1">
							<ZoneTemplate></ZoneTemplate>
						</WebPartPages:WebPartZone>
					</div>
					<!-- <div class="wrap">
						<iframe class="frame" src="https://app.powerbi.com/view?r=eyJrIjoiMmYwZjk2Y2MtMjE1ZC00NGIyLTgzMzgtMTliNjMzNWE5NGY5IiwidCI6IjdjZDY3MjE0LTY5ZjEtNDU5OS05Njk4LWY1Y2MzMGNmNTYwMCJ9"></iframe>
					</div>			  	         -->
			  </div>
			  <div class="col-sm-4 small-column">
			      <WebPartPages:WebPartZone id="g_5F046B166CEE4187A8705410FBB1A0BF" runat="server" title="Zone 2"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
			  </div>
			  <div class="col-sm-4 small-column">
			    <WebPartPages:WebPartZone id="g_E4478307B5514DEE826E81BFA3B6A338" runat="server" title="Zone 3"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
			  </div>
		  </div>
		  <br>
		  <div class="row">
		  	<div class="col-sm mid-column">		  		
			  	<WebPartPages:WebPartZone id="g_5592ED44354B486DB1E70FC1353D5091" runat="server" title="Zone 5"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>		  		
		  	</div>
		  </div>
	  </div>
	  <div class="col-sm-3 right-column">
		  <div class="row">
			  <div class="col-sm">
				<WebPartPages:WebPartZone id="g_B737DCBC8819428A9741D550200E0261" runat="server" title="Zone 4"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
			  </div>
		  </div>
	  </div>
	</div>
</div>
</asp:Content>