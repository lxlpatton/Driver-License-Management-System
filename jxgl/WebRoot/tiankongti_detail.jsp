<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�������ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"tiankongti");
     %>
  �������ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
   <tr>
   <td width='11%' height=44>��ţ�</td><td width='39%'><%=m.get("bianhao")%></td>
   </tr><tr>
   
      <td width='11%' height=100  >���⣺</td><td width='39%' colspan=2 height=100 ><%=m.get("shiti")%></td></tr><tr>
      <td width='11%' height=44>��Ŀ���ƣ�</td><td width='39%'><%=m.get("kemumingcheng")%></td></tr><tr>
      <td width='11%' height=44>���ͣ�</td><td width='39%'><%=m.get("zhishidianmingcheng")%></td></tr><tr>
      <td width='11%' height=44>���׳̶ȣ�</td><td width='39%'><%=m.get("nanyichengdu")%></td></tr><tr>
      <td width='11%' height=44>�𰸣�</td><td width='39%'><%=m.get("daan")%></td></tr><tr>
<td colspan=3 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



