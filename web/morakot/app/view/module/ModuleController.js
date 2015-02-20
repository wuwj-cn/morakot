/**
 * 模块的控制器
 */

Ext.define('app.view.module.ModuleController', {
    extend: 'Ext.app.ViewController',

    requires: ['Ext.MessageBox', 'Ext.window.Toast'],

    alias: 'controller.module',

    init: function () {
        console.log('modulecontroller.init')
    }

})