<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.text.*"%> 
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.SimpleDateFormat,java.util.Date"%>

<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

 <%
	
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")  //�ж��û��Ƿ��Ѿ���½�����û�У��������½�����������ʾ��ǰ�û���Ϣ
	{
			out.print("<script>alert('�Բ���,�����ȵ�½!');window.history.go(-1);</script>");
	}
	String addtime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
	String jieshuriqi=request.getParameter("jieshuriqi");
	java.text.DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd"); java.util.Calendar c1=java.util.Calendar.getInstance(); 
java.util.Calendar c2=java.util.Calendar.getInstance(); 
try{     
  c1.setTime(df.parse(jieshuriqi));     
  c2.setTime(df.parse(addtime)); 
}catch(java.text.ParseException e)
{     
  out.print("<script>alert('��ʽ����ȷ!');location.href='shijuanshengcheng_list3.jsp';</script>");
	return;
} 

	int result=c1.compareTo(c2); 
  if(result<0)     
 {
 	
	out.print("<script>alert('�Բ���,���������ѹ����������ٿ���!');location.href='shijuanshengcheng_list3.jsp';</script>");
	return;
}
	 %>


<html>
  <head>
    
    <title>��УѧԱ����ϵͳ</title><LINK href="css.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE2 {color: #FFFFFF}
