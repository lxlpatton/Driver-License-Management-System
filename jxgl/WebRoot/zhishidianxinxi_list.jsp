<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>֪ʶ����Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>����������Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:   �������ƣ�<input name="zhishidianmingcheng" type="text" id="zhishidianmingcheng" style='border:solid 1px #000000; color:#666666;width:80px' />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='zhishidianxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">���</td>
	
    <td bgcolor='#A4B6D7'>��������</td>
    
    
    <td width="138" align="center" bgcolor="#A4B6D7">���ʱ��</td>
    <td width="60" align="center" bgcolor="#A4B6D7">����</td>
  </tr>
  <% 
  	  
  	 new CommDAO().delete(request,"zhishidianxinxi"); 
    String url = "zhishidianxinxi_list.jsp?1=1"; 
	String sql ="select * from zhishidianxinxi where 1=1";
	
    if(request.getParameter("zhishidianmingcheng")=="" ||request.getParameter("zhishidianmingcheng")==null ){}else{sql=sql+" and zhishidianmingcheng like '%"+request.getParameter("zhishidianmingcheng")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	
	
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("zhishidianmingcheng") %></td>
    
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="zhishidianxinxi_modf.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="zhishidianxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="zhishidianxinxi_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }

  </body>
</html>


