 <%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
 <%

	
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")  //�ж��û��Ƿ��Ѿ���½�����û�У��������½�����������ʾ��ǰ�û���Ϣ
	{
			out.print("<script>alert('�Բ���,�����ȵ�½!');window.history.go(-1);</script>");
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
  <table id="__01" width="100%" height="193" border="0" cellpadding="0" cellspacing="0">
    
    <tr>
      <td height="162" align="center">
	  <%
  String id=request.getParameter("id");
  String sql="",nnn="",bianhao="",bbb="",ccc="",ddd="",eee="";
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
            <p>�Ծ��ţ�<%=bianhao%></p>
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="2">��ѡ��(����<%=nxuanzetishu%>��ÿ��<%=nxuanzetifenzhi%>��)</td>
              </tr>
              <%
											
  sql="select * from danxuanti where id in ("+nnn+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
String timu="";String xuanxiangA="";String xuanxiangB="";String xuanxiangC="";String xuanxiangD="";String daan="";String kemumingcheng="";
 String addtime="";
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
                <td width="8%" height="33">����<%=i%>��</td>
                <td>��Ŀ��<%=timu%>
                    <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td rowspan="4">ѡ��</td>
                <td width="92%"><input type="radio" name="xztxxa<%=i%>" value="A">
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
            <input type=button name=Submit52 value=��ӡ onClick="javascript:window.print()" />
          </p>
      </td>
    </tr>
  </table>
  </body>
</html>

