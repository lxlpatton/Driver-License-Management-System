<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>难易程度</title>
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
new CommDAO().insert(request,response,"nanyichengdu",ext,true,false,""); 
%>

  <body >
 <form  action="nanyichengdu_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加难易程度:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">难易程度：</td><td><input name='nanyichengdu' type='text' id='nanyichengdu' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabelnanyichengdu' /></td></tr>
		
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
 
	
    var nanyichengduobj = document.getElementById("nanyichengdu"); if(nanyichengduobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入难易程度</font>";return false;}else{document.getElementById("clabelnanyichengdu").innerHTML="  "; }
    var nanyichengduoobj = document.getElementById("shoujixinghao");
    if(nanyichengduobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=nanyichengdu&col=nanyichengdu&value="+nanyichengduobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabelnanyichengdu").innerHTML="&nbsp;&nbsp;<font color=red>难易程度已存在</font>";
    return false;
    }else{document.getElementById("clabelnanyichengdu").innerHTML="  ";
    }
    }

 
	
return true;  
}   
popheight=450;
</script>  