.STYLE4 {color: #FFFFFF; font-weight: bold; }
.STYLE6 {color: #198A95; font-weight: bold; }
.STYLE5 {	color: #72AC27;
	font-size: 26pt;
}
-->
</style>

<link href="qtimages/StyleSheet.css" rel="stylesheet" type="text/css">
  </head>

  <body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <table id="__01" width="100%" height="193" border="0" cellpadding="0" cellspacing="0">
    
    <tr>
      <td height="162" align="center">
	  <%
 


  
										String id=request.getParameter("id");
  String sql="";
  String nnn="";
  String bianhao="";
  String bbb="";
  String ccc="";
  String ddd="";
  String eee="";
    String nxuanzetishu="";
  String nxuanzetifenzhi="";
  String npanduantishu="";
  String npanduantifenzhi="";
  String ntiankongtishu="";
  String ntiankongtifenzhi="";
  String nbianchengtishu="";
					
											sql="select * from shijuanshengcheng where id="+id+"";
								for(HashMap map:new CommDAO().select(sql)){
								// while(RS_result.next()){
								 nnn=(String)map.get("danxuanti");
								 bianhao=(String)map.get("shijuanbianhao");
								 bbb=(String)map.get("tiankongti");
								 ccc=(String)map.get("panduanti");
								 eee=(String)map.get("bianchengti");
								 nxuanzetishu=(String)map.get("xuanzetishu");
								  nxuanzetifenzhi=(String)map.get("xuanzetifenzhi");
								  npanduantishu=(String)map.get("panduantishu");
								  npanduantifenzhi=(String)map.get("panduantifenzhi");
								  ntiankongtishu=(String)map.get("tiankongtishu");
								  ntiankongtifenzhi=(String)map.get("tiankongtifenzhi");
								  nbianchengtishu=(String)map.get("bianchengtishu");
								  
								

								 }
   %>
            <p>�Ծ��ţ�<%=bianhao%> ʱ�䣺1Сʱ�����ڿ�ʼ��ʱ��ʣ��<SPAN id=tiao></SPAN>�� <SCRIPT language=javascript>
			
			
<!--
function clock(){
	j=Math.floor(i/60);
	i=i-1;
	t=(i%60);
document.getElementById('tiao').innerHTML=j+"��"+t;
if(i>0) {
setTimeout("clock();",5000);
}
else {

alert("����ʱ�䵽��ϵͳ�Զ�����");
document.form1.submit();
}
}
var i=3600
clock()
//-->
</SCRIPT> </p>
            <form name="form1" method="post" action="jiaojuan.jsp?id=<%= id%>&bianhao=<%=bianhao%>">
              <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
                <tr>
                  <td height="33" colspan="2">��ѡ��(����<%=nxuanzetishu%>��ÿ��<%=nxuanzetifenzhi%>��)</td>
                </tr>
                <%
											
  sql="select * from danxuanti where id in ("+nnn+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
String timu="";String xuanxiangA="";String xuanxiangB="";String xuanxiangC="";String xuanxiangD="";String daan="";String kemumingcheng="";String zhishidianmingcheng="";String nanyichengdu="";
  addtime="";
 int i=0;
 
 for(HashMap map:new CommDAO().select(sql)){
 
 
 //while(RS_result.next()){
 i=i+1;
 id=(String)map.get("id");
timu=(String)map.get("shiti");xuanxiangA=(String)map.get("xuanxiangA");
xuanxiangB=(String)map.get("xuanxiangB");xuanxiangC=(String)map.get("xuanxiangC");xuanxiangD=(String)map.get("xuanxiangD");
daan=(String)map.get("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=(String)map.get("addtime");
 
											%>
                <tr>
                  <td width="9%" height="33">����<%=i%>��</td>
                  <td>��Ŀ��<%=timu%>
                      <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
                </tr>
                <tr>
                  <td rowspan="4">ѡ��</td>
                  <td width="91%"><input type="radio" name="xztxxa<%=i%>" value="A">
                    ѡ��A��<%=xuanxiangA%></td>
                </tr>
                <tr>
                  <td><input type="radio" name="xztxxa<%=i%>" value="B">
ѡ��B��<%=xuanxiangB%></td>
                </tr>
                <tr>
                  <td><input type="radio" name="xztxxa<%=i%>" value="C">
ѡ��C��<%=xuanxiangC%></td>
                </tr>
                <tr>
                  <td><input type="radio" name="xztxxa<%=i%>" value="D">
ѡ��D��<%=xuanxiangD%></td>
                </tr>
                <%
											  }
											  %>
              </table>
              <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
                <tr>
                  <td height="33" colspan="3">�����(����<%=ntiankongtishu%>��ÿ��<%=ntiankongtifenzhi%>��)</td>
                </tr>
                <%
											
  sql="select * from tiankongti where id in ("+bbb+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
  i=0;
 
 for(HashMap map:new CommDAO().select(sql)){
 
 
 
 //while(RS_result.next()){
 i=i+1;
 id=(String)map.get("id");
timu=(String)map.get("shiti");
daan=(String)map.get("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=(String)map.get("addtime");
 
											%>
                <tr>
                  <td width="9%" height="33">����<%=i%>��</td>
                  <td colspan="2">��Ŀ��<%=timu%>
                      <input name="tdtshitida<%=i%>" type="hidden" id="tdtshitida<%=i%>" value="<%=daan%>"></td>
                </tr>
                <tr>
                  <td>�𰸣�</td>
                  <td colspan="2"><input name="tktdaan<%=i%>" type="text" id="tktdaan<%=i%>"></td>
                </tr>
                <%
											  }
											  %>
              </table>
             
              <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
                <tr>
                  <td height="33" colspan="3">�ж���(����<%=npanduantishu%>��ÿ��<%=npanduantifenzhi%>��)</td>
                </tr>
                <%
											
 sql="select * from panduanti where id in ("+ccc+")";
  
  sql=sql+" order by id desc";
 // RS_result=connDbBean.executeQuery(sql);
  id="";
  i=0;
 
 
 
  for(HashMap map:new CommDAO().select(sql)){
 
 i=i+1;
 id=(String)map.get("id");
timu=(String)map.get("shiti");
daan=(String)map.get("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=(String)map.get("addtime");
 
											%>
                <tr>
                  <td width="9%" height="33">����<%=i%>��</td>
                  <td colspan="2">��Ŀ��<%=timu%>
                      <input name="pdtshitida<%=i%>" type="hidden" id="pdtshitida<%=i%>" value="<%=daan%>"></td>
                </tr>
                <tr>
                  <td>�𰸣�</td>
                  <td colspan="2"><input type="radio" name="pdtxxa<%=i%>" value="��"> 
                  ��
                    <input type="radio" name="pdtxxa<%=i%>" value="��">
                    ��</td>
                </tr>
                <%
											  }
											  %>
              </table>
              <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
                <tr>
                  <td height="33" colspan="3">�����(����<%=nbianchengtishu%>������Ա�ֶ����)</td>
                </tr>
                <%
											
  sql="select * from bianchengti where id in ("+eee+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
  i=0;
 
 for(HashMap map:new CommDAO().select(sql)){
 
 
 
 //while(RS_result.next()){
 i=i+1;
 id=(String)map.get("id");
timu=(String)map.get("shiti");
daan=(String)map.get("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=(String)map.get("addtime");
 
											%>
                <tr>
                  <td width="9%" height="33">����<%=i%>��</td>
                  <td colspan="2">��Ŀ��<%=timu%>
                      <input name="bchtshitida<%=i%>" type="hidden" id="bchtshitida<%=i%>" value="<%=daan%>"></td>
                </tr>
                <tr>
                  <td>�ش�</td>
                  <td colspan="2"><textarea name='bchtdaan<%=i%>' cols='50' rows='8' id='bchtdaan<%=i%>'></textarea></td>
                </tr>
                <%
											  }
											  %>
              </table> 
            
              <p>
                <input type="submit" name="Submit" value="����">
              </p>
        </form>
        <p>&nbsp;</p>
      </td>
    </tr>
  </table>
  </body>
</html>

