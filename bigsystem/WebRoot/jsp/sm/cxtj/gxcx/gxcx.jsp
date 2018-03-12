<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sm.gxcx.GxcxData"%>
<html>
  <head>
    <title>个性查询</title>
  </head>

<%
String xml=new GxcxData().reData();
%>

<SCRIPT LANGUAGE="Javascript" SRC="../FusionCharts/js/FusionCharts.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
   
   function updateChart(DOMId){
     
      var chartObj = getChartFromId("chart1Id");
      
      chartObj.setDataXML(xml); 
    
   }
   
    function printChart(){
    //Get chart from its ID
    var chartToPrint = getChartFromId("chart1Id");
    chartToPrint.print();
	 }
   // export the chart to image
    function saveChart(){
    //Get chart from its ID
    var chartToPrint = getChartFromId("chart1Id");
    chartToPrint.saveAsImage();
	 }
   
</SCRIPT>

<BODY>
		<br>
		<div id="chart1div" align="center">111</div>
		<script language="JavaScript">
        var xml = '<%=xml%>';
			if (xml != '') {
				//宽  高
				var chart1 = new FusionCharts("../FusionCharts/Charts/Column2D.swf", "chart1Id","1000", "400", "0", "1");
				chart1.setDataXML(xml);
				chart1.render("chart1div");
			}
		</script>

</BODY>
</html>