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
		var tree = new Ext.tree.TreePanel({
			el: 'tree',
			enableDD: true,
			loader: new Ext.tree.TreeLoader({dataUrl: '06-01.txt'})
		});
		
		var root = new Ext.tree.AsyncTreeNode({
			id: '0',
			text: '根节点'
		});
		
		tree.setRootNode(root);
		tree.render();
		root.expand();
	});
</script>
</head>
<body>
	<!-- add html here -->
	<div id="tree"></div>
</body>
</html>