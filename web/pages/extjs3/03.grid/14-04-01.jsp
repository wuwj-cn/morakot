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
			cm: cm
		});
		
		store.load();
		
		var ddrow = new Ext.dd.DropTarget(grid.container, {
			ddGroup: 'GridDD',
			copy: false,
			notifyDrop: function(dd, e, data){}
		});
		
		var tree = new Ext.tree.TreePanel({
			el: 'tree',
			ddGroup: 'GridDD',
			enableDragDrop: true,
			loader: new Ext.tree.TreeLoader({dataUrl: '03-04.txt'})
		});
		
		var root = new Ext.tree.AsyncTreeNode({
			text: '根节点'
		});
		tree.setRootNode(root);
		tree.render();
		root.expand();
		
		tree.on('nodedragover', function(e){});
		tree.on('beforenodedrop', function(e){});
	});
</script>
</head>
<body>
	<!-- add html here -->
	<div id="grid"></div>
	<div id="tree"></div>
</body>
</html>