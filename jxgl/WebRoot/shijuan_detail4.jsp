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

	 String sjbh=request.getParameter("sjbh");
 String username=request.getParameter("username");


%>
<html>
 <head>
    
    <title>���⼯</title>
	<!--bixanjxiqxi-->
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>

  <body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <table id="__01" width="100%" height="193" border="0" cellpadding="0" cellspacing="0">
    
    <tr>
      <td height="162" align="center">
	 
        <p>�Ծ��ţ�<%=sjbh%></p>
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">��ѡ��</td>
              </tr>
               <%
  String id=request.getParameter("id");
  String ddd="",cwda="";
											sql="select * from cuotijilu where sjbh='"+sjbh+"' and username='"+username+"' and biao='danxuanti'";
											int i=0;
								for(HashMap map:new CommDAO().select(sql)){
								i=i+1;
								 ddd=(String)map.get("timuid");
								 
								 cwda=(String)map.get("cwda");				
  
  HashMap bdq = new CommDAO().getmaps("id",ddd,"danxuanti");
 
  //RS_result=connDbBean.executeQuery(sql);
  id="";
String timu="";String xuanxiangA="";String xuanxiangB="";String xuanxiangC="";String xuanxiangD="";String daan="";String kemumingcheng="";
 String addtime="";
 id=(String)bdq.get("id");
timu=(String)bdq.get("shiti");xuanxiangA=(String)bdq.get("xuanxiangA");
xuanxiangB=(String)bdq.get("xuanxiangB");xuanxiangC=(String)bdq.get("xuanxiangC");xuanxiangD=(String)bdq.get("xuanxiangD");
daan=(String)bdq.get("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=(String)bdq.get("addtime");
						%>
              <tr>
                <td width="8%" height="33">����<%=i%>��</td>
                <td colspan="2">��Ŀ��<%=timu%>                  </td>
              </tr>
             
              <tr>
                <td rowspan="4">ѡ��</td>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="A">
                  ѡ��A��<%=xuanxiangA%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="B">
ѡ��B��<%=xuanxiangB%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="C">
ѡ��C��<%=xuanxiangC%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="D">
ѡ��D��<%=xuanxiangD%></td>
              </tr>
              <tr>
                <td>�ҵĴ𰸣�</td>
                <td width="9%"><%=cwda%>  <input type="submit" name="button" id="button" value="�鿴��׼��" onClick="javascript:fsfds(<%=i%>)"> </td>
                <td width="83%"> <div id="xztshitida<%=i%>" style="display:none; color:#F00; font-weight:500"><%=daan%></div></td>
              </tr>
             
             
              <%
											  }
											  %>
            </table>
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">�����</td>
              </tr>
              <%
					String sql2="";						

   String ttt="",tcwda="";
											sql2="select * from cuotijilu where sjbh='"+sjbh+"' and username='"+username+"' and biao='tiankongti'";
											
											int j=0;
 
 for(HashMap mapt:new CommDAO().select(sql2)){

 j=j+1;
 ttt=(String)mapt.get("timuid");
								 
								 tcwda=(String)mapt.get("cwda");				
  
  HashMap tkq = new CommDAO().getmaps("id",ttt,"tiankongti");
  String ttimu="";String tdaan="";String taddtime="";

ttimu=(String)tkq.get("shiti");
tdaan=(String)tkq.get("daan");
//nanyichengdu=map.get("nanyichengdu");
 taddtime=(String)tkq.get("addtime");
 
											%>
              <tr>
                <td width="9%" height="33">����<%=j%>��</td>
                <td colspan="2">��Ŀ��<%=ttimu%>
                    </td>
              </tr>
            
              <tr>
                <td>�ҵĴ𰸣�</td>
                <td width="9%"><%=tcwda%>  <input type="submit" name="button" id="button" value="�鿴��׼��" onClick="javascript:tk(<%=j%>)"> </td>
                <td width="83%"> <div id="tdtshitida<%=j%>" style="display:none; color:#F00; font-weight:500"><%=tdaan%></div></td>
              </tr>
             
             
              <%
											  }
											  %>
            </table>     
           
                   
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">�ж���</td>
              </tr>
              <%
					String sql3="";						
 
  String pdt="",pcwda="";
 
											int k=0;
											sql3="select * from cuotijilu where sjbh='"+sjbh+"' and username='"+username+"' and biao='panduanti' ";
											
 
 for(HashMap mapptp:new CommDAO().select(sql3)){

 k=k+1;
 pdt=(String)mapptp.get("timuid");
								 
								 pcwda=(String)mapptp.get("cwda");				
  
  HashMap ttdt = new CommDAO().getmaps("id",pdt,"panduanti");
  String ptimu="";String pdaan="";String paddtime="";

ptimu=(String)ttdt.get("shiti");
pdaan=(String)ttdt.get("daan");
//nanyichengdu=map.get("nanyichengdu");
 paddtime=(String)ttdt.get("addtime");
 
											%>
              <tr>
                <td width="9%" height="33">����<%=k%>��</td>
                <td colspan="2">��Ŀ��<%=ptimu%>
                    </td>
              </tr>
              <tr>
                <td>�𰸣�</td>
                <td colspan="2"><input type="radio" name="pdtxxa<%=k%>" value="��"> 
                  ��
                    <input type="radio" name="pdtxxa<%=k%>" value="��">
                    ��</td>
              </tr>
              <tr>
                <td>�ҵĴ𰸣�</td>
                <td width="9%"><%=pcwda%>  <input type="submit" name="button" id="button" value="�鿴��׼��" onClick="javascript:pd(<%=k%>)"> </td>
                <td width="83%"> <div id="pdtshitida<%=k%>" style="display:none; color:#F00; font-weight:500"><%=pdaan%></div></td>
              </tr>
                 <%
											  }
											  %>
            </table> 
            <script language="javascript">
            function fsfds(sss)
			{
					//alert("dd");
				document.getElementById("xztshitida"+sss).style.display="";
				}
            </script>
             <script language="javascript">
            function tk(sss)
			{
					//alert("dd");
				document.getElementById("tdtshitida"+sss).style.display="";
				}
            </script>
             <script language="javascript">
            function pd(sss)
			{
					//alert("dd");
				document.getElementById("pdtshitida"+sss).style.display="";
				}
            </script>
  </body>
</html>

