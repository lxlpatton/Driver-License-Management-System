<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>科目信息</title>
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
new CommDAO().insert(request,response,"kemuxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="kemuxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加科目信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">科目名称：</td><td><input name='kemumingcheng' type='text' id='kemumingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabelkemumingcheng' /></td></tr>
		
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
 
	
    var kemumingchengobj = document.getElementById("kemumingcheng"); if(kemumingchengobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入科目名称</font>";return false;}else{document.getElementById("clabelkemumingcheng").innerHTML="  "; }
    var kemumingchengoobj = document.getElementById("shoujixinghao");
    if(kemumingchengobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=kemuxinxi&col=kemumingcheng&value="+kemumingchengobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabelkemumingcheng").innerHTML="&nbsp;&nbsp;<font color=red>科目名称已存在</font>";
    return false;
    }else{document.getElementById("clabelkemumingcheng").innerHTML="  ";
    }
    }

 
	
return true;  
}   
popheight=450;
</script>  



