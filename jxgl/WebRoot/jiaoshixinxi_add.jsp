<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>������Ϣ</title>
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
new CommDAO().insert(request,response,"jiaoshixinxi",ext,true,false,""); 
%>

  <body >
 <form  action="jiaoshixinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  ��ӽ�����Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">�������ţ�</td><td><input name='jiaoshigonghao' type='text' id='jiaoshigonghao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabeljiaoshigonghao' /></td></tr>
    <tr><td  width="200">���룺</td><td><input name='mima' type='text' id='mima' value='' onblur='' style='border:solid 1px #000000; color:#000000' /></td></tr>
    <tr><td  width="200">������</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#000000' /></td></tr>
    <tr><td  width="200">�Ա�</td><td><input name='xingbie' type='text' id='xingbie' value='' onblur='' style='border:solid 1px #000000; color:#000000' /></td></tr>
    <tr><td width="200">У����</td><td><%=Info.getselect("yuanxiao","yuanxiaoxinxi","yuanxiao")%></td></tr>
    <tr><td width="200">������</td><td><%=Info.getselect("zhuanye","zhuanyexinxi","zhuanye")%></td></tr>
    <tr><td width="200">�ֻ���</td><td><input name='shouji' type='text' id='shouji' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabelshouji' />�����ֻ���ʽ</td></tr>
    <tr><td width="200">��Ƭ��</td><td><input name='zhaopian' type='text' id='zhaopian' value='' size='50' style='border:solid 1px #000000; color:#000000'  />&nbsp;<input type='button' value='�ϴ�' onClick="up('zhaopian')" style='border:solid 1px #000000; color:#000000'/></td></tr>
    <tr><td  width="200">��ע��</td><td><textarea name='beizhu' cols='50' rows='8' id='beizhu' onblur='' style='border:solid 1px #000000; color:#000000'></textarea></td></tr>
		
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
 
	
    var jiaoshigonghaoobj = document.getElementById("jiaoshigonghao"); if(jiaoshigonghaoobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>�������ʦ����</font>";return false;}else{document.getElementById("clabeljiaoshigonghao").innerHTML="  "; }
    var jiaoshigonghaooobj = document.getElementById("shoujixinghao");
    if(jiaoshigonghaoobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=jiaoshixinxi&col=jiaoshigonghao&value="+jiaoshigonghaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabeljiaoshigonghao").innerHTML="&nbsp;&nbsp;<font color=red>��ʦ�����Ѵ���</font>";
    return false;
    }else{document.getElementById("clabeljiaoshigonghao").innerHTML="  ";
    }
    }

 	 var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value!=""){ if(/^1[3|4|5|8][0-9]\d{4,8}$/.test(shoujiobj.value)){document.getElementById("clabelshouji").innerHTML="  "; }else{document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>�����ֻ���ʽ</font>"; return false;}}
 
	
return true;  
}   
popheight=450;
</script>  



