<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    
    <title>�ɼ��鿴</title>
    <LINK href="css.css" type=text/css 
rel=stylesheet>

  </head>

<body >
  <p>�ɼ��б�</p>


<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="6%" bgcolor="A4B6D7">���</td>
    <td width="7%" bgcolor='#A4B6D7'>�û���</td>
    <td width="12%" bgcolor='#A4B6D7'>�Ծ���</td>
    <td width="11%" bgcolor='#A4B6D7'>�͹���ɼ�</td>
    <td width="17%" bgcolor="A4B6D7">������ɼ�</td>
    <td width="19%" bgcolor="A4B6D7">����ʱ��</td>
    
    <td width="28%" bgcolor="A4B6D7">����</td>
  </tr>
  <%
 new CommDAO().delete(request,"cj"); 
    String url = "cj_list3.jsp?1=1"; 
    String sql =  "select * from cj where 1=1";
 ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
    
 
%>
  <tr>
    <td><%=i %></td>
    <td><%=map.get("username") %></td><td><%=map.get("sjbh") %></td><td><%=map.get("cj") %></td>
    <td><%=map.get("zcj") %></td>
    <td><%=map.get("addtime") %></td>
    <td>  <a href="cj_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a>  <a href="shijuan_detail3.jsp?username=<%=map.get("username") %>&bianhao=<%=map.get("sjbh") %>" >��������</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onClick="javascript:window.print();">��ӡ��ҳ</a>
</body>
</html>

