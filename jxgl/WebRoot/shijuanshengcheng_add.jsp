<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>试卷生成</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script> 
    
  </head>
<%
  String id="";
  
  
   %>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
int nxuanzetishu = Integer.parseInt(request.getParameter("xuanzetishu"));
	int npanduantishu = Integer.parseInt(request.getParameter("panduantishu"));
	int ntiankongtishu = Integer.parseInt(request.getParameter("tiankongtishu"));
	int nbianchengtishu = Integer.parseInt(request.getParameter("bianchengtishu"));

	
String shijuanbianhao=request.getParameter("shijuanbianhao");String kemumingcheng=request.getParameter("kemumingcheng");String zhishidianmingcheng=request.getParameter("zhishidianmingcheng");String nanyichengdu=request.getParameter("nanyichengdu");String danxuanti=request.getParameter("danxuanti");String panduanti=request.getParameter("panduanti");String tiankongti=request.getParameter("tiankongti");String bianchengti=request.getParameter("bianchengti");String tianjiaren=request.getParameter("tianjiaren");
String sql3=  "select * from danxuanti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' ";
CommDAO dao = new CommDAO();
  List<HashMap> userlist1 = dao.select(sql3);

  if(userlist1.size()<nxuanzetishu)
{
	out.print("<script>alert('对不起,单选题数不足!');history.back();</script>");
	return;
}
String sql4=  "select * from panduanti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' ";
CommDAO dao2 = new CommDAO();
  List<HashMap> userlist2 = dao2.select(sql4);

  if(userlist2.size()<npanduantishu)
{
	out.print("<script>alert('对不起,判断题数不足!');history.back();</script>");
	return;
}
String sql5=  "select * from tiankongti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' ";
CommDAO dao3 = new CommDAO();
  List<HashMap> userlist3 = dao3.select(sql5);

  if(userlist3.size()<ntiankongtishu)
{
	out.print("<script>alert('对不起,填空题数不足!');history.back();</script>");
	return;
}
String sql7=  "select * from bianchengti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' ";
CommDAO dao7 = new CommDAO();
  List<HashMap> userlist7 = dao7.select(sql7);

  if(userlist7.size()<nbianchengtishu)
{
	out.print("<script>alert('对不起,简答题数不足!');history.back();</script>");
	return;
}
for(HashMap map:new CommDAO().select("select id from danxuanti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' order by rand() limit " + nxuanzetishu + " ")){
id=id+map.get("id")+",";
}
id=id.substring(0,id.length()-1);
		 String id2="";
 for(HashMap map:new CommDAO().select("select  id from tiankongti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' order by rand() limit " + ntiankongtishu + " ")){

	id2=id2+map.get("id")+",";
}
id2=id2.substring(0,id2.length()-1);
	 String id5="";
 for(HashMap map:new CommDAO().select("select  id from panduanti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' order by rand() limit " + npanduantishu + " ")){

	id5=id5+map.get("id")+",";
}
id5=id5.substring(0,id5.length()-1);

	 String id6="";
 for(HashMap map:new CommDAO().select("select  id from bianchengti where kemumingcheng='"+kemumingcheng+"' and zhishidianmingcheng='"+zhishidianmingcheng+"'  and nanyichengdu='"+nanyichengdu+"' order by rand() limit " + nbianchengtishu + " ")){

	id6=id6+map.get("id")+",";
}
id6=id6.substring(0,id6.length()-1);
ext.put("danxuanti",id);
ext.put("tiankongti",id2);
ext.put("panduanti",id5);
ext.put("bianchengti",id6);


}
new CommDAO().insert(request,response,"shijuanshengcheng",ext,true,false,""); 
%>

  <body >
 <form  action="shijuanshengcheng_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加试卷生成:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">试卷编号：</td><td><input name='shijuanbianhao' type='text' id='shijuanbianhao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabelshijuanbianhao' /></td></tr>
    <tr><td width="200">科目名称：</td><td><%=Info.getselect("kemumingcheng","kemuxinxi","kemumingcheng")%></td></tr>
    <tr><td width="200">题型：</td><td><%=Info.getselect("zhishidianmingcheng","zhishidianxinxi","zhishidianmingcheng")%></td></tr>
    <tr><td width="200">难易程度：</td><td><%=Info.getselect("nanyichengdu","nanyichengdu","nanyichengdu")%></td></tr>
    <tr><td width="200">选择题数：</td><td><input name='xuanzetishu' type='text' id='xuanzetishu' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabelxuanzetishu' />必需数字型</td></tr>
    <tr><td width="200">选择题分值：</td><td><input name='xuanzetifenzhi' type='text' id='xuanzetifenzhi' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabelxuanzetifenzhi' />必需数字型</td></tr>
    <tr><td width="200">判断题数：</td><td><input name='panduantishu' type='text' id='panduantishu' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabelpanduantishu' />必需数字型</td></tr>
    <tr><td width="200">判断题分值：</td><td><input name='panduantifenzhi' type='text' id='panduantifenzhi' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabelpanduantifenzhi' />必需数字型</td></tr>
    <tr><td width="200">填空题数：</td><td><input name='tiankongtishu' type='text' id='tiankongtishu' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabeltiankongtishu' />必需数字型</td></tr>
    <tr><td width="200">填空题分值：</td><td><input name='tiankongtifenzhi' type='text' id='tiankongtifenzhi' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabeltiankongtifenzhi' />必需数字型</td></tr>
    <tr><td width="200">简答题数：</td><td><input name='bianchengtishu' type='text' id='bianchengtishu' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabelbianchengtishu' />必需数字型</td></tr>
    <tr><td width="200">开始日期：</td><td><input name='kaishiriqi' type='text' id='kaishiriqi' value='' onblur='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='border:solid 1px #000000; color:#000000;  width:90px;' /></td></tr>
    <tr><td width="200">结束日期：</td><td><input name='jieshuriqi' type='text' id='jieshuriqi' value='' onblur='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='border:solid 1px #000000; color:#000000;  width:90px;' /></td></tr>
    <tr><td width="200">添加人：</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" style='border:solid 1px #000000; color:#000000' />&nbsp;</td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>


