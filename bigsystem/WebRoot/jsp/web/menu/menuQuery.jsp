<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<script src="<%=request.getContextPath()%>/jsp/js/calendar.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
</head>
<body>
<form name="form1" method="post" action="<%=request.getContextPath()%>/jsp/sm/menu/menuQuery.do">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td height="24" bgcolor="#353c44">
		        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td>
			            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			              <tr>
			                <td width="6%" height="19" valign="bottom"><div align="center"><img src="<%=request.getContextPath()%>/jsp/web/images/tb.gif" width="14" height="14" /></div></td>
			                <td width="94%" valign="bottom"><span class="STYLE1">菜单查询</span></td>
			              </tr>
			            </table>
		            </td>
		            <td><div align="right"><span class="STYLE1"> <input type="button" onclick="queryDa();" value="查询">   &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="addMenu();" value="增加">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="gotoTree();" value="树形显示">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
		          </tr>
		        </table>
	        </td>
	      </tr>
	    </table>
    <td></td>
  </tr>
<%
List list = (List)request.getAttribute("datalist"); 
Map map = new HashMap();
if(list!=null){
%>
  <tr>
    <td>
    	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
	      <tr>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ID</span></div></td>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单名</span></div></td>
	      	<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单描述</span></div></td>
	      	<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单路径</span></div></td>
	      	<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单类型</span></div></td>
	      </tr>
			<%
			for (int i = 0; i < list.size(); i++) {
				map = (HashMap) list.get(i);
			%>
			<tr>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("ID") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("MENUNAME") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("MENUDESC") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("URL") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("MENUTYPE") %></div></td>
			</tr>
			<%}%>
    	</table>
    </td>
  </tr>
<%}else{%>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
<tr>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ID</span></div></td>
    <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单名</span></div></td>
   	<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单描述</span></div></td>
   	<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单路径</span></div></td>
   	<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">菜单类型</span></div></td>
</tr>
<%}%>
</table>
</form>
</body>
</html>

<script>

function queryDa(){
	document.form1.submit();
}

function gotoTree(){
	document.forms[0].action="<%=request.getContextPath()%>/jsp/sm/menu/menuTreeDisplay.do"
  	document.forms[0].submit();
}

function addMenu(){
	var retValue = window.showModalDialog("<%=request.getContextPath()%>/jsp/web/menu/menuAdd.jsp","","toolbar:no;dialogWidth:600px;dialogHeight:410px;help:0;status:no;scrollbars:yes;resize:no;menubar:no");
	if (retValue=="1"){
		document.form1.submit();
	}
}
</script>


