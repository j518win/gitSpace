<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sm.user.bean.UserBean"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<html>
	<head>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
		<link href="<%=request.getContextPath()%>/jsp/css/common.css"
			rel="stylesheet" type="text/css" />

		<%
            List<UserBean> userList;
            String msgInfo = (String)request.getAttribute("msgInfo");
            if("success".equals(msgInfo)){
            	userList = (List<UserBean>)request.getAttribute("userList");
            }else{
            	userList = new ArrayList<UserBean>();
            }
            
            String qryStaffId = (String)request.getAttribute("qryStaffId");
            if(StringUtils.isEmpty(qryStaffId)){
            	qryStaffId="";
            }
            String qryCityId = (String)request.getAttribute("qryCityId");
            if(StringUtils.isEmpty(qryCityId)){
            	qryCityId="";
            }
            
            Map<String, String> types = new HashMap<String, String>();
            //用户类别 1-客服，2-营业，3-机房
            types.put("1", "客服");
            types.put("2", "营业");
            types.put("3", "机房");
            
            Map<String, String> statusMap = new HashMap<String, String>();
            //用户类别 1-客服，2-营业，3-机房
            statusMap.put("0", "生效");
            statusMap.put("1", "失效");
            
            Map<String, String> citys = new HashMap<String, String>();
            citys.put("0531", "济南");
            citys.put("0534", "德州");
            citys.put("0543", "滨州");
            citys.put("0631", "威海");
            citys.put("0535", "烟台");
            citys.put("0538", "泰安");
            citys.put("0539", "临沂");
            citys.put("0632", "枣庄");
            citys.put("0634", "莱芜");
            citys.put("0530", "菏泽");
            citys.put("0532", "青岛");
            citys.put("0537", "济宁");
            citys.put("0633", "日照");
            citys.put("0546", "东营");
            citys.put("0533", "淄博");
            citys.put("0635", "聊城");
            citys.put("0536", "潍坊");
        %>

		<script type="text/javascript">
            $(document).ready(function(){
                var msgInfo='<%=request.getAttribute("msgInfo")%>';
					if ("fail" == msgInfo) {
						alert("查询用户清单异常，请稍后再试！");
					} else if ("noAccess" == msgInfo) {
						alert("对不起，您没有权限！");
					}
				$("#qryStaffId").val('<%=qryStaffId%>');
				$("#qryCityId").val('<%=qryCityId%>');
		     });

		     function resetPasswd(staffId){
			     if(confirm("确认重置此用户密码吗?")){
			    	 var msgInfo = $.ajax({
			               type: "POST",
			               url: "<%=request.getContextPath()%>/user/resetPassWd.do",
			               data: "staffId="+staffId,
			               async: false
			            }).responseText;

			         if("success"==msgInfo){
				         alert("重置成功！密码为：123456");
			         }else if("noUser"==msgInfo){
				         alert("重置失败:未找到用户！");
			         }else if("fail"==msgInfo){
				         alert("重置失败:请稍后再试！");
			         }
			     }
		     }

		     function modify(staffId){
		    	 var ret = window.showModalDialog("<%=request.getContextPath()%>/user/qryUser.do?staffId="+staffId,"","dialogHeight:350px;;;dialogWidth:300px;center:yes;;;help:no;resizable:no;scroll:yes;status:no;;");
		    	 if("success"==ret){
			    	 location.reload();
		    	 }           
		     }

		     function addUser(){
		    	 var msgInfo='<%=request.getAttribute("msgInfo")%>';
		    	 if("noAccess"==msgInfo){
		    		 alert("对不起，您没有权限！");
		    		 return;
		    	 }
		    	 var ret = window.showModalDialog("<%=request.getContextPath()%>/jsp/web/user/addUser.jsp","","dialogHeight:360px;;;dialogWidth:300px;center:yes;;;help:no;resizable:no;scroll:yes;status:no;;");
		    	 if ("success" == ret) {
		    	     location.reload();
		         }
	         }

	         function modifyUserStatus(staffId, status){
	        	 status=('1'==status?'0':'1');
	             if(confirm("请确认是否更新"+staffId+"工号状态为"+('1'==status?'失效':'生效'))){
	            	 var msgInfo = $.ajax({
                         type: "POST",
                         url: "<%=request.getContextPath()%>/user/modifyUserStatus.do",
                         data: "staffId="+staffId+"&status="+status,
                         async: false
                      }).responseText;

	            	 if("success"==msgInfo){
                         alert("更新用户状态成功！");
                         location.reload();
                     }else if("noUser"==msgInfo){
                         alert("更新用户状态失败:未找到用户！");
                     }else if("fail"==msgInfo){
                         alert("更新用户状态失败:请稍后再试！");
                     }
	             }
		     }
