<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>��ѡ��</title>
	
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

new CommDAO().update(request,response,"danxuanti",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"danxuanti"); 

%>
  <form  action="danxuanti_modf.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸ĵ�ѡ��:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
    
    <tr><td>��ţ�</td><td><input name='bianhao' type='text' id='bianhao' value='<%= mmm.get("bianhao")%>' /></td></tr>
    <tr><td>���⣺</td><td><textarea name='shiti' cols='50' rows='8' id='shiti'><%= mmm.get("shiti")%></textarea></td></tr>
    <tr><td>��Ŀ���ƣ�</td><td><%=Info.getselect("kemumingcheng","kemuxinxi","kemumingcheng")%></td></tr><script language="javascript">document.form1.kemumingcheng.value='<%= mmm.get("kemumingcheng")%>';</script>
    <tr><td>֪ʶ�����ƣ�</td><td><%=Info.getselect("zhishidianmingcheng","zhishidianxinxi","zhishidianmingcheng")%></td></tr><script language="javascript">document.form1.zhishidianmingcheng.value='<%= mmm.get("zhishidianmingcheng")%>';</script>
    <tr><td>���׳̶ȣ�</td><td><%=Info.getselect("nanyichengdu","nanyichengdu","nanyichengdu")%></td></tr><script language="javascript">document.form1.nanyichengdu.value='<%= mmm.get("nanyichengdu")%>';</script>
    <tr><td>ѡ��A��</td><td><input name='xuanxiangA' type='text' id='xuanxiangA' size='50' value='<%= mmm.get("xuanxiangA")%>' /></td></tr>
    <tr><td>ѡ��B��</td><td><input name='xuanxiangB' type='text' id='xuanxiangB' size='50' value='<%= mmm.get("xuanxiangB")%>' /></td></tr>
    <tr><td>ѡ��C��</td><td><input name='xuanxiangC' type='text' id='xuanxiangC' size='50' value='<%= mmm.get("xuanxiangC")%>' /></td></tr>
    <tr><td>ѡ��D��</td><td><input name='xuanxiangD' type='text' id='xuanxiangD' size='50' value='<%= mmm.get("xuanxiangD")%>' /></td></tr>
    <tr><td>�𰸣�</td><td><select name='daan' id='daan'><option value="A">A</option><option value="B">B</option><option value="C">C</option><option value="D">D</option></select></td></tr><script language="javascript">document.form1.daan.value='<%= mmm.get("daan")%>';</script>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>



