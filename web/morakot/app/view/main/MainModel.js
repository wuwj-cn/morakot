/**
 * This class is the view model for the Main view of the application.
 */
Ext.define('app.view.main.MainModel', {
    extend: 'Ext.app.ViewModel',

    alias: 'viewmodel.main',

    data: {
        name: 'app',
        
        //系统信息
        system: {
        	name: 'morakot信息管理系统',
        	iconUrl: '',
        	version: '1.0.0'
        },
        
        //用户信息
        user: {
        	company: 'morakot工作室',
        	name: 'morakot'
        },
        
        //服务信息
        service: {
        	qq: '254513235',
        	email: '254513235@qq.com',
        	copyright: 'morakot工作室'
        }
    }

    //TODO - add data, formulas and/or methods to support your view
});