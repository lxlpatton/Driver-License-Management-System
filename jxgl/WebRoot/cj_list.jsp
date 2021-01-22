<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    
    <title>成绩查看</title>
    <LINK href="css.css" type=text/css 
rel=stylesheet>

  </head>

<body >
  <p>成绩列表：</p>


<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="6%" bgcolor="A4B6D7">序号</td>
    <td width="14%" bgcolor='#A4B6D7'>用户名</td>
    <td width="15%" bgcolor='#A4B6D7'>试卷编号</td>
    <td width="17%" bgcolor='#A4B6D7'>成绩</td>
    <td width="17%" bgcolor='#A4B6D7'>客观题成绩</td>
    <td width="14%" bgcolor="A4B6D7">主观题成绩</td>
    <td width="15%" bgcolor="A4B6D7">测试时间</td>
    
    <td width="19%" bgcolor="A4B6D7">操作</td>
  </tr>
  <%
  double chengji=0;
  double chengjiz=0;
double zgfchengji=0;double zdfchengji=10000;
int yxrs=0;
int lrs=0;
int bjgrs=0;
 new CommDAO().delete(request,"cj"); 
    String url = "cj_list.jsp?1=1"; 
    String sql =  "select * from cj where  1=1";
 ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	chengji=Float.valueOf((String)map.get("cj")).floatValue()+Float.valueOf((String)map.get("zcj")).floatValue();
	chengjiz=chengjiz+chengji;
	if(chengji>zgfchengji){zgfchengji=chengji;}
if(chengji<zdfchengji){zdfchengji=chengji;}
if(chengji<zdfchengji){zdfchengji=chengji;}
if(chengji>=85){yxrs=yxrs+1;}
if(chengji<85 && chengji>=60){lrs=lrs+1;}  //必须写两条，不然报错
if(chengji<60){bjgrs=bjgrs+1;}

    
 
%>
  <tr>
    <td><%=i %></td>
    <td><%=map.get("username") %></td><td><%=map.get("sjbh") %></td>
    <td><%=chengji %></td>
    <td><%=map.get("cj") %></td>
    <td><%=map.get("zcj") %></td>
    <td><%=map.get("addtime") %></td>
    <td>  <a href="cj_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共&nbsp<%=i %>&nbsp条,<a style="cursor:hand" onClick="javascript:window.print();"></a>  共计成绩:<%=chengjiz%>； 其中最高成绩：<%=zgfchengji %>；最低成绩：<%=zdfchengji %>；85分及以上人数：<%=yxrs %>；60-85分人数：<%=lrs %>；低于60分人数：<%=bjgrs %>；平均成绩：<%out.print(Math.round(1000*(chengjiz/i))/1000.0);%>；
</br>
</body>
</html>

