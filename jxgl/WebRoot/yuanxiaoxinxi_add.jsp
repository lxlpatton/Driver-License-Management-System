<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>校区信息</title>
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
new CommDAO().insert(request,response,"yuanxiaoxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="yuanxiaoxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加校区信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">校区：</td><td><input name='yuanxiao' type='text' id='yuanxiao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabelyuanxiao' /></td></tr>
    <tr><td  width="200">校区简介：</td><td><textarea name='yuanxiaojianjie' cols='50' rows='8' id='yuanxiaojianjie' onblur='' style='border:solid 1px #000000; color:#000000'></textarea></td></tr>
		
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
 
	
    var yuanxiaoobj = document.getElementById("yuanxiao"); if(yuanxiaoobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入院校</font>";return false;}else{document.getElementById("clabelyuanxiao").innerHTML="  "; }
    var yuanxiaooobj = document.getElementById("shoujixinghao");
    if(yuanxiaoobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=yuanxiaoxinxi&col=yuanxiao&value="+yuanxiaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabelyuanxiao").innerHTML="&nbsp;&nbsp;<font color=red>院校已存在</font>";
    return false;
    }else{document.getElementById("clabelyuanxiao").innerHTML="  ";
    }
    }

 
	
return true;  
}   
popheight=450;
</script>  



