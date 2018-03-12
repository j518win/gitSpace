<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<BASE target=_self>
<title>菜单信息</title>
<link href="<%=request.getContextPath()%>/jsp/web/css/tab_query.css" rel="stylesheet" type="text/css" />
</head>
<link rel="StyleSheet" href="<%=request.getContextPath()%>/jsp/web/js/dtree.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/web/js/dtree.js"></script>
<%
String meun=request.getAttribute("menuTree")+"";
%>
<body>
<br>
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

<form name="form1" action="" method="post">
<table>
<tr algin="center"><td>
<%=meun%>
</td><td></td>
</tr>
</table>
<input type="hidden" id="menuname" name="menuname" value=""/>
<input type="hidden" id="menuid" name="menuid" value=""/>
</form>
</body>
</html>
<script>
window.returnValue=new  menu("","");

function menu(id,menuname){
	this.id=id;
	this.menuname=menuname;
}

	function getRadioSelected(nodeId){
		document.getElementById("menuname").value = d.aNodes[nodeId].name;	
		document.getElementById("menuid").value = d.aNodes[nodeId].id;	
	} 
	
	function retVal(){
	    if (document.getElementById("menuname").value!=""){
	    	window.returnValue=new  menu(document.getElementById("menuid").value,document.getElementById("menuname").value);
	    }
	    window.close();
		
	}
	
	function cancel(){
		window.close();
	}
	
	
</script>