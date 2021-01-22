<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>驾校学员管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {font-size: 12px; color: #adc9d9; }
-->
</style></head>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("验证码错误");
 <%}%>
 
 popheight = 39;

function check()
{
	if(document.form1.username.value=="" || document.form1.password.value=="" || document.form1.pagerandom.value=="")
	{
		alert('请输入完整信息！');
		return false;
	}
}

           function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 

           
           </script>


<body>
<table width="100%"  height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#1075b1">&nbsp;</td>
  </tr>
  <tr>
    <td height="608" background="images/login_03.gif"><table width="847" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="268" background="images/login_04.gif"><table width="72%" height="51" border="0" align="center">
              <tr>
                <td align="center"><div style="font-family:宋体; color:#FFFFFF;  WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 28px; margin-top:115pt">
                                     驾校学员管理系统
                </div></td>
              </tr>
            </table></td>
      </tr>
      <tr>
        <td  height="134" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
           <td ><table width="40%" border="0"  cellpadding="0" cellspacing="0" align="center">
                      <form name="form1" method="post" action="javazxksxtkfsj?ac=adminlogin&a=a">
                        <tr>
                          <td width="18%" height="30"><div align="center" class="STYLE3"><span class="STYLE2">用&nbsp;&nbsp;户</span></div></td>
                          <td height="30" colspan="2"><input name="username" type="text" id="username"  style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:15px; color:black;">
                              </td>
                          
                        </tr>
                        <tr>
                          <td height="30"><div align="center" class="STYLE3"><span class="STYLE2">密&nbsp;&nbsp;码</span></div></td>
                          <td height="30" colspan="2"><input name="password" type="password" id="password"  style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:15px; color:black;"></td>
                          </tr>
                        <tr>
                          <td height="30"><div align="center" class="STYLE3"><span class="STYLE2">权&nbsp;&nbsp;限</span></div></td>
                          <td height="30" colspan="2"><select name="qx" id="qx" style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:13px; color:black;">
                              <option value="管理员">管理员</option>
                             <option value="教练">教练</option>
                             <option value="学员">学员</option>
                            </select>
							</td>
                            <td width="62" rowspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25"><div align="center">
                  
                  <input type="image" name="dl"  src="images/dl.gif" onClick="return check();"></div></td>
              </tr>
              <tr>
                <td height="25" valign="bottom"><div align="center"><a href="login.jsp"><img src="images/cz.gif" width="57" height="20"></a></div></td>
              </tr>
            </table></td>
                          </tr>
                        <tr>
                          <td height="30"><div align="center" class="STYLE3"><span class="STYLE2">验证码</span></div></td>
                          <td width="15%" height="30"><input name="pagerandom" type="text" id="pagerandom"  style="height:18px; width:45px; border:solid 1px #cadcb2; font-size:15px; color:black;" /></td>
                          <td width="35%"><a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="54" height="20" border="1" align="absmiddle" style="margin-bottom:0px;"> </a></td>
                           
                        </tr>
                      </form>
                  </table></td>
              
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="206" background="images/login_11.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="black">&nbsp;</td>
  </tr>
</table>
</body>
</html>
