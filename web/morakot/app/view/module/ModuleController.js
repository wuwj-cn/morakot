/**
 * 模块的控制器
 */

Ext.define('app.view.module.ModuleController', {
	extend : 'Ext.app.ViewController',

	requires : [ 'Ext.MessageBox', 'Ext.window.Toast' ],

	alias : 'controller.module',

	uses : [ 'app.view.main.menu.Monetary' ],

	init : function() {
	},

	addRecord : function() {
		var grid = this.getView().down('modulegrid');
		var model = Ext.create(grid.getStore().model);
		model.set('tf_id', 1);
		model.set('tf_name', '太湖花园小区建设');
		model.set('tf_code', '2004-01');
		model.set('tf_squaremeter', 12000);
		model.set('tf_budget', 3800000);
		model.set('tf_rjl', 0.67);
		model.set('tf_startDate', new Date());
		model.set('tf_endDate', new Date());
		model.set('tf_isValid', false);
		model.set('tf_m3', 1239.24);

		grid.getStore().add(model);
		grid.getStore().sync();
	},
	editRecord : function(button) {
		var window = Ext.widget('basewindow', {
			viewModel : this.getView().getViewModel()
		});
		window.down('baseform').setData(
				this.getView().down('modulegrid').getSelectionModel()
						.getSelection()[0]);
		window.show();
	}

})