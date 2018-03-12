<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>系统主界面</title>
<script src="../web/js/main.js" type="text/javascript"></script>
<script src="../easyui/jquery.min.js" type="text/javascript"></script>
<script src="../easyui/jquery.easyui.min.js" type="text/javascript"></script>
<link href="../easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="../easyui/themes/icon.css" rel="stylesheet" type="text/css" />
</head>
<body class="easyui-layout"  >

       <div region="north" border="true" split="true" style="overflow: hidden; height: 60px;">
          <table cellpadding=0 cellspacing=0 border=0 height=100% width=100%>
              <tr height=35px>
                <td width=50%><img src="../web/images/logo.png" /></td>
                <td width=50% align="right">  欢迎您：　&nbsp;|&nbsp; 修改密码 &nbsp;| &nbsp;退出系统 &nbsp;|&nbsp;主页&nbsp;&nbsp;&nbsp;&nbsp;</td>
              </tr>
          </table>
       </div>
       
        <div region="west" split="true" title="导航菜单" style="width: 200px;">
            <div id="menu" class="easyui-accordion" >
            <!-- iframe src="../web/left.jsp"></iframe> -->
                   <div title="标题1" data-options="iconCls:'icon-folder',selected:true" style="overflow:auto;padding:10px;">
                   <table><tr><td align="center"><a href="javascript:alert('aaa')">aaa</a></td></tr><tr><td align="center">bbb</td></tr></table>
                   </div>
                   <div title="标题2" data-options="iconCls:'icon-folder'" style="padding:10px;">
                  		<p><span onClick="openTab('百度','https://www.baidu.com')" class="icon-set icon">spantest</span></p>
						<p><span onClick="alert('span')" class="icon-set icon">bbbb</span></p>
                   
                   </div>
                   <div title="标题2" data-options="iconCls:'icon-folder'" style="padding:10px;"></div>
           </div>
       </div>
       <div id="mainPanle" region="center" style="overflow: hidden;">
             <div class="easyui-tabs" fit="true" id="tt" border=false data-options="tools:'#tab-tools'"> </div>
       </div>
       
        <div  align="center" region="south" border="true" split="true" style="overflow: hidden; height: 30px;">
            <div class="footer">版权所有@ 2016-2020  ${requestScope.aaaaaa}</div>
       </div>
       
       <div id="closeMenu" class="easyui-menu" style="width:150px;display:none">
		        <div id="close">关闭</div>
		        <div id="closeall">全部关闭</div>
		        <div id="closeother">除此之外全部关闭</div>
		        <div class="menu-sep"></div>
		        <div id="closeright">当前页右侧全部关闭</div>
		        <div id="closeleft">当前页左侧全部关闭</div>
		</div>
</body>
<script type="text/javascript">
$(function(){
			openTab("welcome","../web/test.jsp");
			openTab("百度","https://www.baidu.com");
			$("#tt").tabs({
				fit: true,
		        onContextMenu : function (e, title) {
		        	tabCloseEven(e, title);
		        }
		    });
			
	});
</script>