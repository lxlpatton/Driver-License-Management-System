 <%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
 <%

	
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")  //�ж��û��Ƿ��Ѿ���½�����û�У��������½�����������ʾ��ǰ�û���Ϣ
	{
			out.print("<script>alert('�Բ���,�����ȵ�½!');window.history.go(-1);</script>");
	}
String sql="";
	String sql2="";	
	 String bianhao=request.getParameter("bianhao");
	 
 String username=request.getParameter("username");
 
if(request.getParameter("f")!=null){
 sql="select * from zgtcj where username='"+username+"' and sjbh='"+bianhao+"' order by id desc";

int t=0;
 
 for(HashMap map:new CommDAO().select(sql)){
	 t=t+1;
	sql2="update zgtcj set defen="+request.getParameter("cj"+t)+" where id="+request.getParameter("bid"+t);
	 new CommDAO().commOper(sql2); 
	 sql2="update cj set zcj=zcj+"+request.getParameter("cj"+t)+" where username='"+username+"' and sjbh='"+bianhao+"'";
	 new CommDAO().commOper(sql2); 
 }

	HashMap zmm = new CommDAO().getmapss("username",request.getParameter("username"),"sjbh",request.getParameter("bianhao"),"cj"); 
     float zcj=Float.valueOf((String)zmm.get("zcj")).floatValue();
 
out.print("<script>alert('���Դ�ֳɹ�!!�ɼ�Ϊ"+zcj+"�֣�');location.href='cj_list3.jsp';</script>");
}

%>
<html>
 <head>
    
    <title>�Ծ�����</title>
	<!--bixanjxiqxi-->
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>

  <body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <%
  		
  %>
  <form name="form1" method="post" action="shijuan_detail3.jsp?f=f">
   <input name="username" type="hidden" id="username" value="<%=username%>">
    <input name="bianhao" type="hidden" id="bianhao" value="<%=bianhao%>">
  <table id="__01" width="100%" height="193" border="0" cellpadding="0" cellspacing="0">
    
    <tr>
      <td height="162" align="center">
	  <%
	 
  
   %>
            <p>�Ծ��ţ�<%=bianhao%></p>
               
             <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
                <tr>
                  <td height="33" colspan="3">�����</td>
                </tr>
                <%
										
  sql="select * from zgtcj where username='"+username+"' and sjbh='"+bianhao+"'";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
 // id="";
 int i=0;
 
 for(HashMap map:new CommDAO().select(sql)){
 
 
 
 //while(RS_result.next()){
 i=i+1;
String id=(String)map.get("id");
String tmid=(String)map.get("timuid");
String xsda=(String)map.get("xueshengdaan");

//nanyichengdu=map.get("nanyichengdu");
//String addtime=(String)map.get("addtime");
//sql2="select xueshengdaan from zgtcj where sjbh='"+bianhao+"' and timuid="+(String)map.get("id")+"";
HashMap zzz = new CommDAO().getmap(tmid,"bianchengti"); 
 
 String timu=(String)zzz.get("shiti");
 
											%>
                <tr>
                  <td width="9%" height="33">����<%=i%>��</td>
                  <td colspan="2">��Ŀ��<%=timu%>
                     </td>
                </tr>
                <tr>
                  <td>�ش�</td>
                  <td colspan="2"> <textarea name='xueshengdaan' cols='50' rows='8' id='shiti'><%=xsda%></textarea></td>
                </tr>
                <tr>
                  <td>��֣�</td>
                  <td colspan="2"> <input name="cj<%=i%>" type="text" id="cj<%=i%>" value=""> <input name="bid<%=i%>" type="hidden" id="bid<%=i%>" value="<%=id%>"></td>
                </tr>
                <%
											  }
											  %>
              </table>        
          <p>&nbsp;</p>
           <p>
                <input type="submit" name="Submit" value="�ύ">
              </p>
        </form>
    
  </body>
</html>

