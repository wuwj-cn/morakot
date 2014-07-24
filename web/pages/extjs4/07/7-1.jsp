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
		var callback = function(o, s, r){
			var html = [];
			html.push('<p>sucess: ' + s);
			console.log(r['responseText']);
			for(var i in r){
				if(r.hasOwnProperty(i)){
					switch(i){
					case 'getAllResponseHeaders':
						var d = r[i]();
						for(var j in d){
							if(d.hasOwnProperty(j)){
								html.push('<p>response[getAllResponseHeaders]['+j+']: ' + d[j]);
							}
						}
						break;
					case 'getResponseHeader':
						break;
					case 'responseXML':
						var doc = r[i];
						if(doc){
							var t = "";
							if(doc.xml) t = Ext.htmlEncode(r[i].xml);
							else t = Ext.htmlEncode((new XMLSerializer()).serializeToString(doc));
							html.push('<p>response['+i+']: ' + t);
						}
						break;
					case 'options':
						break;
					default:
						html.push('<p>response['+i+']: ' + r[i]);	
					}
				}
			}
			Ext.getDom('ajaxinfo').innerHTML = html.join("");
		}
		
		Ext.fly('btn1').on('click', function(){
			Ext.Ajax.request({
				url: 'test.js',
				callback: callback
			});
		});
		Ext.fly('btn2').on('click', function(){
			Ext.Ajax.request({
				url: 'test.xml',
				callback: callback
			});
		});
	});
</script>
</head>
<body>
	<!-- add html here -->
	<input id="btn1" type="button" value="加载非XML文件" />
	<input id="btn2" type="button" value="加载XML文件" />
	<div id="ajaxinfo"></div>
</body>
</html>