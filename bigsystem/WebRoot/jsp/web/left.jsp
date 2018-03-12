<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<TITLE>功能菜单</TITLE>
</HEAD>
<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script type="text/javascript" src="js/dtree.js"></script>
<%
String menu=(String)session.getAttribute("menuList");
%>
<body>
</body>
</html> 

<%=menu%>


<SCRIPT LANGUAGE="JavaScript">
    function lop(urlname,urllink){
    	//parent.cemainframe.openTab(urlname,urllink);
    	parent.openTab(urlname,urllink);//easyUI方式
    }
</SCRIPT>

