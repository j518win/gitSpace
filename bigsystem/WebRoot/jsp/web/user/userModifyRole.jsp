<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<BASE target=_parent>
<title>角色管理</title>
<link href="<%=request.getContextPath()%>/jsp/web/css/ymstyle.css" rel="stylesheet" type="text/css" />
</head>
<%
	List existRoleList = (List)request.getAttribute("existRoleList");
	List notExistRoleList = (List)request.getAttribute("notExistRoleList");
	String userId = request.getAttribute("userId")==null?"":request.getAttribute("userId")+"";
%>
<body>

<form name="form1" method="post" action="<%=request.getContextPath()%>/user/setUserRole.do" class="form_font">
  <div  class="tiaojian">
  <br>
  <table width="100%" border="0" cellspacing="1" cellpadding="0" align=center>
		<tr>
				<td align="center"><span style="color:red;font-size:12px;">用户可选角色</span></td>
				<td></td>
				<TD align="center"><span style="color:red;font-size:12px">用户当前角色</span></td>
		</tr>
		<tr>
				<td ></td>
				<td></td>
				<td ></td>
		</tr>
		<tr>
				<td>
					<select name="yh_js_leaving"  size="25"  value="1" multiple="true" style="width:150" >
					<%	
						if(notExistRoleList!=null && notExistRoleList.size()>0)	
							for(int i=0;i<notExistRoleList.size();i++){
							Map map_tem= (Map)notExistRoleList.get(i);
					%>
						<option value="<%=map_tem.get("ID")%>" ><%=map_tem.get("ROLENAME")%></option>
					<%
							}				
					%>					
					</select>
				</TD>
				<TD>
					<INPUT class="buton" type="button" onclick="moveright()"  value="  <<  " />	<br>
					<br>
					<INPUT class="buton" type="button" onclick="moveleft()" value="  >>  "/>	<br>
				</td>
				<td>
				<select name="yh_js"  size="25" value="1" multiple="true"  style="width:150" >
					<%	
						if(existRoleList!=null && existRoleList.size()>0)	
							for(int i=0;i<existRoleList.size();i++){
							Map map_tem= (Map)existRoleList.get(i);
					%>
						<option value="<%=map_tem.get("ROLEID")%>" ><%=map_tem.get("ROLENAME")%></option>
					<%
							}				
					%>
					</select>
				</td>	
		</tr>
		<tr>
				<td ></td>
				<td></td>
				<td ></td>
		</tr>
		<tr>
				<td ></td>
				<td></td>
				<td ></td>
		</tr>		
   <tr align="center"><td colspan="3">
  			<input  class="buton" type="button" id="baocun" value="保存" onclick="save()">
  			<input  class="buton" type="button" value="关闭" onclick="javascript:window.close()"></td>
  </tr>
</table>
</div>
<input type="hidden" id="userId" name="userId" value="<%=userId%>"/>
<input type="hidden" id="roleIds" name="roleIds" value="" />
</form>
</body>
</html>
<script>
		
 function moveright()
   {	
     var lens=document.form1.yh_js.options.length
     for( i=lens-1;i>=0;i--){
      if (document.form1.yh_js.options[i].selected==true){       
       var opn=document.createElement("<OPTION>")
       document.form1.yh_js_leaving.options.add(opn);
       opn.innerText=document.form1.yh_js.options[i].innerText;
       opn.value=document.form1.yh_js.options[i].value;
       document.form1.yh_js.options.remove(i);
      }
     }     
   }
function moveleft()
   {
     var lens=document.form1.yh_js_leaving.options.length
     for(i=lens-1;i>=0;i--){
      if (document.form1.yh_js_leaving.options[i].selected==true){       
       var opn=document.createElement("<OPTION>")
       document.form1.yh_js.options.add(opn);
       opn.innerText=document.form1.yh_js_leaving.options[i].innerText;
       opn.value=document.form1.yh_js_leaving.options[i].value;
       document.form1.yh_js_leaving.options.remove(i);
      }
     }
   }
 
function save(){
	var lens=document.form1.yh_js.options.length;
	var js_id="";
	for(i=lens-1;i>=0;i--){
		js_id = js_id+document.form1.yh_js.options[i].value+"#";	
	}
	document.form1.roleIds.value = js_id;
	document.form1.submit();	
} 
</script>