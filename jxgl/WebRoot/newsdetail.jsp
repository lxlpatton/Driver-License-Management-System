<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
<head>
<title>详细</title>
<LINK href="css.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #666666;
	font-weight: bold;
}
-->
</style>
</head>
 <%
  String id=request.getParameter("id");
   new CommDAO().commOper("update newsproclaim set dianjilv=dianjilv+1 where id="+id);
%>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p>
  <%
    HashMap m = new CommDAO().getmap(id,"newsproclaim");
     %>
</p>
<p>&nbsp;</p>
<table width="95%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#ADCEEF" class="newsline" style="border-collapse:collapse">
  <tr>
    <td height="46" align="center" class="STYLE3"><span class="STYLE1"><%=m.get("biaoti") %> (被访问<%=m.get("dianjilv") %>次) </span></td>
  </tr>
  <tr>
    <td height="110" align="left"><%=m.get("neirong") %></td>
  </tr>
  <tr>
    <td height="33" align="right">
	
		
      <input type="button" name="Submit5" value="返回" onClick="javascript:history.back();" style=" height:19px; border:solid 1px #000000; color:#666666"></td>
  </tr>
</table>
</body>
</html>