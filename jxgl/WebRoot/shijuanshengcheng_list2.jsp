<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>试卷生成</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有试卷生成列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:   试卷编号：<input name="shijuanbianhao" type="text" id="shijuanbianhao" style='border:solid 1px #000000; color:#666666;width:80px' /> 科目名称：<%=Info.getselect("kemumingcheng","kemuxinxi","kemumingcheng"," 1=1 ")%></select>  知识点名称：<%=Info.getselect("zhishidianmingcheng","zhishidianxinxi","zhishidianmingcheng"," 1=1 ")%></select>  难易程度：<%=Info.getselect("nanyichengdu","nanyichengdu","nanyichengdu"," 1=1 ")%></select>  添加人：<input name="tianjiaren" type="text" id="tianjiaren" style='border:solid 1px #000000; color:#666666;width:80px' />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='shijuanshengcheng_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">序号</td>
	
    <td bgcolor='#A4B6D7'>试卷编号</td>
    <td bgcolor='#A4B6D7'>科目名称</td>
    <td bgcolor='#A4B6D7'>题型</td>
    <td bgcolor='#A4B6D7'>难易程度</td>
    <td bgcolor='#A4B6D7'>选择题数</td>
    <td bgcolor='#A4B6D7'>选择题分值</td>
    <td bgcolor='#A4B6D7'>判断题数</td>
    <td bgcolor='#A4B6D7'>判断题分值</td>
    <td bgcolor='#A4B6D7'>填空题数</td>
    <td bgcolor='#A4B6D7'>填空题分值</td>
    <td bgcolor='#A4B6D7'>简答题数</td>
    <td bgcolor='#A4B6D7'>开始日期</td>
    <td bgcolor='#A4B6D7'>结束日期</td>
    <td bgcolor='#A4B6D7'>添加人</td>
    
    <td width="138" align="center" bgcolor="#A4B6D7">添加时间</td>
    <td width="60" align="center" bgcolor="#A4B6D7">操作</td>
  </tr>
  <% 
  	  
  	 new CommDAO().delete(request,"shijuanshengcheng"); 
    String url = "shijuanshengcheng_list2.jsp?1=1"; 
	
 	String sql ="select * from shijuanshengcheng where tianjiaren='"+request.getSession().getAttribute("username")+"'";
	
    if(request.getParameter("shijuanbianhao")=="" ||request.getParameter("shijuanbianhao")==null ){}else{sql=sql+" and shijuanbianhao like '%"+request.getParameter("shijuanbianhao")+"%'";}
    if(request.getParameter("kemumingcheng")=="" ||request.getParameter("kemumingcheng")==null ){}else{sql=sql+" and kemumingcheng like '%"+request.getParameter("kemumingcheng")+"%'";}
    if(request.getParameter("zhishidianmingcheng")=="" ||request.getParameter("zhishidianmingcheng")==null ){}else{sql=sql+" and zhishidianmingcheng like '%"+request.getParameter("zhishidianmingcheng")+"%'";}
    if(request.getParameter("nanyichengdu")=="" ||request.getParameter("nanyichengdu")==null ){}else{sql=sql+" and nanyichengdu like '%"+request.getParameter("nanyichengdu")+"%'";}
    if(request.getParameter("tianjiaren")=="" ||request.getParameter("tianjiaren")==null ){}else{sql=sql+" and tianjiaren like '%"+request.getParameter("tianjiaren")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	
	
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("shijuanbianhao") %></td>
    <td><%=map.get("kemumingcheng") %></td>
    <td><%=map.get("zhishidianmingcheng") %></td>
    <td><%=map.get("nanyichengdu") %></td>
    <td><%=map.get("xuanzetishu") %></td>
    <td><%=map.get("xuanzetifenzhi") %></td>
    <td><%=map.get("panduantishu") %></td>
    <td><%=map.get("panduantifenzhi") %></td>
    <td><%=map.get("tiankongtishu") %></td>
    <td><%=map.get("tiankongtifenzhi") %></td>
    <td><%=map.get("bianchengtishu") %></td>
    <td><%=map.get("kaishiriqi") %></td>
    <td><%=map.get("jieshuriqi") %></td>
    <td><%=map.get("tianjiaren") %></td>
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="shijuanshengcheng_modf.jsp?id=<%=map.get("id")%>">修改</a>  <a href="shijuanshengcheng_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="shijuanshengcheng_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }

  </body>
</html>


