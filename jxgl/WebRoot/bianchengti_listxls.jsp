<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=bianchengti.xls");
%>
<html>
  <head>
    <title>�����</title>
  </head>
<body >
  <p>���м�����б�</p>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">���</td>
	
    <td bgcolor='#A4B6D7'>���</td>
    <td bgcolor='#A4B6D7'>����</td>
    <td bgcolor='#A4B6D7'>��Ŀ����</td>
    <td bgcolor='#A4B6D7'>��������</td>
    <td bgcolor='#A4B6D7'>���׳̶�</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">���ʱ��</td>
  </tr>
  <% 
  	 new CommDAO().delete(request,"bianchengti"); 
    String url = "bianchengti_list.jsp?1=1"; 
	String sql =  "select * from bianchengti where 1=1";
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
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
�������ݹ�<%=i %>�� 
  </body>
</html>


