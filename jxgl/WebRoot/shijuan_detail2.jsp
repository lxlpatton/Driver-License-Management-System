 <%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
 <%

	
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")  //判断用户是否已经登陆，如果没有，则给出登陆框，如果有则显示当前用户信息
	{
			out.print("<script>alert('对不起,请您先登陆!');window.history.go(-1);</script>");
	}



%>
<html>
 <head>
    
    <title>试卷生成</title>
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
            <p>试卷编号：<%=bianhao%></p>
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="2">单选题(题数<%=nxuanzetishu%>，每题<%=nxuanzetifenzhi%>分)</td>
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
                <td width="8%" height="33">试题<%=i%>：</td>
                <td>题目：<%=timu%>
                    <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td rowspan="4">选项</td>
                <td width="92%"><input type="radio" name="xztxxa<%=i%>" value="A">
                  选项A：<%=xuanxiangA%></td>
              </tr>
              <tr>
                <td><input type="radio" name="xztxxa<%=i%>" value="B">
选项B：<%=xuanxiangB%></td>
              </tr>
              <tr>
                <td><input type="radio" name="xztxxa<%=i%>" value="C">
选项C：<%=xuanxiangC%></td>
              </tr>
              <tr>
                <td><input type="radio" name="xztxxa<%=i%>" value="D">
选项D：<%=xuanxiangD%></td>
              </tr>
              <%
											  }
											  %>
            </table>
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">填空题(题数<%=ntiankongtishu%>，每题<%=ntiankongtifenzhi%>分)</td>
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
                <td width="9%" height="33">试题<%=i%>：</td>
                <td colspan="2">题目：<%=timu%>
                    <input name="tdtshitida<%=i%>" type="hidden" id="tdtshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td>答案：</td>
                <td colspan="2"><input name="tktdaan<%=i%>" type="text" id="tktdaan<%=i%>"></td>
              </tr>
              
              <%
											  }
											  %>
            </table>     
            </table>
                   
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">判断题(题数<%=npanduantishu%>，每题<%=npanduantifenzhi%>分)</td>
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
                <td width="9%" height="33">试题<%=i%>：</td>
                <td colspan="2">题目：<%=timu%>
                    <input name="pdtshitida<%=i%>" type="hidden" id="pdtshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td>答案：</td>
                <td colspan="2"><input type="radio" name="pdtxxa<%=i%>" value="对"> 
                  对
                    <input type="radio" name="pdtxxa<%=i%>" value="错">
                    错</td>
              </tr>
              <%
											  }
											  %>
            </table>     
             <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
                <tr>
                  <td height="33" colspan="3">简答题(题数<%=nbianchengtishu%>，管理员手动打分)</td>
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
                  <td width="9%" height="33">试题<%=i%>：</td>
                  <td colspan="2">题目：<%=timu%>
                      <input name="bchtshitida<%=i%>" type="hidden" id="bchtshitida<%=i%>" value="<%=daan%>"></td>
                </tr>
                <tr>
                  <td>回答：</td>
                  <td colspan="2"><textarea name='bchtdaan<%=i%>' cols='50' rows='8' id='bchtdaan<%=i%>'></textarea></td>
                </tr>
                <%
											  }
											  %>
              </table>        
          <p>
            <input type=button name=Submit52 value=打印 onClick="javascript:window.print()" />
          </p>
      </td>
    </tr>
  </table>
  </body>
</html>

