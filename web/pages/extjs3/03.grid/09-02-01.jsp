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
			sm,
			{header: '编号', sortable: true, dataIndex: 'id'},
			{header: '名称', sortable: true, dataIndex: 'name'},
			{header: '描述', sortable: true, dataIndex: 'descn'}
		]);
		
		var data = [
			['1', 'name1', 'descn1'],
			['2', 'name2', 'descn2'],
			['3', 'name3', 'descn3'],
			['4', 'name4', 'descn4'],
			['5', 'name5', 'descn5']
		];
		
		var store = new Ext.data.Store({
			//proxy: new Ext.data.MemoryProxy(data),
			proxy: new Ext.data.HttpProxy({
				url: '${ctx}/extjs/list.do'
			}),
			reader: new Ext.data.JsonReader({
				totalProperty: 'totalProperty',
				root: 'root'
			}, [
				{name: 'id'},
				{name: 'name'},
				{name: 'descn'}
			])
		});
		
		var grid = new Ext.grid.GridPanel({
			renderTo: 'grid',
			loadMask: true,
			autoHeight: true,
			stripeRows: true,
			store: store,
			cm: cm,
			sm: sm,
			viewConfig: {
				columnsText: '显示的列',
				scrollOffset: 30,
				sortAscText: '升序',
				sortDescText: '降序',
				forceFit: true
			},
			bbar: new Ext.PagingToolbar({
				pageSize: 10, 
				store: store,
				displayInfo: true,
				displayMsg: '显示第 {0} 条到 {1} 条记录, 一共 {2} 条',
				emptyMsg: '没有记录'
			})
		});
		
		store.load({params: {start: 0, limit: 10}});
		
		Ext.get('remove').on('click', function(){
			store.remove(store.getAt(1));
			grid.getView().refresh();
		});
	});
</script>
</head>
<body>
	<!-- add html here -->
	<div id="grid"></div>
	<input id='remove' type='button' value='remove row' />
</body>
</html>