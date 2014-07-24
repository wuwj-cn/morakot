<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>morakot</title>
<%@include file="/common/header.jsp" %>

<style type="text/css">
/*add style css here*/
table {margin: 20px 0 0 20px;font-size: 20px;line-height: 40px;border: 1px solid #000;padding: 3px;}
th {text-align: center;}
#calc {border: 1px solid #000;}
#result {width: 156px;}
.calc {width: 40px;height: 40px;text-align: center;}
.number {width: 40px; height: 40px; text-align: center;}
.op {width: 40px; height: 40px; text-align: center;}
.sign {width: 40px; height: 40px; text-align: center;}
.cmd {width: 80px; height: 40px; text-align: center;}
</style>
</head>
<body>
	<!-- add html here -->
	<table cellpadding="1" cellpadding="1" border="0">
		<tr style="border: 1px solid #000; background: #2159C2; color: #fff">
			<th colspan="4">计算器</th>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input id="result" readonly="true" style="text-align: right;" type="text" value="0" />
			</td>
		</tr>
		<tr>
			<td colspan="2"><input class="cmd" type="button" value="="/></td>
			<td colspan="2"><input class="cmd" type="button" value="C"/></td>
		</tr>
		<tr>
			<td><input class="number" type="button" value="7"/></td>
			<td><input class="number" type="button" value="8"/></td>
			<td><input class="number" type="button" value="9"/></td>
			<td><input class="op" type="button" value="+"/></td>
		</tr>
		<tr>
			<td><input class="number" type="button" value="4"/></td>
			<td><input class="number" type="button" value="5"/></td>
			<td><input class="number" type="button" value="6"/></td>
			<td><input class="op" type="button" value="-"/></td>
		</tr>
		<tr>
			<td><input class="number" type="button" value="1"/></td>
			<td><input class="number" type="button" value="2"/></td>
			<td><input class="number" type="button" value="3"/></td>
			<td><input class="op" type="button" value="*"/></td>
		</tr>
		<tr>
			<td><input class="number" type="button" value="0"/></td>
			<td><input class="sign" type="button" value="-/+"/></td>
			<td><input class="sign" type="button" value="."/></td>
			<td><input class="op" type="button" value="/"/></td>
		</tr>
	</table>
	<script type="text/javascript">
		Ext.onReady(function() {
			if (Ext.BLANK_IMAGE_URL.substr(0, 4) != "data") {
				Ext.BLANK_IMAGE_URL = "./images/s.gif";
			}
			//add ext js here
			var calc = function(){
				switch(op){
				case "-":
					first = parseFloat(first) - parseFloat(second);
					break;
				case "*":
					first = parseFloat(first) * parseFloat(second);
					break;
				case "/":
					second = parseFloat(second);
					if(second != 0) first = parseFloat(first) / parseFloat(second);
					break;
				default:
					first = parseFloat(first) + parseFloat(second);
					break;
				}
				op = "";
				if(arguments.length > 0) op = arguments[0];
				second = "";
				result.value = first;
			}
			
			var first = "";
			var second = "";
			var op = "";
			var result = Ext.getDom("result");
			Ext.addBehaviors({
				"input.number@click": function(e, el){
					if(Ext.isEmpty(op)) {
						if(!(el.value == 0 && first == 0)) {
							first = first + el.value;
							result.value = first;
						}
					} else {
						if(!(el.value == 0 && second == 0)) {
							second = second + el.value;
							result.value = second;
						}
					}
				},
				"input.cmd@click": function(e, el){
					if(el.value == "C"){
						first = "";
						second = "";
						result.value = "0";
					} else {
						calc();
					}
				},
				"input.sign@click": function(e, el){
					if(el.value == "."){
						if(Ext.isEmpty(op)){
							if(first.toString().indexOf(".") == -1){
								first = first + ".";
								result.value = first;
							}
						} else {
							if(second.toString().indexOf(".") == -1){
								second = second + ".";
								result.value = second;
							}
						}
					} else {
						if(Ext.isEmpty(op)){
							first = first * -1;
							result.value = first;
						} else {
							second = second * -1;
							result.value = second;
						}
					}
				},
				"input.op@click": function(e, el){
					if(Ext.isEmpty(op) || Ext.isEmpty(second)){
						op = el.value;
						result.value = "0";
					} else {
						calc(el.value);
					}
				}
			});
		});
	</script>
</body>
</html>