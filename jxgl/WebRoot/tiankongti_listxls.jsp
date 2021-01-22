<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=tiankongti.xls");
%>
<html>
  <head>
    <title>填空题</title>
  </head>
<body >
  <p>已有填空题列表：</p>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td bgcolor='#A4B6D7'>编号</td>
    <td bgcolor='#A4B6D7'>试题</td>
    <td bgcolor='#A4B6D7'>科目名称</td>
    <td bgcolor='#A4B6D7'>题型</td>
    <td bgcolor='#A4B6D7'>难易程度</td>
    <td bgcolor='#A4B6D7'>答案</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
  </tr>
  <% 
  	 new CommDAO().delete(request,"tiankongti"); 
    String url = "tiankongti_list.jsp?1=1"; 
	String sql =  "select * from tiankongti where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("bianhao") %></td>
    <td><%=map.get("shiti") %></td>
    <td><%=map.get("kemumingcheng") %></td>
    <td><%=map.get("zhishidianmingcheng") %></td>
    <td><%=map.get("nanyichengdu") %></td>
    <td><%=map.get("daan") %></td>
    
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


