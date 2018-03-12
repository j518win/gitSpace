<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sm.user.bean.UserBean"%>
<html>
    <head>
        <script language="JavaScript"
            src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
        <link href="<%=request.getContextPath()%>/jsp/css/common.css"
            rel="stylesheet" type="text/css" />

        <script type="text/javascript">
            function addRole(){
                if(confirm('确定要提交么？')){
                    var roleName=$("#roleName").val();
                    var roleDesc=$("#roleDesc").val();
                    var param="roleName="+roleName+"&roleDesc="+roleDesc;

                    if(""==roleName){
                        alert("角色名不能为空！");
                        return;
                    }

                    if(""==roleDesc){
                        alert("请为角色增加描述！");
                        return;
                    }
                    
                    var msgInfo = $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/jsp/sm/role/createRole.do",
                        data: param,
                        async: false
                     }).responseText;

                    if("success"==msgInfo){
                        alert("添加成功！");
                        window.returnValue="success";
                        window.close();
                    }else{
                        alert("添加失败：请稍后再试！");
                        window.close();
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
                                                <span class="STYLE1">增加角色</span>
                                            </td>
                                            <td>
                                                <input type="button" id="addBtn" onclick="addRole()" value="提交" />
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
                            <span class="STYLE10">角色名称</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="roleName" id="roleName" style="width: 200px;"/>
                    </td>
                </tr>
                <tr>
                    <td width="40%" height="20" bgcolor="d3eaef" class="STYLE6">
                        <div align="center">
                            <span class="STYLE10">角色描述</span>
                        </div>
                    </td>
                    <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                        <input type="text" name="roleDesc" id="roleDesc" style="width: 200px;"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
