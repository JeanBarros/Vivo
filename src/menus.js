ExecuteOrDelayUntilScriptLoaded(function () { getCurrentWebTitle(), GetMenuLinks() }, "SP.js");

var currentWebTitle = '';

function GetMenuLinks() {

	// Obtém a url absoluta do site
    var siteUrl = _spPageContextInfo.siteAbsoluteUrl;
    var clientContext = new SP.ClientContext(siteUrl);
	var list = clientContext.get_web().get_lists().getByTitle("Relatórios");	
	clientContext.load(list);
	
	var camlQuery = new SP.CamlQuery();
	//camlQuery.set_viewXml("<View><Query><Where><Eq><FieldRef Name='Habilitada' /><Value Type='Boolean'>1</Value></Eq></Where><OrderBy><FieldRef Name='Created' Ascending='False' /></OrderBy></Query><RowLimit>3</RowLimit></View>");
	camlQuery.set_viewXml("<View></View>");
	
	itemCollection = list.getItems(camlQuery);
	clientContext.load(itemCollection);

	clientContext.executeQueryAsync(Function.createDelegate(this,this.onSuccess), Function.createDelegate(this,this.onFailed));
} 
	
function onSuccess(sender, args) {
	var enumerator = itemCollection.getEnumerator();
	
    while (enumerator.moveNext()) {        
    
        // get the current list item.
        var listItem = enumerator.get_current();
        
        // get the field value by internalName.
        var linkReport = listItem.get_item('Title');            
        var categoria = listItem.get_item('categoria');
        var apresentacao = listItem.get_item('apresentacao');
        var site = listItem.get_item('site');
        var Id_GrupoAutorizado = listItem.get_item('permissaoDeAcesso');
        var nomeRelatorio = listItem.get_item('NomedoRelat_x00f3_rio')
        var tipoLink = listItem.get_item('tipoLink')
        
        // Compara o valor cadastrado na coluna "Site" com o site onde o usuário está logado para mostrar os itens no menu correspondente a cada site
        if (site == currentWebTitle){
        	if(tipoLink == "Cabeçalho"){
        		$("#sidebar").append(`<ul class="list-unstyled components">
                    <i class="fas fa-home sidebarCollapse">
                    </i>
                    <li class="sidebar-links">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        	Home                                            
                        </a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li>
                                <a href="#">Home 1</a>
                            </li>
                            <li>
                                <a href="#">Home 2</a>
                            </li>
                            <li>
                                <a href="#">Home 3</a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>`);                	
	        }
        	else
        		$("#sidebar ul").append(`<li><a href="#">Teste</a></li>`);
        	
        }
        
        		
        
        /*var tituloCategoria = currentListItems.get_item("Categoria").get_lookupValue();
		var thumbNoticia = currentListItems.get_item("ImagemMiniatura");
		
		$(".box-noticias-home").append("<div class='resumoNoticia'><a href=/Paginas/Noticia.aspx?IDNoticia=" + currentListItems.get_item("ID") +'>' 
		+ '<img class="imagemNoticia" src="' + thumbNoticia.$2_1 + '">'
		+ '<div><span>' + tituloCategoria + '</span><p>' 
		+ currentListItems.get_item("Title") + '</p></div></a></div>');*/
    }
    
    $('.sidebarCollapse').on('click', function () {
    	$('#sidebar').toggleClass('active');
	});
}

function onFailed(sender, args) {
    console.log('Ocorreu um erro ao recuperar os itens da lista: ' + args.get_message());
}

function getCurrentWebTitle(){
    
    var clientContext = new SP.ClientContext.get_current();
    
	web = clientContext.get_web();
	clientContext.load(web);
	clientContext.executeQueryAsync(success, failure);

	function success() {
		currentWebTitle = web.get_title();
	}
	function failure() {
		console.log("Não foi possível obter o nome do site!");
	}
}