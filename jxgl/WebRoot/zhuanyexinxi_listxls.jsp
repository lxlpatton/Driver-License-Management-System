<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=zhuanyexinxi.xls");
%>
<html>
  <head>
    <title>车辆信息</title>
  </head>
<body >
  <p>已有车辆信息列表：</p>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td bgcolor='#A4B6D7'>车辆</td>
    <td bgcolor='#A4B6D7'>车辆简介</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
  </tr>
  <% 
  	 new CommDAO().delete(request,"zhuanyexinxi"); 
    String url = "zhuanyexinxi_list.jsp?1=1"; 
	String sql =  "select * from zhuanyexinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("zhuanye") %></td>
    <td><%=map.get("zhuanyejianjie") %></td>
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条 
  </body>
</html>


