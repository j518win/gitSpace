<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String msg=null;
if(msg==null) msg="";
%>
<html>
<head>
<title>登录</title>
<script language="JavaScript" src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
<script language="JavaScript" src="index.js"></script>
<link rel="stylesheet" type="text/css" href="index_blue.css"/>
</head>
<body>
<form action="login.do" class="login_form" method="post">
	<div class='login_main'>
		<div class="login_input">
			<div class="login_box" id="login_div">
				<table>
					<tr>
						<td>
							用户名
						</td>
						<td colspan="2" valign="middle">
							<input type="text" name="loginid" id="loginid"
								onfocus="this.className='input_hover';this.select()"
								onblur="this.className=''" value="admin"/>
						</td>
					</tr>
					<tr>
						<td>
							密&nbsp;&nbsp;码
						</td>
						<td colspan="2">
							<input type="password" name="passWord"  value="admin" id="passWord"
								onfocus="this.className='input_hover';this.select()"
								onblur="this.className=''" onkeydown="keypress()" />
						</td>
					</tr>
					<tr align="center">
						<td>
							&nbsp;
						</td>
						<td colspan="2">
							<button onclick="doLogin();return false;" class="login_button"
							onmouseover="this.className='login_button login_button_hover'"
							onmouseout="this.className='login_button'">登录</button>&nbsp;
							
							<button onclick="resetUser();return false;" class="login_button">重置</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<div class="login_error_message"><%=msg%></div>
		</div>
		<div class="login_message">
		</div>
	</div>
</form>
</body>
</html>