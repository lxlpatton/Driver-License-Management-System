<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�Ծ�������ϸ</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"shijuanshengcheng");
     %>
  �Ծ�������ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
   <tr>
   <td width='11%' height=44>�Ծ��ţ�</td><td width='39%'><%=m.get("shijuanbianhao")%></td>
   </tr><tr>
   
      <td width='11%' height=44>��Ŀ���ƣ�</td><td width='39%'><%=m.get("kemumingcheng")%></td></tr><tr>
      <td width='11%' height=44>���ͣ�</td><td width='39%'><%=m.get("zhishidianmingcheng")%></td></tr><tr>
      <td width='11%' height=44>���׳̶ȣ�</td><td width='39%'><%=m.get("nanyichengdu")%></td></tr><tr>
      <td width='11%' height=44>ѡ��������</td><td width='39%'><%=m.get("xuanzetishu")%></td></tr><tr>
      <td width='11%' height=44>ѡ�����ֵ��</td><td width='39%'><%=m.get("xuanzetifenzhi")%></td></tr><tr>
      <td width='11%' height=44>�ж�������</td><td width='39%'><%=m.get("panduantishu")%></td></tr><tr>
      <td width='11%' height=44>�ж����ֵ��</td><td width='39%'><%=m.get("panduantifenzhi")%></td></tr><tr>
      <td width='11%' height=44>���������</td><td width='39%'><%=m.get("tiankongtishu")%></td></tr><tr>
      <td width='11%' height=44>������ֵ��</td><td width='39%'><%=m.get("tiankongtifenzhi")%></td></tr><tr>
      <td width='11%' height=44>���������</td><td width='39%'><%=m.get("bianchengtishu")%></td></tr><tr>
      <td width='11%' height=44>��ʼ���ڣ�</td><td width='39%'><%=m.get("kaishiriqi")%></td></tr><tr>
      <td width='11%' height=44>�������ڣ�</td><td width='39%'><%=m.get("jieshuriqi")%></td></tr><tr>
      <td width='11%' height=44>����ˣ�</td><td width='39%'><%=m.get("tianjiaren")%></td></tr><tr>
<td colspan=3 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=��ӡ onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



