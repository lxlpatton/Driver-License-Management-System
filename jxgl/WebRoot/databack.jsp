<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>���ݱ���</title>
    

  </head>
  
  <body>
  <%
 
if (request.getSession().getAttribute("qx").equals("����Ա"))
{

String sql="";
  sql="backup database javazxksxtkfsj to disk='D:/javazxksxtkfsj.dat'";
	  	
new CommDAO().commOper(sql); 
out.print("<script>alert('�����ɹ�!!���������ݿ��ѳɹ�������D:/javazxksxtkfsj.dat');history.back();</script>");
  	  
}
else
{
out.print("<script>alert('�Բ���,��û�и�Ȩ��');history.back();</script>");
}

 %>
  </body>
</html>
























