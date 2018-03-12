<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sm.user.bean.UserBean"%>
<html>
    <head>
        <script language="JavaScript"
            src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
        <link href="<%=request.getContextPath()%>/jsp/css/common.css"
            rel="stylesheet" type="text/css" />

        <%
            UserBean qryUser;
            String msgInfo = (String)request.getAttribute("msgInfo");
            if("success".equals(msgInfo)){
            	qryUser = (UserBean)request.getAttribute("qryUser");
            }else{
            	qryUser = new UserBean();
            }
        %>

        <script type="text/javascript">
            $(document).ready(function(){
                var msgInfo='<%=msgInfo%>';
                    if ("fail" == msgInfo) {
                        alert("查询用户信息异常！");
                        return;
                    } else if ("noUser" == msgInfo) {
                        alert("根据工号未查询到用户！");
                        return;
                    } 
                    $("#userType").val("<%=qryUser.getUserType()%>");
                    $("#adminFlag").val("<%=qryUser.getAdminFlag()%>");
                    $("#cityId").val("<%=qryUser.getCityId()%>");
                    $("#status").val("<%=qryUser.getStatus()%>");
             });

            function modifyUser(){
            	if(confirm('确定要提交修改么？')){
            	    var staffId=$("#staffId").val();
            	    var cityId=$("#cityId").val();
            	    var userType=$("#userType").val();
            	    var adminId=$("#adminId").val();
            	    var contactNo=$("#contactNo").val();
            	    var company=$("#company").val();
            	    var remark=$("#remark").val();
            	    var adminFlag=$("#adminFlag").val();
            	    var userName=$("#userName").val();
            	    var status=$("#status").val();
            	    var param="staffId="+staffId+"&cityId="+cityId+"&userType="+userType+"&adminFlag="+adminFlag+"&userName="+userName+
            	    "&adminId="+adminId+"&contactNo="+contactNo+"&company="+company+"&remark="+remark+"&status="+status;
                	
            		var msgInfo = $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/user/modifyUser.do",
                        data: param,
                        async: false
                     }).responseText;

                    if("success"==msgInfo){
                        alert("修改成功！");
                        window.returnValue="success";
                        window.close();
                    }else if("noUser"){
                        alert("修改失败：未找到用户!");
                    }else{
                        alert("修改失败：请稍后再试！");
                    }
            	}
            }
        </script>
    </head>
    <body>
        <form name="form1" method="post">
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
                                            <td width="90%">
                                                <span class="STYLE1">用户管理</span>
                                            </td>
                                            <td>
                                                <input type="button" id="modifyBtn" onclick="modifyUser()" value="修改" />
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
                            <span class="STYLE10">工号</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="staffId" id="staffId" style="width: 200px;" readonly="readonly" value="<%=qryUser.getLoginId()%>"/>
                    </td>
                </tr>
                <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">用户名称</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="userName" id="userName" style="width: 200px;" value="<%=qryUser.getUserName()%>"/>
                    </td>
                </tr>
                <tr style="display:none;">
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">地市</span>
                            
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <select name="cityId" id="cityId" style="width: 200px;" disabled="disabled">
                            <option value="0531">济南</option>
                            <!-- <option value="0534">德州</option>
                            <option value="0543">滨州</option>
                            <option value="0631">威海</option>
                            <option value="0534">烟台</option>
                            <option value="0538">泰安</option>
                            <option value="0539">临沂</option>
                            <option value="0632">枣庄</option>
                            <option value="0634">莱芜</option>
                            <option value="0530">菏泽</option>
                            <option value="0532">青岛</option>
                            <option value="0537">济宁</option>
                            <option value="0633">日照</option>
                            <option value="0546">东营</option>
                            <option value="0533">淄博</option>
                            <option value="0635">聊城</option>
                            <option value="0536">潍坊</option> -->
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">用户类别</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <select name="userType" id="userType" style="width: 200px">
                            <option value="1">客服</option>
                            <option value="2">营业</option>
                            <option value="3">机房</option>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">责任人</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="adminId" id="adminId" style="width: 200px" value="<%=qryUser.getAdminId()%>"/>
                    </td>
                </tr>
                 <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">联系方式</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="contactNo" id="contactNo" style="width: 200px" value="<%=qryUser.getContactNo() %>"/>
                    </td>
                </tr>
                 <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">部门</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="company" id="company" style="width: 200px" value="<%=qryUser.getCompany()%>"/>
                    </td>
                </tr>
                <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">状态</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <select name="status" id="status" style="width: 200px">
                            <option value="0">生效</option>
                            <option value="1">失效</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">备注</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="remark" id="remark" style="width: 200px" value="<%=qryUser.getRemark()%>"/>
                    </td>
                </tr>
                 <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">权限级别</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <select name="adminFlag" id="adminFlag" style="width: 200px" disabled="disabled">
                            <option value="0">管理员</option>
                            <option value="1">普通工号</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
