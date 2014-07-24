<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>morakot</title>
<%@include file="/common/header-extjs3.jsp" %>
<style type="text/css">
/*add style css here*/

</style>
<script type="text/javascript">
	Ext.onReady(function() {
		//add ext js here
		Ext.QuickTips.init();
		
		var grid = new Ext.grid.GridPanel({
			width: 300,
			height: 200,
			title: 'grid',
			store: new Ext.data.SimpleStore({
				data: [
					['name1', 'female', 'descn1'],
					['name2', 'male', 'descn2']
				],
				fields: ['name', 'sex', 'descn']
			}),
			columns: [
				{header: '姓名', dataIndex: 'name'},
				{header: '性别', dataIndex: 'sex'},
				{header: '备注', dataIndex: 'descn'}
			],
			viewConfig: {
				forceFit: true
			}
		});
		
		var selectMenu = new Ext.menu.Menu({
			style: {
	            overflow: 'visible'
	        },
			items: [grid]
		});
		
		grid.on('rowclick', function(grid, rowIndex, e){
			selectMenu.hide();
			Ext.getCmp('trigger').setValue(rowIndex);
		});
		
		var form = new Ext.form.FormPanel({
			labelAlign: 'right',
			labelWidth: 50,
			width: 600,
			title: 'form',
			frame: true,
			items: [{
				layout: 'column',
				items: [{
					columnWidth: .7,
					xtype: 'fieldset',
					checkboxToggle: false,
					title: '单纯输入',
					autoHeight: true,
					defaults: {width: 300},
					defaultType: 'textfield',
					items: [{
						fieldLabel: '文本',
						name: 'text'
					}, {
						xtype: 'numberfield',
						fieldLabel: '数字',
						name: 'number'
					}, {
						xtype: 'combo',
						fieldLabel: '选择',
						name: 'combo',
						store: new Ext.data.SimpleStore({
							fields: ['value', 'text'],
							data: [
								['value1', 'text1'],
								['value2', 'text2']
							]
						}),
						displayField: 'text',
						valueField: 'value',
						mode: 'local',
						emptyText: '请选择'
					}, {
						xtype: 'datefield',
						fieldLabel: '日期',
						name: 'date'
					}, {
						xtype: 'timefield',
						fieldLabel: '时间',
						name: 'time'
					}, {
						xtype: 'textarea',
						fieldLabel: '多行',
						name: 'textarea'
					}, {
						xtype: 'hidden',
						name: 'hidden'
					}, {
						id: 'trigger',
						xtype: 'trigger',
						fieldLabel: 'trigger',
						name: 'trigger',
						onSelect: function(){
							
						},
						onTriggerClick: function(){
							if(this.menu == null){
								this.menu = selectMenu;
							}
							this.menu.show(this.el, 'tl-bl?');
						}
					}]
				}, {
					columnWidth: .3,
					layout: 'form',
					items: [{
						xtype: 'fieldset',
						checkboxToggle: true,
						title: '多选',
						autoHeight: true,
						defaultType: 'checkbox',
						hideLabels: true,
						style: 'margin-left: 10px;',
						bodyStyle: 'margin-left: 20px;',
						items: [{
							boxLabel: '首先要穿暖',
							name: 'check',
							value: '1',
							checked: true,
							width: 'auto'
						}, {
							boxLabel: '然后要吃饭',
							name: 'check',
							value: '2',
							checked: true,
							width: 'auto'
						}, {
							boxLabel: '房子遮风档雨',
							name: 'check',
							value: '3',
							width: 'auto'
						}, {
							boxLabel: '行路方便',
							name: 'check',
							value: '4',
							width: 'auto'
						}]
					}, {
						xtype: 'fieldset',
						checkboxToggle: true,
						title: '单选',
						autoHeight: true,
						defaultType: 'radio',
						hideLabels: true,
						style: 'margin-left: 10px;',
						bodyStyle: 'margin-left: 20px;',
						items: [{
							boxLabel: '渴望爱情',
							name: 'rad',
							value: '1',
							checked: true,
							width: 'auto'
						}, {
							boxLabel: '祈求爱情',
							name: 'rad',
							value: '2',
							width: 'auto'
						}]
					}]
				}]
			}, {
				layout: 'form',
				labelAlign: 'top',
				items: [{
					xtype: 'htmleditor',
					fieldLabel: '在线编辑器',
					id: 'editor',
					anchor: '98%'
				}]
			}],
			buttons: [{
				text: '保存'
			}, {
				text: '读取'
			}, {
				text: '取消'
			}]
		});
		form.render('form');
	});
</script>
</head>
<body>
	<!-- add html here -->
	<div id="form"></div>
</body>
</html>