</script>
	</head>
	<body>
		<form name="form1" method="post"
			action="<%=request.getContextPath()%>/user/userManage.do">
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
													c<img
														src="<%=request.getContextPath()%>/jsp/sm/images/tb.gif"
														width="14" height="14" />
												</div>
											</td>
											<td width="90%">
												<span class="STYLE1">用户管理</span>
											</td>
											<td width="4%">
												<input type="button" value="新增" onclick=addUser(); />
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td>
												<span class="STYLE10">工号:</span>
												<input type="text" id="qryStaffId" name="qryStaffId" />
											</td>
											<td style="display:none;">
												<span class="STYLE10">地市:</span>
												<select name="qryCityId" id="qryCityId" style="width: 200px;">
													<option value="">
														请选择
													</option>
													<option value="0531">
														济南
													</option>
													<!-- <option value="0534">
														德州
													</option>
													<option value="0543">
														滨州
													</option>
													<option value="0631">
														威海
													</option>
													<option value="0534">
														烟台
													</option>
													<option value="0538">
														泰安
													</option>
													<option value="0539">
														临沂
													</option>
													<option value="0632">
														枣庄
													</option>
													<option value="0634">
														莱芜
													</option>
													<option value="0530">
														菏泽
													</option>
													<option value="0532">
														青岛
													</option>
													<option value="0537">
														济宁
													</option>
													<option value="0633">
														日照
													</option>
													<option value="0546">
														东营
													</option>
													<option value="0533">
														淄博
													</option>
													<option value="0635">
														聊城
													</option>
													<option value="0536">
														潍坊
													</option> -->
												</select>
											</td>
											<td>
												<input type="submit" value="查询" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="100%" bgcolor="#a8c7ce">
				<tr>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">地市编码</span>
						</div>
					</td>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">工号</span>
						</div>
					</td>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">用户名称</span>
						</div>
					</td>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">用户类别</span>
						</div>
					</td>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">联系方式</span>
						</div>
					</td>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">部门</span>
						</div>
					</td>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">用户状态</span>
                        </div>
                    </td>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">备注</span>
						</div>
					</td>
					<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
						<div align="center">
							<span class="STYLE10">操作</span>
						</div>
					</td>
				</tr>
				<%
            for (int i = 0; i < userList.size(); i++) {
                UserBean user = (UserBean) userList.get(i);
            %>
				<tr>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center"><%=citys.get(user.getCityId())%></div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center"><%=user.getLoginId()%></div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center"><%=user.getUserName()%></div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center"><%=types.get(user.getUserType())%></div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center"><%=user.getContactNo()%></div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center"><%=user.getCompany()%></div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <div align="center"><%=statusMap.get(user.getStatus())%></div>
                    </td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center"><%=user.getRemark()%></div>
					</td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19">
						<div align="center">
							<input type="button" value="修改"
								onclick="modify('<%=user.getLoginId()%>')" />
							<input type="button" value="重置密码"
								onclick="resetPasswd('<%=user.getLoginId()%>')" />
							<input type="button" value="赋权"
								onclick="modifyRole('<%=user.getId()%>')" />
							<%if("1".equals(user.getStatus())){ %>
							<input type="button" value="生效" 
                                onclick="modifyUserStatus('<%=user.getLoginId()%>','<%=user.getStatus()%>')" />
							<%}else{ %>
                            <input type="button" value="失效"
                                onclick="modifyUserStatus('<%=user.getLoginId()%>','<%=user.getStatus()%>')" />
                            <%} %>
						</div>
					</td>
				</tr>
				<%}%>
			</table>
		</form>
	</body>
</html>

<script>
function modifyRole(userId){
	var retValue = window.showModalDialog("<%=request.getContextPath()%>/user/modifyRole.do?userId="+userId,'',"toolbar:no;dialogWidth:400px;dialogHeight:490px;help:0;status:no;scrollbars:yes;resize:no;menubar:no");
	if (retValue=="1"){
			document.form1.submit();
	}
}
</script>
