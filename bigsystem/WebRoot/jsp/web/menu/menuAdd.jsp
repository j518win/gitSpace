<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*"%>
<html>
<head>
<BASE target=_self>
<title>菜单信息新增</title>
<link href="<%=request.getContextPath()%>/jsp/web/css/ymstyle.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=request.getContextPath() %>/jsp/web/js/checkform.js"></script>
</head>
<body>
<%
 %>
<form name="form1" method="post" action="" class="form_font" style="padding-left:8px;padding-top:20px;">
  <table class="default2" width="100%" border="0" cellspacing="1" cellpadding="0" align=center>
				  <tr>
					<td width="35%" align="right" nowrap>菜单名称：</td>
					<td width="65%" align="left"  nowrap>&nbsp;<input name="menuname"  id="menuname" size="30"/><span id="sp_cpmc" class="red">*</span></td>
				  </tr>
				  <tr>
					<td  align="right" nowrap>菜单描述：</td>
					<td  align="left" nowrap>&nbsp;<input name="menudesc" id="menudesc" size="30"/></td>
				  </tr>
				   <tr>
					<td  align="right" nowrap>菜单路径：</td>
					<td  align="left" nowrap>&nbsp;<input name="url" id="url" value="" size="50"/><span class="red">*</span>
					</td>
				   </tr>
				   <tr>
					<td  align="right" nowrap>上级菜单：</td>
					<td  align="left" nowrap>&nbsp;<input name="parentName" id="parentName" size="30" value="顶级菜单" disabled/>
					<img name='searchimg' src="<%=request.getContextPath()%>/jsp/web/images/search.gif" style='cursor:hand' onClick="getParent()">
					<span class="red">*</span>
					</td>
				   </tr>
	    		 <tr align="center"><td colspan="2">
					<input class="buton" type="button" id="baocun" value="添加" onClick="add()">
					<input class="buton" type="button" value="取消" onClick="javascript:window.close();">
					</td></tr>
		 </table>
<input type="hidden" id="parentid" name="parentid" value="000000">
</form>
</body>
</html>
<script>
window.returnValue="";

//增加操作
function add(){
  if (!validate()){
   		return;
   }
  document.forms[0].action="<%=request.getContextPath()%>/jsp/sm/menu/addMenu.do";
  document.forms[0].submit();
}

	function getParent(){
	 	var org=window.showModalDialog(	"<%=request.getContextPath()%>/jsp/sm/menu/getMenuTree.do", 	"", 
	 		"dialogHeight:600px;;;dialogWidth:400px;center:yes;;;help:no;resizable:no;scroll:yes;status:no;;" );
	 	if (org.id=='' || org.menuname=='') return false;
	 	document.getElementById("parentid").value=org.id;
	 	document.getElementById("parentName").value=org.menuname;
	}
	
	
	//验证表单数据的函数
	function validate()
		{	var checkSave = new CheckListClass();
	 
			var nameArr = new Array('menuname','menuname','menudesc','url');//域ID
			var cNameArr =  new Array('菜单名称','菜单名称','菜单描述','菜单路径');//域中文名
			// orNullArr 域是否为空的数组( 0-空, 1-非空 )
			var isNullArr = new Array( 1,1,0,0);  
			//maxArr 域最大字符数, 为0时不需要断
			var maxArr  = new Array(60,60,100,60); 
			// typeArr 域的类型 ( 0-字符, 1-数字, 2-带小数的数字, 3-日期 ,4- 带小时的日期, 5-信箱, 6连接, 7非中文,等)
			var typeArr = new Array(0,0,0,0);
			if(!checkSave.checkInsert(nameArr,cNameArr,isNullArr,maxArr,typeArr)){			
				return false;
			}
			
			return true;
		}
</script>