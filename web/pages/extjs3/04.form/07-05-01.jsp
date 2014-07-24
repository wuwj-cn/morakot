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
		if (Ext.BLANK_IMAGE_URL.substr(0, 4) != "data") {
			Ext.BLANK_IMAGE_URL = "./images/s.gif";
		}
		//add ext js here
		var store =  new Ext.data.Store({
			proxy: new Ext.data.HttpProxy({url: '07-04-01.txt'}),
			reader: new Ext.data.ArrayReader({}, [
				{name: 'value'},
				{name: 'text'}
			])
		});
		//store.load();
		var combo = new Ext.form.ComboBox({
			store: store,
			emptyText: '请选择',
			mode: 'remote',
			triggerAction: 'all',
			valueField: 'value',
			displayField: 'text',
			applyTo: 'combo',
			minListWidth: 250,
			typeAhead: true,
			pageSize: 5,
			resizable: true,
			readOnly: true
		});
	});
</script>
</head>
<body>
	<!-- add html here -->
	<input id="combo" type="text" />
</body>
</html>