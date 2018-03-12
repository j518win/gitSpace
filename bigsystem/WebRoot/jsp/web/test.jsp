<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>test</title>
<script src="../easyui/jquery.min.js" type="text/javascript"></script>
<script src="../easyui/jquery.easyui.min.js" type="text/javascript"></script>
<link href="../easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="../easyui/themes/icon.css" rel="stylesheet" type="text/css" />
</head>
<body style = "">

	<div id="tb" style="">
		<table>
			<tr>
				<td><input id="struCode" type="hidden">
				</td>
				<td>机构名称：<input id="struName" class="easyui-validatebox" style="width:80px" readonly=readonly></td>
			    <td><a href="#" id="selStru" class="easyui-linkbutton"
				iconCls="icon-search">选择机构</a></td>	
													
				<td>起始时间: <input id="startTime" class="time" editable="false"
					style="width:100px">到: <input id="endTime" class="time"
					editable="false" style="width:100px">
				</td>
				<td><a href="#" id="query" class="easyui-linkbutton"
					iconCls="icon-search">查询</a>
				</td>
				<td><a href="#" id="cancel"
					class="easyui-linkbutton" iconCls="icon-cancel">清空</a></td>
			</tr>
		</table>
	</div>
	<body>
	<h2>Basic DataGrid</h2>
	<p>The DataGrid is created from markup, no JavaScript code needed.</p>
	<div style="margin:20px 0;"></div>
	
	<table class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
			data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:80">Item ID</th>
				<th data-options="field:'productid',width:100">Product</th>
				<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
				<th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
				<th data-options="field:'attr1',width:250">Attribute</th>
				<th data-options="field:'status',width:60,align:'center'">Status</th>
			</tr>
		</thead>
	</table>

</body>