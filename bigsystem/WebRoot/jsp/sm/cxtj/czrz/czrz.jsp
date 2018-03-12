<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sm.logcheck.controller.*"%>
<html>
<head>
<script src="<%=request.getContextPath()%>/jsp/js/calendar.js" type="text/javascript"></script>
<script language="JavaScript"
            src="<%=request.getContextPath()%>/jsp/js/jquery-1.11.3.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
</head>
<%
String qryNum=request.getAttribute("qryNum")==null?"":request.getAttribute("qryNum")+""; 
String czlx=request.getAttribute("czlx")==null?"":request.getAttribute("czlx")+""; 
String qsrq=request.getAttribute("qsrq")==null?"":request.getAttribute("qsrq")+""; 
String jzrq=request.getAttribute("jzrq")==null?"":request.getAttribute("jzrq")+""; 
String crz_temp="";
String czrid=request.getAttribute("czrid")==null?"":request.getAttribute("czrid")+""; 
String czrname=request.getAttribute("czrname")==null?"":request.getAttribute("czrname")+""; 
crz_temp = czrid+"~"+czrname;
String depart2=request.getAttribute("depart")==null?"":request.getAttribute("depart")+""; 
String depart = "";
depart = new LogCheckController().getDepart();
String czry = "";
czry = new LogCheckController().getCzr();
%>
<body>
<form name="form1" method="post" action="<%=request.getContextPath()%>/jsp/sm/logCheck/logCheck.do">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td height="24" bgcolor="#353c44">
		        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td>
			            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			              <tr>
			                <td width="6%" height="19" valign="bottom"><div align="center"><img src="<%=request.getContextPath()%>/jsp/sm/images/tb.gif" width="14" height="14" /></div></td>
			                <td width="94%" valign="bottom"><span class="STYLE1">操作日志查询</span></td>
			              </tr>
			            </table>
		            </td>
		            <td><div align="right"><span class="STYLE1"> <input type="button" onclick="queryDa();" value="查询">   &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" onclick="exportData();" value="导出"></span></div></td>
		          </tr>
		        </table>
	        </td>
	      </tr>
	    </table>
	    <tr>
	    	<td>
		    	<table>
		    		<tr>
					    <td>
							<span class="STYLE10">&nbsp;号码:</span>
							<input type="text" id="qryNum" name="qryNum" value="<%=qryNum%>"/>
						</td>
						<td>
							<span class="STYLE10">&nbsp;操作类型:</span>
							  <select name="czlx" id="czlx" style="width: 200px;">
							  	<option>全部</option>
			                  	<option value="0" <%if("0".equals(czlx)) {%> selected <%}%>>业务相关</option>
			                  	<option value="1" <%if("1".equals(czlx)) {%> selected <%}%>>系统相关</option>
			                  </select>
						</td>
						<td>起始日期：<input type="text" name="qsrq" id="qsrq" value="<%= qsrq%>"  onClick="calendar(qsrq)"><img name='searchimg' src="<%=request.getContextPath()%>/jsp/sm/images/datetime.gif" style='cursor:hand' onClick="calendar(qsrq)"></td>
				 		<td>截止日期：<input type="text" name="jzrq" id="jzrq" value="<%= jzrq%>"  onClick="calendar(jzrq)"><img name='searchimg' src="<%=request.getContextPath()%>/jsp/sm/images/datetime.gif" style='cursor:hand' onClick="calendar(jzrq)"></td>
					</tr>
				</table>
			</td>
	    </tr>
	    	    <tr>
	    	<td>
		    	<table>
		    		<tr>
					    <td>
							<span class="STYLE10">&nbsp;姓名:</span>
							  <select name="czr" id="czr" style="width: 200px;">
							  	<option value="">全部</option>
							  	<%if(!"".equals(czrid)) {%>
							  	<option value="<%=crz_temp %>" selected><%=czrname %></option>
							  	<%}%>
							  	<%=czry %>
			                  </select>
						</td>
						<td>
							<span class="STYLE10">&nbsp;部门:</span>
							  <select name="depart" id="depart" style="width: 200px;">
							  	<option value="">全部</option>
							  	<%if(!"".equals(depart2)) {%>
							  	<option value="<%=depart2 %>" selected><%=depart2 %></option>
							  	<%}%>
							  	<%=depart %>
			                  </select>
						</td>
					</tr>
				</table>
			</td>
	    </tr>
    <td></td>
  </tr>
