<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>������Ϣ</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<!--<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"��", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"��";
	}
}
</script>-->

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"jiaoshixinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"jiaoshixinxi"); 

%>
  <form  action="jiaoshixinxi_modf.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸Ľ�����Ϣ:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
    
    <tr><td>�������ţ�</td><td><input name='jiaoshigonghao' type='text' id='jiaoshigonghao' value='<%= mmm.get("jiaoshigonghao")%>' /></td></tr>
    <tr><td>���룺</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' /></td></tr>
    <tr><td>������</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' /></td></tr>
    <tr><td>�Ա�</td><td><input name='xingbie' type='text' id='xingbie' value='<%= mmm.get("xingbie")%>' /></td></tr>
    <tr><td>У����</td><td><%=Info.getselect("yuanxiao","yuanxiaoxinxi","yuanxiao")%></td></tr><script language="javascript">document.form1.yuanxiao.value='<%= mmm.get("yuanxiao")%>';</script>
    <tr><td>������</td><td><%=Info.getselect("zhuanye","zhuanyexinxi","zhuanye")%></td></tr><script language="javascript">document.form1.zhuanye.value='<%= mmm.get("zhuanye")%>';</script>
    <tr><td>�ֻ���</td><td><input name='shouji' type='text' id='shouji' value='<%= mmm.get("shouji")%>' /></td></tr>
    <tr><td>��Ƭ��</td><td><input name='zhaopian' type='text' id='zhaopian' value='<%= mmm.get("zhaopian")%>'  size='50' style='border:solid 1px #000000; color:#000000'  />&nbsp;<input type='button' value='�ϴ�' onClick="up('zhaopian')" style='border:solid 1px #000000; color:#000000'/></td></tr>
    <tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='8' id='beizhu'><%= mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>



