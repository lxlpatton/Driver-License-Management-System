<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>科目信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有科目信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:   科目名称：<input name="kemumingcheng" type="text" id="kemumingcheng" style='border:solid 1px #000000; color:#666666;width:80px' />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='kemuxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td bgcolor='#A4B6D7'>科目名称</td>
    
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
    <td width="60" align="center" bgcolor="#A4B6D7">操作</td>
  </tr>
  <% 
  	  
  	 new CommDAO().delete(request,"kemuxinxi"); 
    String url = "kemuxinxi_list.jsp?1=1"; 
	String sql ="select * from kemuxinxi where 1=1";
	
    if(request.getParameter("kemumingcheng")=="" ||request.getParameter("kemumingcheng")==null ){}else{sql=sql+" and kemumingcheng like '%"+request.getParameter("kemumingcheng")+"%'";}
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
    <td width="60" align="center"><a href="kemuxinxi_modf.jsp?id=<%=map.get("id")%>">修改</a>  <a href="kemuxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="kemuxinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }

  </body>
</html>


