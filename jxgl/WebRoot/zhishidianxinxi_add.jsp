<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>����</title>
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
new CommDAO().insert(request,response,"zhishidianxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="zhishidianxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ���������Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">�������ƣ�</td><td><input name='zhishidianmingcheng' type='text' id='zhishidianmingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabelzhishidianmingcheng' /></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
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
 
	
    var zhishidianmingchengobj = document.getElementById("zhishidianmingcheng"); if(zhishidianmingchengobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>������֪ʶ������</font>";return false;}else{document.getElementById("clabelzhishidianmingcheng").innerHTML="  "; }
    var zhishidianmingchengoobj = document.getElementById("shoujixinghao");
    if(zhishidianmingchengobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=zhishidianxinxi&col=zhishidianmingcheng&value="+zhishidianmingchengobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabelzhishidianmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>֪ʶ�������Ѵ���</font>";
    return false;
    }else{document.getElementById("clabelzhishidianmingcheng").innerHTML="  ";
    }
    }

 
	
return true;  
}   
popheight=450;
</script>  



