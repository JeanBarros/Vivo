<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:FieldValue id="PageTitle" FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
<WebPartPages:SPProxyWebPartManager runat="server" id="spproxywebpartmanager"></WebPartPages:SPProxyWebPartManager>
<div class="container-fluid">
	<div class="row"> 
	  <div class="col-sm-9">
		  <div class="row">
			  <div class="col-sm-4 small-column">        
			  	<WebPartPages:WebPartZone id="g_AA7471658CFF40EAB08FB7D851CF9E78" runat="server" title="Zone 1"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>        
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
