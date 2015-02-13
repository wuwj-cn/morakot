Ext.Loader.setConfig({
	enabled: true,
	paths: {
		'morakot': '../app'
	}
});

//Ext.direct.Manager.addProvider(Ext.app.REMOTING_API);
Ext.ns('morakot.app');;
Ext.require('morakot.LoginWin');

Ext.onReady(function(){
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider({
		expires: new Date(new Date().getTime() + (1000*60*60))
	}));
	if(Ext.util.Cookies.get('hasLogin') == 'true') {
		Ext.create('morakot.Application');
	} else {
		morakot.LoginWin.show();
	}
});