<%
List list = (List)request.getAttribute("datalist"); 
String cp = request.getAttribute("curPage")+"";
String allPage= request.getAttribute("allPage")+"";
int curPage = 1;
if(!"null".equals(cp)){
	curPage = Integer.parseInt(cp);
}
Map map = new HashMap();
if(list!=null){
%>
  <tr>
    <td>
    	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
	      <tr>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作账号</span></div></td>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">姓名</span></div></td>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">部门</span></div></td>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">登录IP</span></div></td>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">登录MAC</span></div></td>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作号码</span></div></td>
	        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作详情</span></div></td>
	        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作原因</span></div></td>
	        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作时间</span></div></td>
	      </tr>
			<%
			for (int i = 0; i < list.size(); i++) {
				map = (HashMap) list.get(i);
			%>
			<tr>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("LOGIN_ID") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("USERNAME") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("COMPANY") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("LOGIN_IP") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("LOGIN_MAC") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("OP_NUM") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("OP_FUNC") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("OP_NOTE") %></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=map.get("OP_DATE") %></div></td>
			</tr>
			<%}%>
    	</table>
    </td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong> <%=request.getAttribute("allPageNum")+"" %></strong> 条记录，每页10条，当前第<strong> <%=curPage %></strong> 页，共 <strong><%=request.getAttribute("allPage")+"" %></strong> 页</span></div></td>
        <td width="67%">
	        <table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
	          <tr>
	            <td width="49"><div align="center" style="cursor:pointer;" onclick="gotoPage('1');"><img src="<%=request.getContextPath()%>/jsp/sm/images/main_54.gif" width="40" height="15" /></div></td>
	            <%if(curPage>1){%>
	            <td width="49"><div align="center" style="cursor:pointer;" onclick="gotoPage('<%=curPage-1%>');"><img src="<%=request.getContextPath()%>/jsp/sm/images/main_56.gif" width="45" height="15" /></div></td>
	            <%}%>
	            <%if(!(curPage+"").equals(allPage)){%>
	            <td width="49"><div align="center" style="cursor:pointer;" onclick="gotoPage('<%=curPage+1%>');"><img src="<%=request.getContextPath()%>/jsp/sm/images/main_58.gif" width="45" height="15" /></div></td>
	            <%}%>
	            <td width="49"><div align="center" style="cursor:pointer;" onclick="gotoPage('<%=allPage%>');"><img src="<%=request.getContextPath()%>/jsp/sm/images/main_60.gif" width="40" height="15" /></div></td>
	          </tr>
	        </table>
        </td>
      </tr>
    </table></td>
  </tr>
<%}else{%>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
<tr>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作账号</span></div></td>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">姓名</span></div></td>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">部门</span></div></td>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">登录IP</span></div></td>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">登录MAC</span></div></td>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作号码</span></div></td>
	<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作详情</span></div></td>
	<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作原因</span></div></td>
	<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作时间</span></div></td>
</tr>
<%}%>
</table>
<input type="hidden" name="jumpPage" id="jumpPage">
</form>
</body>
</html>

<script>
function exportData(){
	var qryNum= $("#qryNum").val();
	var czlx= document.getElementById("czlx").value;
	var qsrq= $("#qsrq").val();
	var jzrq= $("#jzrq").val();
	var czr= $("#czr").val();
	var depart= $("#depart").val();
	var param="qryNum="+qryNum+"&czlx="+czlx+"&qsrq="+qsrq+"&jzrq="+jzrq+"&czr="+czr+"&depart="+depart;
	//alert(param); 
	if(qryNum==""&&qsrq==""&&jzrq==""&&czlx==""&&czr==""&&depart==""){
		var rr=confirm("导出全量会占用大量时间，是否继续！");
		if(!rr){
			return;
		}
	}
	window.location.href="<%=request.getContextPath()%>/jsp/sm/logCheck/exportData.do?"+param;
}

function queryDa(){
	document.form1.jumpPage.value="";
	document.form1.submit();
}
//queryDa();
function gotoPage(pagenum) {
	document.form1.jumpPage.value = pagenum;
	document.form1.submit();
	return;
}

	
<%--   	var re;
	var req;
	var url=window.location.href="<%=request.getContextPath()%>/jsp/sm/logCheck/exportData.do?"+param;
		if (window.XMLHttpRequest) { 
	             req = new XMLHttpRequest(); 
	    }else if (window.ActiveXObject) { 
	             eq = new ActiveXObject("Microsoft.XMLHTTP"); 
	    } 
		if(req){
						req.open("POST",url, true); 
						req.onreadystatechange =  function a(){
							 if (req.readyState == 4) { 
									 if (req.status == 200) {  	
											
										    }
									 }
							 }
						 }; 
		req.send(); --%>
<%-- 	var msgInfo = $.ajax({
                       type: "POST",
                       url: window.location.href="<%=request.getContextPath()%>/jsp/sm/logCheck/exportData.do",
                       data: param,
                       async: false
                    }).responseText; --%>		
</script>


