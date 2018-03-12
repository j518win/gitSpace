<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<title>系统</title>
<head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {font-size: 12px; color: #adc9d9; }
-->
</style>
<script language="JavaScript" src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
</head>
<% 
String mess = request.getAttribute("mess")+"";
%>
<body >
<form method="post" id="loginFrm" name="loginFrm" action="login.do">


<input type="text" name="loginId" id="loginId" onkeydown="if(event.keyCode == 13){document.loginFrm.passWord.focus();}" style="position:absolute;left:45%;top:44%;width:13%; height:4%; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439; ">
<input type="password"  name="passWord" id="passWord" onkeydown="if(event.keyCode == 13){dengl();}" style="position:absolute;left:45%;top:49%;width:13%; height:4%; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439; ">
<img id="dlimg" onclick="dengl();" src="images/dl.gif" style="position:absolute;left:46%;top:56%;width:4%; height:4%;">
<img onclick="chongz();" src="images/cz.gif" style="position:absolute;left:51%;top:56%;width:4%; height:4%;">
<font color='#ff0000' size="2"><span id='loginTitle' style="display:none;position:absolute;left:45%;top:63%;">用户名或密码不正确！</span></font>



</form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
if ("<%=mess%>"!=""&&"<%=mess%>"!="null"){
  	document.getElementById("loginTitle").style.display="block";
  }

document.loginFrm.loginId.focus();

function dengl(){
	if($.trim($("#loginId").val())=="")
	{
		//alert("请输入用户名！")
		document.getElementById("loginTitle").style.display="block";
		document.getElementById("loginTitle").innerHTML="用户名不能为空，请输入!";
		$("#loginId").focus();
		return;
	}
	if($.trim($("#passWord").val())=="")
	{
		//alert("请输入密码！")
		document.getElementById("loginTitle").style.display="block";
		document.getElementById("loginTitle").innerHTML="密码不能为空，请输入密码!";
		$("#passWord").focus();
		return;
	}
	document.forms[0].submit();

}

function chongz(){
document.getElementById("loginTitle").style.display="none";
document.getElementById("loginId").value="";
document.getElementById("passWord").value="";
}


</SCRIPT>
