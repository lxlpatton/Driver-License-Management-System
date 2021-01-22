<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有车辆信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:   车辆：<input name="zhuanye" type="text" id="zhuanye" style='border:solid 1px #000000; color:#666666;width:80px' />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='zhuanyexinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td width="355" bgcolor='#A4B6D7'>车辆</td>
    <td width="355" align="center" bgcolor="#A4B6D7">车辆简介</td>
    
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
    <td width="60" align="center" bgcolor="#A4B6D7">操作</td>
  </tr>
  <% 
  	  
  	 new CommDAO().delete(request,"zhuanyexinxi"); 
    String url = "zhuanyexinxi_list.jsp?1=1"; 
	String sql ="select * from zhuanyexinxi where 1=1";
	
    if(request.getParameter("zhuanye")=="" ||request.getParameter("zhuanye")==null ){}else{sql=sql+" and zhuanye like '%"+request.getParameter("zhuanye")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	
	
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("zhuanye") %></td>
    <td width="355" align="center"><%=map.get("zhuanyejianjie") %></td>
    
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="zhuanyexinxi_modf.jsp?id=<%=map.get("id")%>">修改</a>  <a href="zhuanyexinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="zhuanyexinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }

  </body>
</html>


