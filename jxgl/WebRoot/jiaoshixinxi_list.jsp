<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>教练信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有教练信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:   教练工号：<input name="jiaoshigonghao" type="text" id="jiaoshigonghao" style='border:solid 1px #000000; color:#666666;width:80px' /> 姓名：<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666;width:80px' />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='jiaoshixinxi_listxls.jsp';" />
</form>

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
    
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
    <td width="60" align="center" bgcolor="#A4B6D7">操作</td>
  </tr>
  <% 
  	  
  	 new CommDAO().delete(request,"jiaoshixinxi"); 
    String url = "jiaoshixinxi_list.jsp?1=1"; 
	String sql ="select * from jiaoshixinxi where 1=1";
	
    if(request.getParameter("jiaoshigonghao")=="" ||request.getParameter("jiaoshigonghao")==null ){}else{sql=sql+" and jiaoshigonghao like '%"+request.getParameter("jiaoshigonghao")+"%'";}
    if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
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
    <td width='90' align='center'><a href='<%=map.get("zhaopian") %>' target='_blank'><img src='<%=map.get("zhaopian") %>' width=88 height=99 border=0 /></a></td>
    
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="jiaoshixinxi_modf.jsp?id=<%=map.get("id")%>">修改</a>  <a href="jiaoshixinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="jiaoshixinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }

  </body>
</html>


