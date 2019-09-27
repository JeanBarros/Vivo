$(document).ready(function () {
    //don't exectute any jsom until sp.js file has loaded.        
    SP.SOD.executeFunc('sp.js', 'SP.ClientContext', loadSharepointList);
}); 

var currentWebTitle = '';

function loadSharepointList() {


getItemsWithCaml('Relatórios').then(
function (camlItems) {
   	var listItemEnumerator = camlItems.getEnumerator();
    while (listItemEnumerator.moveNext()) {
        
        // get the current list item.
        var listItem = listItemEnumerator.get_current();
        
        // get the field value by internalName.
        var linkReport = listItem.get_item('Title');            
        var categoria = listItem.get_item('categoria');
        var apresentacao = listItem.get_item('apresentacao');
        var site = listItem.get_item('site');
        var Id_GrupoAutorizado = listItem.get_item('permissaoDeAcesso');
        
        console.log('1 - obtém cada item da lista');
        console.log(linkReport);
        console.log(categoria);
        console.log(apresentacao);
        console.log(site);
        console.log(Id_GrupoAutorizado); 
        
		if (site == currentWebTitle){
			if (categoria == "Capa" && apresentacao == "Desktop")            	
		        $('.areaContent-home-desktop').append(`<iframe src=${linkReport} frameborder="0"></iframe>`);
		    else if (categoria == "Capa" && apresentacao == "Mobile")	
		        $('.areaContent-home-mobile').append(`<iframe src=${linkReport} frameborder="0"></iframe>`);
		    
			// Para as páginas de detalhes não terá versão mobile dos Dashboards
			if (categoria == "Detalhe")             	
		        $('.areaContent-detalhes').append(`<iframe src=${linkReport} frameborder="0"></iframe>`);
	    }
    }
    
    console.log('3 - Executa por último');
    
	},

	function (sender, args) {
    	console.log('Ocorreu um erro ao recuperar os itens da lista: ' + args.get_message());
	});   
}    

function getItemsWithCaml(listTitle) {

	// Obtém a url absoluta do site
    var siteUrl = _spPageContextInfo.siteAbsoluteUrl;
    
    //use of $.Deferred in the executeQueryAsync delegate allows the consumer of this method to write 'syncronous like' code
    var deferred = $.Deferred();
    
    var clientContext = new SP.ClientContext(siteUrl);
	list = clientContext.get_web().get_lists().getByTitle(listTitle);
    
    //var list = clientContext.get_web().get_lists().getByTitle(listTitle);
    var camlQuery = new SP.CamlQuery();            
    var items = list.getItems(camlQuery);
    
    clientContext.load(items);
    clientContext.executeQueryAsync(
    	Function.createDelegate(this, function () { deferred.resolve(items); }),
    	Function.createDelegate(this, function (sender, args) { deferred.reject(sender, args); })
    	);
    	
    	getCurrentWebTitle();    	

    return deferred.promise();
};

function getCurrentWebTitle(){
    
    var clientContext = new SP.ClientContext.get_current();
    
	web = clientContext.get_web();
	clientContext.load(web);
	clientContext.executeQueryAsync(success, failure);

	function success() {
		currentWebTitle = web.get_title();
		console.log(web.get_title());
	}
	function failure() {
		alert("Não foi possível obter o nome do site!");
	}
}

/*function CurrentUserMemberOfGroup(groupId, context, result) {
    var currentUser = context.get_web().get_currentUser();
    context.load(currentUser);

    var Groups = currentUser.get_groups();
    context.load(Groups);

    var group = Groups.getById(groupId);
    context.load(group);

    var groupUsers = group.get_users();
    context.load(groupUsers);

    context.executeQueryAsync(
        function (sender, args) {
            var userInGroup = UserInGroup(currentUser, group);
            result(userInGroup);            
        },
        function OnFailure(sender, args) {
            result(false);
        }
    );

    function UserInGroup(user, group) {
        var groupUsers = group.get_users();
        var userInGroup = false;
        var groupUserEnumerator = groupUsers.getEnumerator();
        while (groupUserEnumerator.moveNext()) {
            var groupUser = groupUserEnumerator.get_current();
            if (groupUser.get_id() == user.get_id()) {
                userInGroup = true;
                break;
            }
        }
        return userInGroup;
    }
}*/