<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��ѡ��</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>���е�ѡ���б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:   ��ţ�<input name="bianhao" type="text" id="bianhao" style='border:solid 1px #000000; color:#666666;width:80px' /> ��Ŀ���ƣ�<%=Info.getselect("kemumingcheng","kemuxinxi","kemumingcheng"," 1=1 ")%></select>  ֪ʶ�����ƣ�<%=Info.getselect("zhishidianmingcheng","zhishidianxinxi","zhishidianmingcheng"," 1=1 ")%></select>  ���׳̶ȣ�<%=Info.getselect("nanyichengdu","nanyichengdu","nanyichengdu"," 1=1 ")%></select> 
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='danxuanti_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="#A4B6D7">���</td>
	
    <td bgcolor='#A4B6D7'>���</td>
    <td bgcolor='#A4B6D7'>��Ŀ����</td>
    <td bgcolor='#A4B6D7'>֪ʶ������</td>
    <td bgcolor='#A4B6D7'>���׳̶�</td>
    <td bgcolor='#A4B6D7'>ѡ��A</td>
    <td bgcolor='#A4B6D7'>ѡ��B</td>
    <td bgcolor='#A4B6D7'>ѡ��C</td>
    <td bgcolor='#A4B6D7'>ѡ��D</td>
    <td bgcolor='#A4B6D7'>��</td>
    
    
    <td width="138" align="center" bgcolor="#A4B6D7">���ʱ��</td>
    <td width="60" align="center" bgcolor="#A4B6D7">����</td>
  </tr>
  <% 
  	  
  	 new CommDAO().delete(request,"danxuanti"); 
    String url = "danxuanti_list.jsp?1=1"; 
	String sql ="select * from danxuanti where 1=1";
	
    if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}else{sql=sql+" and bianhao like '%"+request.getParameter("bianhao")+"%'";}
    if(request.getParameter("kemumingcheng")=="" ||request.getParameter("kemumingcheng")==null ){}else{sql=sql+" and kemumingcheng like '%"+request.getParameter("kemumingcheng")+"%'";}
    if(request.getParameter("zhishidianmingcheng")=="" ||request.getParameter("zhishidianmingcheng")==null ){}else{sql=sql+" and zhishidianmingcheng like '%"+request.getParameter("zhishidianmingcheng")+"%'";}
    if(request.getParameter("nanyichengdu")=="" ||request.getParameter("nanyichengdu")==null ){}else{sql=sql+" and nanyichengdu like '%"+request.getParameter("nanyichengdu")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	
	
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
	
    <td><%=map.get("bianhao") %></td>
    <td><%=map.get("kemumingcheng") %></td>
    <td><%=map.get("zhishidianmingcheng") %></td>
    <td><%=map.get("nanyichengdu") %></td>
    <td><%=map.get("xuanxiangA") %></td>
    <td><%=map.get("xuanxiangB") %></td>
    <td><%=map.get("xuanxiangC") %></td>
    <td><%=map.get("xuanxiangD") %></td>
    <td><%=map.get("daan") %></td>
    
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="danxuanti_modf.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="danxuanti_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="danxuanti_detail.jsp?id=<%=map.get("id")%>">��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }

  </body>
</html>


