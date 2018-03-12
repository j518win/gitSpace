<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sm.user.bean.UserBean"%>
<head>
<title>系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px;
	color: #000000;
}

.STYLE5 {
	font-size: 12
}

.STYLE7 {
	font-size: 12px;
	color: #FFFFFF;
	cursor:pointer;
}
-->
</style>
<%
    String ipAddr = session.getAttribute("ipAddr")+"";
    String macAddr = session.getAttribute("macAddr")+"";
    String company = session.getAttribute("company")+"";
    UserBean curUser = (UserBean)session.getAttribute("curUser");
%>
<script type="text/javascript">
    function modifyPassWd(){
    	parent.mainFrame.cemainframe.openTab('修改密码','user/modifyPassWd.jsp');
    }
</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="57" background="images/main_03.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="378" height="57" background="images/main_01.gif">&nbsp;</td>
						<td>&nbsp;</td>
						<td width="281" valign="bottom"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="33" height="27"><img src="images/main_05.gif"
										width="33" height="27" />
									</td>
									<td width="248" background="images/main_06.gif"><table
											width="225" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td height="17" style="cursor:pointer;"><div align="center">
														<img src="images/pass.gif" width="69" height="17" onclick="modifyPassWd()"/>
													</div>
												</td>
												<td style="cursor:pointer;"><div align="center" onclick="exit();">
														<img src="images/quit.gif" width="69" height="17" />
													</div>
												</td>
												<td><div align="right">&nbsp;&nbsp;</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="40" background="images/main_10.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="194" height="40" background="images/main_07.gif">&nbsp;</td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="21" class="STYLE7"><img src="images/main_13.gif" width="19"
										height="14"
										onclick="top.mainFrame.cemainframe.openTab('首页','../sm/cxtj/gxcx/gxcx.jsp')" />
									</td>
									<td width="35" class="STYLE7"><div align="center"
											onclick="top.mainFrame.cemainframe.openTab('首页','../sm/cxtj/gxcx/gxcx.jsp')">首页</div>
									</td>
									<td width="21" class="STYLE7"><img
										src="images/main_19.gif" width="19" height="14"
										onclick="location.reload()" />
									</td>
									<td width="35" class="STYLE7"><div align="center"
											onclick="location.reload()">刷新</div>
									</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
						<td width="248" background="images/main_11.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="16%"><span class="STYLE5"></span>
									</td>
									<td width="75%"><div align="center">
											<span class="STYLE7" id="dqsj"></span>
										</div>
									</td>
									<td width="9%">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="30" background="images/main_31.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="8" height="30"><img src="images/main_28.gif"
							width="8" height="30" />
						</td>
						<td width="147" background="images/main_29.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="24%">&nbsp;</td>
									<td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单</td>
									<td width="33%">&nbsp;</td>
								</tr>
							</table>
						</td>
						<td width="39"><img src="images/main_30.gif" width="39"
							height="30" />
						</td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td height="20" valign="bottom"><span class="STYLE1">当前登录用户:<%=curUser.getLoginId() %>
											&nbsp;用户角色：<%="0".equals(curUser.getAdminFlag())?"管理员":"普通工号" %></span>
									</td>
									<td valign="bottom" class="STYLE1"><div align="right">
											<img src="images/sj.gif" width="6" height="7" />&nbsp;你的IP:<%=ipAddr%>
											&nbsp; &nbsp;&nbsp;
											<img src="images/sj.gif" width="6" height="7" />&nbsp;你的MAC:<%=macAddr%>
											&nbsp; &nbsp;&nbsp;
											<img src="images/sj.gif" width="6" height="7" />&nbsp;部门：<%=company%>
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td width="17"><img src="images/main_32.gif" width="17"
							height="30" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
<script>
window.onload=function(){
	setInterval(function(){fnDate();},1000);
}

function fnDate(){
var oDiv=document.getElementById("dqsj");
var date=new Date();
var year=date.getFullYear();//当前年份
var month=date.getMonth();//当前月份
var data=date.getDate();//天
var hours=date.getHours();//小时
var minute=date.getMinutes();//分
var second=date.getSeconds();//秒
var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
oDiv.innerText = "你当前时间：" + time;
}

function fnW(str){
var num;
str>9?num=str:num="0"+str;
return num;
}

function exit(){
     parent.window.close();
}
</script>