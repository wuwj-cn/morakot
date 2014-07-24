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
	Ext.onReady(function(){
		var sm = new Ext.grid.CheckboxSelectionModel({handleMouseDown: Ext.emptyFn});
		var cm = new Ext.grid.ColumnModel([
			new Ext.grid.RowNumberer(),		
			//sm,
			{header: '编号', sortable: true, dataIndex: 'id'},
			{header: '名称', sortable: true, dataIndex: 'name'},
			{header: '性别', sortable: true, dataIndex: 'sex'},
			{header: '描述', sortable: true, dataIndex: 'descn'}
		]);
		
		var data = [
			['1', 'name1', 'male', 'descn1'],
			['2', 'name2', 'female', 'descn2'],
			['3', 'name3', 'female', 'descn3'],
			['4', 'name4', 'male', 'descn4'],
			['5', 'name5', 'male', 'descn5']
		];
		
		var store = new Ext.data.Store({
			proxy: new Ext.data.MemoryProxy(data),
			reader: new Ext.data.ArrayReader({}, [
				{name: 'id'},
				{name: 'name'},
				{name: 'sex'},
				{name: 'descn'}
			])
		});
		
		var myRecord = new Ext.data.Record.create([
			{name: 'id', type: 'string'},
			{name: 'name', type: 'string'},
			{name: 'sex', type: 'string'},
			{name: 'descn', type: 'string'}
		]);
		
		var grid = new Ext.grid.GridPanel({
			renderTo: 'grid',
			loadMask: true,
			autoHeight: true,
			stripeRows: true,
			enableDragDrop: true,
			store: store,
			cm: cm,
			tbar: new Ext.Toolbar(['->', {
				text: '增加行',
				handler: function(){
					var p = new myRecord({id: '', name: '', descn: ''});
					grid.stopEditing();
					store.insert(0, p);
					grid.startEditing(0, 1);
				}
			}, '-', {
				text: '删除行',
				handler: function(){
					Ext.Msg.confirm('info', 'are you sure to delete record?', function(btn){
						if(btn == 'yes'){
							var cell = grid.getSelectionModel().getSelectedCell();
							var record = store.getAt(cell[0]);
							store.remove(record);
						}
					});
				}
			}, '-'])
		});
		
		store.load();
		
		var ddrow = new Ext.dd.DropTarget(grid.container, {
			ddGroup: 'GridDD',
			copy: false,
			notifyDrop: function(dd, e, data){
				var rows = data.selections;
				var index = dd.getDragData(e).rowIndex;
				if(typeof(index) == 'undefined') return;
				for(var i = 0, len = rows.length; i < len; i++){
					var rowData = rows[i];
					if(!this.copy) store.remove(rowData);
					store.insert(index, rowData);
				}
			}
		});
	});
</script>
</head>
<body>
	<!-- add html here -->
	<div id="grid"></div>
</body>
</html>