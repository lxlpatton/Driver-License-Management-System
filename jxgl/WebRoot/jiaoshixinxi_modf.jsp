<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>教练信息</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<!--<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
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
  修改教练信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
    
    <tr><td>教练工号：</td><td><input name='jiaoshigonghao' type='text' id='jiaoshigonghao' value='<%= mmm.get("jiaoshigonghao")%>' /></td></tr>
    <tr><td>密码：</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' /></td></tr>
    <tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' /></td></tr>
    <tr><td>性别：</td><td><input name='xingbie' type='text' id='xingbie' value='<%= mmm.get("xingbie")%>' /></td></tr>
    <tr><td>校区：</td><td><%=Info.getselect("yuanxiao","yuanxiaoxinxi","yuanxiao")%></td></tr><script language="javascript">document.form1.yuanxiao.value='<%= mmm.get("yuanxiao")%>';</script>
    <tr><td>车辆：</td><td><%=Info.getselect("zhuanye","zhuanyexinxi","zhuanye")%></td></tr><script language="javascript">document.form1.zhuanye.value='<%= mmm.get("zhuanye")%>';</script>
    <tr><td>手机：</td><td><input name='shouji' type='text' id='shouji' value='<%= mmm.get("shouji")%>' /></td></tr>
    <tr><td>照片：</td><td><input name='zhaopian' type='text' id='zhaopian' value='<%= mmm.get("zhaopian")%>'  size='50' style='border:solid 1px #000000; color:#000000'  />&nbsp;<input type='button' value='上传' onClick="up('zhaopian')" style='border:solid 1px #000000; color:#000000'/></td></tr>
    <tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='8' id='beizhu'><%= mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>



