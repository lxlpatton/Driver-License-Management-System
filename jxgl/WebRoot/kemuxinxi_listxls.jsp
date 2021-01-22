<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=kemuxinxi.xls");
%>
<html>
  <head>
    <title>科目信息</title>
  </head>
<body >
  <p>已有科目信息列表：</p>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td bgcolor='#A4B6D7'>科目名称</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
  </tr>
  <% 
  	 new CommDAO().delete(request,"kemuxinxi"); 
    String url = "kemuxinxi_list.jsp?1=1"; 
	String sql =  "select * from kemuxinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("kemumingcheng") %></td>
    
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


