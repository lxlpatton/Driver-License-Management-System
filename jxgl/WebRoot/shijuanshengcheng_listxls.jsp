<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=shijuanshengcheng.xls");
%>
<html>
  <head>
    <title>�Ծ�����</title>
  </head>
<body >
  <p>�����Ծ������б�</p>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">���</td>
	
    <td bgcolor='#A4B6D7'>�Ծ���</td>
    <td bgcolor='#A4B6D7'>��Ŀ����</td>
    <td bgcolor='#A4B6D7'>����</td>
    <td bgcolor='#A4B6D7'>���׳̶�</td>
    <td bgcolor='#A4B6D7'>ѡ������</td>
    <td bgcolor='#A4B6D7'>ѡ�����ֵ</td>
    <td bgcolor='#A4B6D7'>�ж�����</td>
    <td bgcolor='#A4B6D7'>�ж����ֵ</td>
    <td bgcolor='#A4B6D7'>�������</td>
    <td bgcolor='#A4B6D7'>������ֵ</td>
    <td bgcolor='#A4B6D7'>�������</td>
    <td bgcolor='#A4B6D7'>��ʼ����</td>
    <td bgcolor='#A4B6D7'>��������</td>
    <td bgcolor='#A4B6D7'>�����</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">���ʱ��</td>
  </tr>
  <% 
  	 new CommDAO().delete(request,"shijuanshengcheng"); 
    String url = "shijuanshengcheng_list.jsp?1=1"; 
	String sql =  "select * from shijuanshengcheng where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("shijuanbianhao") %></td>
    <td><%=map.get("kemumingcheng") %></td>
    <td><%=map.get("zhishidianmingcheng") %></td>
    <td><%=map.get("nanyichengdu") %></td>
    <td><%=map.get("xuanzetishu") %></td>
    <td><%=map.get("xuanzetifenzhi") %></td>
    <td><%=map.get("panduantishu") %></td>
    <td><%=map.get("panduantifenzhi") %></td>
    <td><%=map.get("tiankongtishu") %></td>
    <td><%=map.get("tiankongtifenzhi") %></td>
    <td><%=map.get("bianchengtishu") %></td>
    <td><%=map.get("kaishiriqi") %></td>
    <td><%=map.get("jieshuriqi") %></td>
    <td><%=map.get("tianjiaren") %></td>
    
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


