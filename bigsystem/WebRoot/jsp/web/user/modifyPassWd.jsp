<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
        <script language="JavaScript" src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
		<link href="<%=request.getContextPath()%>/jsp/css/common.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		    function modifyPassWd() {
			    var oldPassWd = $("#oldPassWd").val();
			    var newPassWd = $("#newPassWd").val();
			    var rdNewPassWd = $("#rdNewPassWd").val();

			    if(""==rdNewPassWd||""==newPassWd||""==rdNewPassWd){
				    alert("页面信息有未填写信息，请确认！");
				    return false;
			    }

			    if(newPassWd!=rdNewPassWd){
				    alert("新密码输出不一致，请重新输入！");
				    return false;
			    }
			    return true;
		    }

		    $(document).ready(function(){
                var msgInfo='<%=request.getAttribute("msgInfo")%>';
                if("null"!=msgInfo){
                    alert(msgInfo);
                }
            });
        </script>
	</head>
	<body>
		<form name="form1" method="post"
			action="<%=request.getContextPath()%>/user/modifyPassWd.do" onsubmit="return modifyPassWd();">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="30">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="24" bgcolor="#353c44">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="6%" height="19" valign="bottom">
												<div align="center">
													<img
														src="<%=request.getContextPath()%>/jsp/sm/images/tb.gif"
														width="14" height="14" />
												</div>
											</td>
											<td width="94%" valign="bottom">
												<span class="STYLE1">修改密码</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" bgcolor="#a8c7ce">
				<tr>
					<td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">原密码</span>
						</div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<input type="password" name="oldPassWd" id="oldPassWd"/>
					</td>
				</tr>
				<tr>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">新密码</span>
						</div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<input type="password" name="newPassWd" id="newPassWd" />
					</td>
				</tr>
				<tr>
					<td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">重复新密码</span>
						</div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<input type="password" name="rdNewPassWd" id="rdNewPassWd" />
					</td>
				</tr>
				<tr>
					<td colspan="2" height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center">
							<input type="reset" value="重置" />
							<input type="submit" value="确定" />
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
