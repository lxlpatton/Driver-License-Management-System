<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>单选题详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"danxuanti");
     %>
  单选题详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
   <tr>
   <td width='11%' height=44>编号：</td><td width='39%'><%=m.get("bianhao")%></td>
   </tr><tr>
   
      <td width='11%' height=100  >试题：</td><td width='39%' colspan=2 height=100 ><%=m.get("shiti")%></td></tr><tr>
      <td width='11%' height=44>科目名称：</td><td width='39%'><%=m.get("kemumingcheng")%></td></tr><tr>
      <td width='11%' height=44>知识点名称：</td><td width='39%'><%=m.get("zhishidianmingcheng")%></td></tr><tr>
      <td width='11%' height=44>难易程度：</td><td width='39%'><%=m.get("nanyichengdu")%></td></tr><tr>
      <td width='11%' height=44>选项A：</td><td width='39%'><%=m.get("xuanxiangA")%></td></tr><tr>
      <td width='11%' height=44>选项B：</td><td width='39%'><%=m.get("xuanxiangB")%></td></tr><tr>
      <td width='11%' height=44>选项C：</td><td width='39%'><%=m.get("xuanxiangC")%></td></tr><tr>
      <td width='11%' height=44>选项D：</td><td width='39%'><%=m.get("xuanxiangD")%></td></tr><tr>
      <td width='11%' height=44>答案：</td><td width='39%'><%=m.get("daan")%></td></tr><tr>
<td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



