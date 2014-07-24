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
		Ext.define('Test', {
			extend: 'Ext.data.Model',
			fields: ['id', 'TestName'],
			proxy: {
				type: 'rest',
				url: 'test'
			}
		});
		
		var test = '';
		var panel = Ext.create('Ext.Panel', {
			renderTo: Ext.getBody(),
			height: 500,
			width: 400,
			tbar: [{
				text: '读取', scope: panel, handler: function(){
					Test.load(1, {
						sucess: function(d, o){
							test = d;
							panel.update(o.response.responseText);
						}
					});
				}
			}, {
				text: '新增', scope: panel, handler: function(){
					var t = Ext.ModelManager.create({id: '', TestName: '新增'}, 'Test');
					t.save({
						sucess: function(d, o){
							panel.update(o.response.responseText);
						}
					});
				}
			}, {
				text: '更新', scope: panel, handler: function(){
					test.save({
						sucess: function(d, o){
							panel.update(o.response.responseText);
						}
					});
				}
			}, {
				text: '删除', scope: panel, handler: function(){
					test.destroy({
						sucess: function(d, o){
							panel.update(o.response.responseText);
						}
					});
				}
			}]
		});
	});
</script>
</head>
<body>
	<!-- add html here -->
</body>
</html>