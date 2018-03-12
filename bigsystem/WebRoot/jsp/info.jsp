<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提示信息!</title>
<style type="text/css">
<!--
html,body{
height:100%;
margin:0px;
}
.tishi_title{
font-family:"宋体";
font-size:14px;
color:#333333;
font-weight:bold;
background-color:#DCEDFF;
}
.tishi_content{
font-family:"宋体";
font-size:12px;
color:#333333;
background-color:#f2f2f2;
}
-->
</style>
</head>
<%
String code=request.getAttribute("code")==null?"1":(String)request.getAttribute("code");
String message="操作失败";
 %>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td valign="middle" align="center">
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td height="30" align="left" class="tishi_title">&nbsp;提示信息</td>
		  </tr>
		  <tr>
			<td height="100" align="center" class="tishi_content"><span id ="message"></span></td>
		  </tr>
		  <tr>
			<td align="center"><input type="button" name="关闭" value="关闭" onclick="javascript:window.close();"/></td>
		  </tr>
		</table>		
	</td>
  </tr>
</table>
</body>
</html>
<script>
var code="<%=code%>";
var message="<%=message%>"; 
//成功
if (code=="1"){
   window.returnValue="1";
	window.close();
}else {
   document.getElementById("message").innerHTML=message;
}
</script>