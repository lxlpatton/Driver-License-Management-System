<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>���ݷ�����״ͼ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>
     <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
     
        <script src="https://img.highcharts.com.cn/highcharts/highcharts.js"></script>
        <script src="https://img.highcharts.com.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
  </head>

  <body >
 
  <%
Integer timu=0;
  Integer[] timus=new Integer[4];
    String url = ""; 
    String sql =  " select count(id) as danxuanti from danxuanti "+  
    		      " UNION all "+
    		      " SELECT count(id) as danxuanti FROM `panduanti` "+
    		      " UNION all "+
    		      " SELECT count(id) as danxuanti FROM `tiankongti` "+
    		      " UNION all "+
    		      " SELECT count(id) as danxuanti  FROM `bianchengti`  where  1=1";
 ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	//System.out.print("======="+list);
	for(HashMap map:list){ 
	timu=Integer.valueOf(map.get("danxuanti").toString());
	timus[i]=timu;
	//out.print(map.get("danxuanti"));
	i++;
  }%>
 
 
  ���ݷ�����״ͼ:
  <div id="container"  style="width:800px;height:400px:"></div>
 

  <script>
 var chart = Highcharts.chart('container',{
	chart: {
		type: 'column'//area,column,line,pie
	},
	title: {
		text: '������Ŀͳ��'
	},
	
	 xAxis: {
		 categories: [
			 '��ѡ','�ж�','���','���'], 
		crosshair: true
	},  
	yAxis: {
		min: 0,
		 allowDecimals: false, 
		title: {
			text: '��������'
		}
	},
	/* tooltip: {
		// head + ÿ�� point + footer ƴ�ӳ������� table
		headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		'<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
		footerFormat: '</table>',
		shared: true,
		useHTML: true
	}, */
	/* plotOptions: {
		column: {
			pointPadding: 0.2,
	        borderWidth: 0,
	        dataLabels: {
	            enabled: true
	        }
		}
	}, */
	series: [{
		name: '��������',
		data: [<%=timus[0]%>,<%=timus[1]%>,<%=timus[2]%>,<%=timus[3]%>]
	}<%-- , {
		name: '�ж�',
		data: [<%=timus[1]%>]
	}, {
		name: '���',
		data: [<%=timus[2]%>]
	}, {
		name: '���',
		data: [<%=timus[3]%>]
	} --%>]
});

  </script>
  
<br><br>
  </body>
</html>


