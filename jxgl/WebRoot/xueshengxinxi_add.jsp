<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>学员信息</title>
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
new CommDAO().insert(request,response,"xueshengxinxi",ext,true,false,""); 
%>

  <body >
 <form  action="xueshengxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加学员信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">
	
    <tr><td width="200">学员学号：</td><td><input name='xueshengxuehao' type='text' id='xueshengxuehao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;*<label id='clabelxueshengxuehao' /></td></tr>
    <tr><td  width="200">密码：</td><td><input name='mima' type='text' id='mima' value='' onblur='' style='border:solid 1px #000000; color:#000000' /></td></tr>
    <tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' style='border:solid 1px #000000; color:#000000' /></td></tr>
    <tr><td  width="200">性别：</td><td><input name='xingbie' type='text' id='xingbie' value='' onblur='' style='border:solid 1px #000000; color:#000000' /></td></tr>
    <tr><td width="200">校区：</td><td><%=Info.getselect("yuanxiao","yuanxiaoxinxi","yuanxiao")%></td></tr>
    <tr><td width="200">车辆：</td><td><%=Info.getselect("zhuanye","zhuanyexinxi","zhuanye")%></td></tr>
    <tr><td width="200">手机：</td><td><input name='shouji' type='text' id='shouji' value='' onblur='checkform()' style='border:solid 1px #000000; color:#000000' />&nbsp;<label id='clabelshouji' />必需手机格式</td></tr>
    <tr><td width="200">照片：</td><td><input name='zhaopian' type='text' id='zhaopian' value='' size='50' style='border:solid 1px #000000; color:#000000'  />&nbsp;<input type='button' value='上传' onClick="up('zhaopian')" style='border:solid 1px #000000; color:#000000'/></td></tr>
    <tr><td  width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='8' id='beizhu' onblur='' style='border:solid 1px #000000; color:#000000'></textarea></td></tr>
		
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
 
	
    var xueshengxuehaoobj = document.getElementById("xueshengxuehao"); if(xueshengxuehaoobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入学生学号</font>";return false;}else{document.getElementById("clabelxueshengxuehao").innerHTML="  "; }
    var xueshengxuehaooobj = document.getElementById("shoujixinghao");
    if(xueshengxuehaoobj.value!=""){
    var ajax = new AJAX();
    ajax.post("factory/checkno.jsp?table=xueshengxinxi&col=xueshengxuehao&value="+xueshengxuehaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
    var msg = ajax.getValue();
    if(msg.indexOf('Y')>-1){
    document.getElementById("clabelxueshengxuehao").innerHTML="&nbsp;&nbsp;<font color=red>学生学号已存在</font>";
    return false;
    }else{document.getElementById("clabelxueshengxuehao").innerHTML="  ";
    }
    }

 	 var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value!=""){ if(/^1[3|4|5|8][0-9]\d{4,8}$/.test(shoujiobj.value)){document.getElementById("clabelshouji").innerHTML="  "; }else{document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>必需手机格式</font>"; return false;}}
 
	
return true;  
}   
popheight=450;
</script>  



