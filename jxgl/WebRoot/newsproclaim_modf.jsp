<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>֪ͨ����</title>
	<script type="text/javascript" src="js/popup.js"></script>
	<link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="g2312" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="g2312" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script charset="g2312" src="kindeditor_a5/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="neirong"]', {
				cssPath : 'kindeditor_a5/plugins/code/prettify.css',
				uploadJson : 'kindeditor_a5/jsp/upload_json.jsp',
				fileManagerJson : 'kindeditor_a5/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
	
	    
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"newsproclaim",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"newsproclaim"); 
%>
  <body >
  <form  action="newsproclaim_modf.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="f1"  onsubmit="return checkform();">
  

   �޸�<%=mmm.get("leibie")%>:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#ADCEEF" style="border-collapse:collapse">  
     <tr><td>���⣺</td><td><input name='biaoti' type='text' id='biaoti' size='50' value="<%=mmm.get("biaoti")%>" /></td></tr>
	 <tr><td>���</td><td><input name='leibie' type='text' id='leibie' value='<%=mmm.get("leibie")%>' /></td></tr>
	 <tr><td>���ݣ�</td><td><textarea name="neirong" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=mmm.get("neirong")%></textarea></td></tr>
	 <tr><td>�����ˣ�</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%=mmm.get("tianjiaren")%>' /></td></tr>
	 <tr><td>����ʣ�</td><td><input name='dianjilv' type='text' id='dianjilv' value='<%=mmm.get("dianjilv")%>' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ"  />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

