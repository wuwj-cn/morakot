<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>morakot</title>
<%@include file="/common/header.jsp" %>
<style type="text/css">
/*add style css here*/

</style>
<script type="text/javascript">
	Ext.onReady(function() {
		if (Ext.BLANK_IMAGE_URL.substr(0, 4) != "data") {
			Ext.BLANK_IMAGE_URL = "./images/s.gif";
		}
		//add ext js here
		var panel = Ext.create('Ext.Panel', {
			renderTo: Ext.getBody(),
			layout: 'auto',
			height: 500,
			width: 400,
			autoLoad: {
				url: 'Component.js',
				renderer: 'component'
			},
			renderer: 'component',
			tbar: [
				{text: '加载组件', scope: panel, handler: function(){
					panel.loader.load({
						url: 'Component.js',
						renderer: 'component'
					});
				}},
				{text: '加载组件(removeAll)', scope: panel, handler: function(){
					panel.loader.load({
						url: 'Component1.js',
						renderer: 'component',
						removeAll: true
					});
				}}
			]
		});
	});
</script>
</head>
<body>
	<!-- add html here -->
</body>
</html>