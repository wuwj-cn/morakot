<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>morakot</title>
<%@include file="/common/header.jsp" %>
<style type="text/css">
/*add style css here*/
#op{width: 1000px; height: 20px; line-height: 20px; display: bolck}
#op a{float: left; color: blue; cursor: pointer; text-decoration: underline}
#op span{float: right}
.clear{clear: both; line-height: 0; height: 0; overflow: hidden}
tr{border-bottom: 1px solid #cdcdcd;}
th{background: #cdcdcd; text-align: center;}
td{width: 80px; text-align: center;}
.selected{background: #ddffff}
#tabs{
	width: 600px;
	height: 20px;
	font-size: 14px;
	line-height: 20px;
	display: block;
	margin: auto;
	background: #d9d9d9;
	border-bottom: 1px solid #e0e0e0;
}
#tabs ul{list-style: none}
#tabs li{float: left; width: 80px; text-align: center; display: block; cursor: pointer;}
#tabs .active{
	border-left: 1px solid #e0e0e0;
	border-right: 1px solid #e0e0e0;
	border-top: 1px solid #e0e0e0;
	background: white;
}
#tabContent{
	width: 600px;
	margin: auto;
	border-left: 1px solid #e0e0e0;
	border-rigth: 1px solid #e0e0e0;
	border-bottom: 1px solid #e0e0e0;
	height: 130px;
	display: block;
	text-algin: center;
}
</style>
</head>
<body>
	<!-- add html here -->
<script type="text/javascript">
	Ext.Loader.setConfig({enabled: true});
	Ext.Loader.setPath({
		"morakot":""
	});
	Ext.require([
		"morakot.HKStock"
	]);
	
	Ext.onReady(function() {
		if (Ext.BLANK_IMAGE_URL.substr(0, 4) != "data") {
			Ext.BLANK_IMAGE_URL = "./images/s.gif";
		}
		//add ext js here
		Ext.create('morakot.HKStock', {
			code: ['00941', '00728', '00762', '01288', '01398']	
		});
	});
</script>
</body>
</html>