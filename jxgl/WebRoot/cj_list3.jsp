<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    
    <title>成绩查看</title>
    <LINK href="css.css" type=text/css 
rel=stylesheet>

  </head>

<body >
  <p>成绩列表：</p>


<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="6%" bgcolor="A4B6D7">序号</td>
    <td width="7%" bgcolor='#A4B6D7'>用户名</td>
    <td width="12%" bgcolor='#A4B6D7'>试卷编号</td>
    <td width="11%" bgcolor='#A4B6D7'>客观题成绩</td>
    <td width="17%" bgcolor="A4B6D7">主观题成绩</td>
    <td width="19%" bgcolor="A4B6D7">测试时间</td>
    
    <td width="28%" bgcolor="A4B6D7">操作</td>
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
    <td>  <a href="cj_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>  <a href="shijuan_detail3.jsp?username=<%=map.get("username") %>&bianhao=<%=map.get("sjbh") %>" >主观题打分</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
</body>
</html>