<script language=javascript src='js/ajax.js'></script>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<script language=javascript >  
 
 function checkform(){  
 
	
    var shijuanbianhaoobj = document.getElementById("shijuanbianhao"); if(shijuanbianhaoobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入试卷编号</font>";return false;}else{document.getElementById("clabelshijuanbianhao").innerHTML="  "; }
    var shijuanbianhaooobj = document.getElementById("shoujixinghao");
    if(shijuanbianhaoobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=shijuanshengcheng&col=shijuanbianhao&value="+shijuanbianhaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabelshijuanbianhao").innerHTML="&nbsp;&nbsp;<font color=red>试卷编号已存在</font>";
    return false;
    }else{document.getElementById("clabelshijuanbianhao").innerHTML="  ";
    }
    }

 	 var xuanzetishuobj = document.getElementById("xuanzetishu"); if(xuanzetishuobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(xuanzetishuobj.value)){document.getElementById("clabelxuanzetishu").innerHTML="  "; }else{document.getElementById("clabelxuanzetishu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}
 	 var xuanzetifenzhiobj = document.getElementById("xuanzetifenzhi"); if(xuanzetifenzhiobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(xuanzetifenzhiobj.value)){document.getElementById("clabelxuanzetifenzhi").innerHTML="  "; }else{document.getElementById("clabelxuanzetifenzhi").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}
 	 var panduantishuobj = document.getElementById("panduantishu"); if(panduantishuobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(panduantishuobj.value)){document.getElementById("clabelpanduantishu").innerHTML="  "; }else{document.getElementById("clabelpanduantishu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}
 	 var panduantifenzhiobj = document.getElementById("panduantifenzhi"); if(panduantifenzhiobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(panduantifenzhiobj.value)){document.getElementById("clabelpanduantifenzhi").innerHTML="  "; }else{document.getElementById("clabelpanduantifenzhi").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}
 	 var tiankongtishuobj = document.getElementById("tiankongtishu"); if(tiankongtishuobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(tiankongtishuobj.value)){document.getElementById("clabeltiankongtishu").innerHTML="  "; }else{document.getElementById("clabeltiankongtishu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}
 	 var tiankongtifenzhiobj = document.getElementById("tiankongtifenzhi"); if(tiankongtifenzhiobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(tiankongtifenzhiobj.value)){document.getElementById("clabeltiankongtifenzhi").innerHTML="  "; }else{document.getElementById("clabeltiankongtifenzhi").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}
 	 var bianchengtishuobj = document.getElementById("bianchengtishu"); if(bianchengtishuobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(bianchengtishuobj.value)){document.getElementById("clabelbianchengtishu").innerHTML="  "; }else{document.getElementById("clabelbianchengtishu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}
 
	
return true;  
}   
popheight=450;
</script>  



