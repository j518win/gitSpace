<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<BASE target=_self>
<title>菜单信息</title>
<link href="<%=request.getContextPath()%>/jsp/web/css/tab_query.css" rel="stylesheet" type="text/css" />
</head>
<link rel="StyleSheet" href="<%=request.getContextPath()%>/jsp/web/css/dtree.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/web/js/dtree.js"></script>
<%
String meun=request.getAttribute("menuTree")+"";
String roleId = request.getAttribute("roleId")+"";
%>
<body>
<br>
<form name="form1" action="<%=request.getContextPath()%>/jsp/sm/role/setRoleMenu.do" method="post">
<input type="hidden" id="roleId" name="roleId" value="<%=roleId %>"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="check_table">
  		<tr>
			<td align="right" >
				<table  border="0" cellspacing="0" cellpadding="0" align="right">
      				<tr><td align="right" valign="middle" ><img src="<%=request.getContextPath()%>/jsp/web/images/sanji_3.gif" /></td>
        				<td align="left" valign="middle"   background="<%=request.getContextPath()%>/jsp/web/images/sanji_4.gif" >
        				<a href="#" class="cha" onclick="javascript:retVal()">确&nbsp;&nbsp;定</a>
        				<a href="#" class="zeng" onclick="cancel()">返&nbsp;&nbsp;回</a>
        				<a href="#" class="shan" onclick="closeAll()">全部折叠</a>
        				<a href="#" class="xiu" onclick="openAll()" >全部展开</a>
        				</td>
        				<td align="left" valign="middle" ><img src="<%=request.getContextPath()%>/jsp/web/images/sanji_5.gif" /></td>
      				</tr>
    			</table>
    		</td>
  		</tr>
</table>

<table>
<tr algin="center"><td>
<%=meun%>
</td><td></td>
</tr>
</table>
<input type="hidden" id="menusId" name="menusId" value=""/>
</form>
</body>
</html>
<script>
	function retVal(){
	    var tmp ='';
		var a = d.aNodes.length;
		var obj = d.aNodes;
		for (var i=0;i<a;i++){
			var b = obj[i];
			if (b._check){
				tmp = tmp + b.id + ",";
			}
		}
		document.getElementById("menusId").value = tmp;
		document.form1.submit();
	}
	
	function cancel(){
		window.close();
	}
	
</script>