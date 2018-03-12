 <%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>管理系统</title>
    <link href="/jsp/skin/Style2.css" rel="stylesheet" type="text/css">
     <script language="JavaScript" src="<%=request.getContextPath() %>/jsp/js/jquery-1.11.3.js"></script>
   <style type="text/css">
<!--
body{
margin:0px;
padding:0px;
}
html body{
height:100%;
}
.font1{
font-family:"宋体";
font-size:13px;
color:#fff;
font-weight:bold;
}
.inspur1{
width:150px;
font:"宋体";
font-size:12px;
color:#333333;
}

-->
</style>
</head>

<%

String messages = request.getAttribute("messages")+"";

%>  

<body>
<form name="form1" method="post" action="login.do">
<input type="hidden" name="orgid" id="orgid" value="">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td height="100%" align="center" style="background:url(images/dl02.jpg) center center">
    <table width="606" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="388" background="images/login.jpg" align="center" style="padding-left:20px;">
    <table width="200" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" height="25">&nbsp;</td>
        <td width="166">&nbsp;</td>
        <td width="84">&nbsp;</td>
      </tr>
      <tr>
        <td height="40">&nbsp;</td>
        <td height="40">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
	  <tr>
        <td colspan=3><font color='#ff0000' size="2"><span id='loginTitle' style='display:none'>用户名或密码不正确，请重新输入！</span></font></td>
      </tr>
	 <tr>
        <td height="40" class="font1">用户名：</td>
        <td height="40"><label>
          <input type="text" name="loginId" id="loginId" class="inspur1" AUTOCOMPLETE="off" onKeyDown="keydown(this)"/>
        </label></td>
        <td align="center"><img id="v_button1" name="button1" src="images/ok.gif" width="75" height="23" border="0" onclick="javascript:form1.submit()" /></td>
      </tr>
     
	  <tr>
        <td height="40" class="font1">密&nbsp;&nbsp;码：</td>
        <td height="40"><input type="password" name="passWord" id="passWord" class="inspur1" onKeyDown="keydown(this)"/></td>
        <td align="center"><img src="images/cancel.gif" width="75" height="23" border="0" onclick="javascript:rst()"/></td>
      </tr>
    </table></td>
  </tr>
</table>
</td>
  </tr>
</table>
</form>
</body>
</html>
<script>
if ("<%=messages%>"!=""&&"<%=messages%>"!="null"){
  	//alert("<%=messages%>");
  	document.getElementById("loginTitle").style.display="block";
  }
  
  
 function frmsubmit()
{
	if($.trim($("#loginId").val())=="")
	{
		//alert("请输入用户名！")
		document.getElementById("loginTitle").style.display="block";
		document.getElementById("loginTitle").innerHTML="用户名不能为空，请输入!";
		$("#loginId").focus()
		return;
	}
	if($.trim($("#passWord").val())=="")
	{
		//alert("请输入密码！")
		document.getElementById("loginTitle").style.display="block";
		document.getElementById("loginTitle").innerHTML="密码不能为空，请输入密码!";
		$("#passWord").focus()
		return;
	}
	document.forms[0].submit();
}
function keydown(obj)
{
	if(event.keyCode!=13)return;
	frmsubmit();
}

function rst(){
document.getElementById("loginId").value="";
document.getElementById("passWord").value="";
}

  document.getElementById("loginId").focus();
</script>
