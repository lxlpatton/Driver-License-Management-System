<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
  <head>
    
    <title>通知公告</title>
	<LINK href="css.css" type=text/css rel=stylesheet>

  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  <script language="javascript">
  function checkall()
  {
  	if(document.form2.plxz.checked==true)
	{
		var code_Values = document.all['pldel']; 
		if(code_Values.length){ 
		for(var i=0;i<code_Values.length;i++) 
		{ 
		code_Values[i].checked = true; 
		} 
		}else{ 
		code_Values.checked = true; 
		} 
	}
	else
	{
		var code_Values = document.all['pldel']; 
		if(code_Values.length){ 
		for(var i=0;i<code_Values.length;i++) 
		{ 
		code_Values[i].checked = false; 
		} 
		}else{ 
		code_Values.checked = false; 
		} 
	}
  }
  </script>
 <%
 new CommDAO().delete(request,"newsproclaim"); 

 %>
  <body >
  <p>已有通知公告列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索: 标题：<input name="biaoti" type="text" id="biaoti" />
   类别
   <select name="leibie" id="leibie">
     <option value="">所有</option>
        <option value="通知公告">通知公告</option>
   </select> 
   添加人：
   <input name="tianjiaren" type="text" id="tianjiaren" />
   <input type="submit" name="Submit" value="查找" />
  </form>

  <form name="form2" method="post" action="delall.jsp">
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="ADCEEF" style="border-collapse:collapse">
      <tr>
        <td width="30" align="center" bgcolor="A4B6D7">序号</td>
        <td bgcolor='#A4B6D7'>标题</td>
        <td bgcolor='#A4B6D7'>类别</td>
        <td bgcolor='#A4B6D7'>添加人</td>
        <td bgcolor='#A4B6D7'>点击率</td>
        <td width="138" align="center" bgcolor="A4B6D7">添加时间</td>
        <td width="60" align="center" bgcolor="A4B6D7">操作</td>
      </tr>
    <% 
	new CommDAO().delete(request,"newsproclaim"); 
    String url = "newsproclaim_list.jsp?1=1"; 
    String sql =  "select * from newsproclaim where 1=1 ";
	
	if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql + " and biaoti like '%"+request.getParameter("biaoti").trim()+"%' ";}
	if(request.getParameter("tianjiaren")=="" ||request.getParameter("tianjiaren")==null ){}else{sql=sql+ " and tianjiaren like '%"+request.getParameter("tianjiaren").trim()+"%' ";}
	if(request.getParameter("leibie")=="" ||request.getParameter("leibie")==null ){}else{sql=sql+ " and leibie like '%"+request.getParameter("leibie").trim()+"%' ";}
    sql+=" order by id desc";
	//out.print(sql);
	ArrayList<HashMap> list = PageManager.getPages(url,10,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
      <tr>
        <td width="30" align="center"><%=i %></td>
        <td><a href="newsdetail.jsp?id=<%=map.get("id") %>"><%=map.get("biaoti") %></a></td>
        <td><%=map.get("leibie") %></td>
        <td><%=map.get("tianjiaren") %></td>
        <td><%=map.get("dianjilv") %></td>
        <td width="138" align="center"><%=map.get("addtime") %></td>
        <td width="60" align="center"><a href="newsdetail.jsp?id=<%=map.get("id")%>">详细</a></td>
      </tr>
       <%} %>
    </table>
    
  <br>
  ${page.info } 
  <input type="button" name="Submit32" value="打印本页" onClick="javascript:window.print();" style='border:solid 1px #000000; color:#666666'>
  </form>   </body>
</html>



