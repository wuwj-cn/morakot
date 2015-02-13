Ext.define('morakot.Application', {
	extend: 'Ext.app.Application',
	name: 'morakot',
	
	controllers: ['MainMenu'],
	
	autoCreateView: true,
	
	launch: function(){
		morakot.app = this;
	}
});