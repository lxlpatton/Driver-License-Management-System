<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>单选题</title>
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


}
new CommDAO().insert(request,response,"danxuanti",ext,true,false,""); 
%>

  <body >
 <form  action="danxuanti_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加单选题:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">编号：</td><td><input name='bianhao' type='text' id='bianhao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabelbianhao' /></td></tr>
    <tr><td  width="200">试题：</td><td><textarea name='shiti' cols='50' rows='8' id='shiti' onblur='' style='border:solid 1px #000000; color:#000000'></textarea></td></tr>
    <tr><td width="200">科目名称：</td><td><%=Info.getselect("kemumingcheng","kemuxinxi","kemumingcheng")%></td></tr>
    <tr><td width="200">知识点名称：</td><td><%=Info.getselect("zhishidianmingcheng","zhishidianxinxi","zhishidianmingcheng")%></td></tr>
    <tr><td width="200">难易程度：</td><td><%=Info.getselect("nanyichengdu","nanyichengdu","nanyichengdu")%></td></tr>
    <tr><td width="200">选项A：</td><td><input name='xuanxiangA' type='text' id='xuanxiangA' value='' onblur='' size='50' style='border:solid 1px #000000; color:#000000' />&nbsp;</td></tr>
    <tr><td width="200">选项B：</td><td><input name='xuanxiangB' type='text' id='xuanxiangB' value='' onblur='' size='50' style='border:solid 1px #000000; color:#000000' />&nbsp;</td></tr>
    <tr><td width="200">选项C：</td><td><input name='xuanxiangC' type='text' id='xuanxiangC' value='' onblur='' size='50' style='border:solid 1px #000000; color:#000000' />&nbsp;</td></tr>
    <tr><td width="200">选项D：</td><td><input name='xuanxiangD' type='text' id='xuanxiangD' value='' onblur='' size='50' style='border:solid 1px #000000; color:#000000' />&nbsp;</td></tr>
    <tr>
    <td>答案：</td>
    <td><select name='daan' id='daan'>
        <option value="A">A</option>
        <option value="B">B</option>
        <option value="C">C</option>
        <option value="D">D</option>
    </select></td>
    </tr>
		
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
 
	
    var bianhaoobj = document.getElementById("bianhao"); if(bianhaoobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入编号</font>";return false;}else{document.getElementById("clabelbianhao").innerHTML="  "; }
    var bianhaooobj = document.getElementById("shoujixinghao");
    if(bianhaoobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=danxuanti&col=bianhao&value="+bianhaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabelbianhao").innerHTML="&nbsp;&nbsp;<font color=red>编号已存在</font>";
    return false;
    }else{document.getElementById("clabelbianhao").innerHTML="  ";
    }
    }

 
	
return true;  
}   
popheight=450;
</script>  



