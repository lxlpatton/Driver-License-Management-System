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
    <title>试卷生成</title>
  </head>
<body >
  <p>已有试卷生成列表：</p>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td bgcolor='#A4B6D7'>试卷编号</td>
    <td bgcolor='#A4B6D7'>科目名称</td>
    <td bgcolor='#A4B6D7'>题型</td>
    <td bgcolor='#A4B6D7'>难易程度</td>
    <td bgcolor='#A4B6D7'>选择题数</td>
    <td bgcolor='#A4B6D7'>选择题分值</td>
    <td bgcolor='#A4B6D7'>判断题数</td>
    <td bgcolor='#A4B6D7'>判断题分值</td>
    <td bgcolor='#A4B6D7'>填空题数</td>
    <td bgcolor='#A4B6D7'>填空题分值</td>
    <td bgcolor='#A4B6D7'>简答题数</td>
    <td bgcolor='#A4B6D7'>开始日期</td>
    <td bgcolor='#A4B6D7'>结束日期</td>
    <td bgcolor='#A4B6D7'>添加人</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
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
以上数据共<%=i %>条 
  </body>
</html>


