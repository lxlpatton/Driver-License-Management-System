<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=jiaoshixinxi.xls");
%>
<html>
  <head>
    <title>教练信息</title>
  </head>
<body >
  <p>已有教练信息列表：</p>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td bgcolor='#A4B6D7'>教练工号</td>
    <td bgcolor='#A4B6D7'>密码</td>
    <td bgcolor='#A4B6D7'>姓名</td>
    <td bgcolor='#A4B6D7'>性别</td>
    <td bgcolor='#A4B6D7'>校区</td>
    <td bgcolor='#A4B6D7'>车辆</td>
    <td bgcolor='#A4B6D7'>手机</td>
    <td bgcolor='#A4B6D7'>照片</td>
    <td bgcolor='#A4B6D7'>备注</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
  </tr>
  <% 
  	 new CommDAO().delete(request,"jiaoshixinxi"); 
    String url = "jiaoshixinxi_list.jsp?1=1"; 
	String sql =  "select * from jiaoshixinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("jiaoshigonghao") %></td>
    <td><%=map.get("mima") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("xingbie") %></td>
    <td><%=map.get("yuanxiao") %></td>
    <td><%=map.get("zhuanye") %></td>
    <td><%=map.get("shouji") %></td>
    <td><%=map.get("zhaopian") %></td>
    <td><%=map.get("beizhu") %></td>
    
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


