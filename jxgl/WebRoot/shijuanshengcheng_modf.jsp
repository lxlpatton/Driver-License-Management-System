<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�Ծ�����</title>
	
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

new CommDAO().update(request,response,"shijuanshengcheng",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"shijuanshengcheng"); 

%>
  <form  action="shijuanshengcheng_modf.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸��Ծ�����:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
    
    <tr><td>�Ծ��ţ�</td><td><input name='shijuanbianhao' type='text' id='shijuanbianhao' value='<%= mmm.get("shijuanbianhao")%>' /></td></tr>
    <tr><td>��Ŀ���ƣ�</td><td><%=Info.getselect("kemumingcheng","kemuxinxi","kemumingcheng")%></td></tr><script language="javascript">document.form1.kemumingcheng.value='<%= mmm.get("kemumingcheng")%>';</script>
    <tr><td>���ͣ�</td><td><%=Info.getselect("zhishidianmingcheng","zhishidianxinxi","zhishidianmingcheng")%></td></tr><script language="javascript">document.form1.zhishidianmingcheng.value='<%= mmm.get("zhishidianmingcheng")%>';</script>
    <tr><td>���׳̶ȣ�</td><td><%=Info.getselect("nanyichengdu","nanyichengdu","nanyichengdu")%></td></tr><script language="javascript">document.form1.nanyichengdu.value='<%= mmm.get("nanyichengdu")%>';</script>
    <tr><td>ѡ��������</td><td><input name='xuanzetishu' type='text' id='xuanzetishu' value='<%= mmm.get("xuanzetishu")%>' /></td></tr>
    <tr><td>ѡ�����ֵ��</td><td><input name='xuanzetifenzhi' type='text' id='xuanzetifenzhi' value='<%= mmm.get("xuanzetifenzhi")%>' /></td></tr>
    <tr><td>�ж�������</td><td><input name='panduantishu' type='text' id='panduantishu' value='<%= mmm.get("panduantishu")%>' /></td></tr>
    <tr><td>�ж����ֵ��</td><td><input name='panduantifenzhi' type='text' id='panduantifenzhi' value='<%= mmm.get("panduantifenzhi")%>' /></td></tr>
    <tr><td>���������</td><td><input name='tiankongtishu' type='text' id='tiankongtishu' value='<%= mmm.get("tiankongtishu")%>' /></td></tr>
    <tr><td>������ֵ��</td><td><input name='tiankongtifenzhi' type='text' id='tiankongtifenzhi' value='<%= mmm.get("tiankongtifenzhi")%>' /></td></tr>
    <tr><td>���������</td><td><input name='bianchengtishu' type='text' id='bianchengtishu' value='<%= mmm.get("bianchengtishu")%>' /></td></tr>
    <tr><td>��ʼ���ڣ�</td><td><input name='kaishiriqi' type='text' id='kaishiriqi' value='<%= mmm.get("kaishiriqi")%>' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='border:solid 1px #000000; color:#000000;  width:90px;' /></td></tr>
    <tr><td>�������ڣ�</td><td><input name='jieshuriqi' type='text' id='jieshuriqi' value='<%= mmm.get("jieshuriqi")%>' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='border:solid 1px #000000; color:#000000;  width:90px;' /></td></tr>
    <tr><td>����ˣ�</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%= mmm.get("tianjiaren")%>' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>



