<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>试卷生成详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"shijuanshengcheng");
     %>
  试卷生成详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
   <tr>
   <td width='11%' height=44>试卷编号：</td><td width='39%'><%=m.get("shijuanbianhao")%></td>
   </tr><tr>
   
      <td width='11%' height=44>科目名称：</td><td width='39%'><%=m.get("kemumingcheng")%></td></tr><tr>
      <td width='11%' height=44>题型：</td><td width='39%'><%=m.get("zhishidianmingcheng")%></td></tr><tr>
      <td width='11%' height=44>难易程度：</td><td width='39%'><%=m.get("nanyichengdu")%></td></tr><tr>
      <td width='11%' height=44>选择题数：</td><td width='39%'><%=m.get("xuanzetishu")%></td></tr><tr>
      <td width='11%' height=44>选择题分值：</td><td width='39%'><%=m.get("xuanzetifenzhi")%></td></tr><tr>
      <td width='11%' height=44>判断题数：</td><td width='39%'><%=m.get("panduantishu")%></td></tr><tr>
      <td width='11%' height=44>判断题分值：</td><td width='39%'><%=m.get("panduantifenzhi")%></td></tr><tr>
      <td width='11%' height=44>填空题数：</td><td width='39%'><%=m.get("tiankongtishu")%></td></tr><tr>
      <td width='11%' height=44>填空题分值：</td><td width='39%'><%=m.get("tiankongtifenzhi")%></td></tr><tr>
      <td width='11%' height=44>简答题数：</td><td width='39%'><%=m.get("bianchengtishu")%></td></tr><tr>
      <td width='11%' height=44>开始日期：</td><td width='39%'><%=m.get("kaishiriqi")%></td></tr><tr>
      <td width='11%' height=44>结束日期：</td><td width='39%'><%=m.get("jieshuriqi")%></td></tr><tr>
      <td width='11%' height=44>添加人：</td><td width='39%'><%=m.get("tianjiaren")%></td></tr><tr>
<td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



