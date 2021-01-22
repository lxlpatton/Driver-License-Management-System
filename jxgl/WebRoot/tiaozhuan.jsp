<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>qx tiaozhuan</title>
    

  </head>
  
  <body>
  <%

if (request.getSession().getAttribute("qx").equals("教练"))
{
	response.sendRedirect("Menu2.jsp");
}
if (request.getSession().getAttribute("qx").equals("学员"))
{
	response.sendRedirect("Menu3.jsp");
}
if (request.getSession().getAttribute("qx").equals("管理员"))
{
	response.sendRedirect("Menu.jsp");
}
 %>
  </body>
</html>

