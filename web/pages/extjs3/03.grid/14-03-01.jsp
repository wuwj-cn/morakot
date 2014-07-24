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
		var data2 = [
			['1', 'name1', 'male', 'descn1']     
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
		var store2 = new Ext.data.Store({
			proxy: new Ext.data.MemoryProxy(data2),
			reader: new Ext.data.ArrayReader({}, [
   				{name: 'id'},
   				{name: 'name'},
   				{name: 'sex'},
   				{name: 'descn'}
   			])
		});
		
		var grid = new Ext.grid.GridPanel({
			renderTo: 'grid',
			height: 200,
			stripeRows: true,
			enableDragDrop: true,
			store: store,
			cm: cm
		});
		var grid2 = new Ext.grid.GridPanel({
			renderTo: 'grid2',
			height: 200,
			stripeRows: true,
			enableDragDrop: true,
			store: store2,
			cm: cm
		});
		
		store.load();
		store2.load();
		
		var ddrow = new Ext.dd.DropTarget(grid.view.mainBody, {
			ddGroup: 'GridDD',
			copy: false,
			notifyDrop: function(dd, e, data){
				var rows = data.selections;
				var index = dd.getDragData(e).rowIndex;
				if(typeof(index) == 'undefined') index = 0;
				for(var i = 0, len = rows.length; i < len; i++){
					var rowData = rows[i];
					if(!this.copy) store2.remove(rowData);
					store.insert(index, rowData);
				}
			}
		});
		
		var ddrow2 = new Ext.dd.DropTarget(grid2.view.mainBody, {
			ddGroup: 'GridDD',
			copy: false,
			notifyDrop: function(dd, e, data){
				var rows = data.selections;
				var index = dd.getDragData(e).rowIndex;
				if(typeof(index) == 'undefined') index = 0;
				for(var i = 0, len = rows.length; i < len; i++){
					var rowData = rows[i];
					if(!this.copy) store.remove(rowData);
					store2.insert(index, rowData);
				}
			}
		});
	});
</script>
</head>
<body>
	<!-- add html here -->
	<div id="grid"></div>
	<div id="grid2"></div>
</body>
</html>