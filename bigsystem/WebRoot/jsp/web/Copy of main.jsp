<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>系统</title>
</head>

<frameset rows="127,*,11" frameborder="no" border="0" framespacing="0">
  <frame src="<%=request.getContextPath()%>/jsp/web/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frame src="<%=request.getContextPath()%>/jsp/web/center.html" name="mainFrame" id="mainFrame" />
  <frame src="<%=request.getContextPath()%>/jsp/web/down.html" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>
