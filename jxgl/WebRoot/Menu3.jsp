<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>驾校学员管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="images/style.css" type="text/css" rel="stylesheet">
    <style>
        .main_left
        {
            table-layout: auto;
            background: url(images/left_bg.gif);
        }
        .main_left_top
        {
            background: url(images/left_menu_bg.gif);
            padding-top: 5px;
        }
        .main_left_title
        {
            padding-left: 15px;
            font-weight: bold;
            font-size: 14px;
            color: #fff;
            text-align: left;
        }
        .left_iframe
        {
            background: none transparent scroll repeat 0% 0%;
            visibility: inherit;
            width: 180px;
            height: 92%;
        }
        .main_iframe
        {
            z-index: 1;
            visibility: inherit;
            width: 100%;
            height: 92%;
        }
        TABLE
        {
            font-size: 12px;
            font-family: tahoma, 宋体, fantasy;
        }
        TD
        {
            font-size: 12px;
            font-family: tahoma, 宋体, fantasy;
        }
    </style>

    <script language="javaScript" src="images/admin.js" type="text/javascript"></script>

    <script language="javascript" src="images\Admin(1).js"></script>

    <script>
var status = 1;
var Menus = new DvMenuCls;
document.onclick=Menus.Clear;
function switchSysBar(){
     if (1 == window.status){
		  window.status = 0;
          switchPoint.innerHTML = '<img src="images/left.gif">';
          document.all("frmTitle").style.display="none"
     }
     else{
		  window.status = 1;
          switchPoint.innerHTML = '<img src="images/right.gif">';
          document.all("frmTitle").style.display=""
     }
}
    </script>

    <meta content="MSHTML 6.00.2900.5726" name="GENERATOR">
</head>
<body style="margin: 0px">
    <!--导航部分-->
    <div class="top_table">
        <div class="top_table_leftbg">
            <div class="system_logo">
                <img src="images/logo_up.gif"></div>
            <div class="menu">
                <ul>
                    <li id="menu_0" onMouseOver="Menus.Show(this,0)" onClick="getleftbar(this);"><a href="#">
                        个人资料</a>
                        <div class="menu_childs" onMouseOut="Menus.Hide(0);">
                            <ul>
                                <li><a href="xueshengxinxi_modf2.jsp" target="frmright">个人资料管理</a> </li>
                               
                            </ul>
                        </div>
                        <div class="menu_div">
                            <img style="vertical-align: bottom" src="images/menu01_right.gif"></div>
                    </li>
					<li id="menu_1" onMouseOver="Menus.Show(this,0)" onClick="getleftbar(this);"><a href="#">
                        校区信息</a>
                        <div class="menu_childs" onMouseOut="Menus.Hide(0);">
                            <ul>
                                <li><a href="yuanxiaoxinxi_list.jsp" target="frmright">校区信息查询</a> </li>
                               
                            </ul>
                        </div>
                        <div class="menu_div">
                            <img style="vertical-align: bottom" src="images/menu01_right.gif"></div>
                    </li>
					<li id="menu_2" onMouseOver="Menus.Show(this,0)" onClick="getleftbar(this);"><a href="#">
                        车辆信息</a>
                        <div class="menu_childs" onMouseOut="Menus.Hide(0);">
                            <ul>
                                <li><a href="zhuanyexinxi_list.jsp" target="frmright">车辆信息查询</a> </li>
							</ul>
                        </div>
                        <div class="menu_div">
                            <img style="vertical-align: bottom" src="images/menu01_right.gif"></div>
					</li>
					<li id="menu_3" onMouseOver="Menus.Show(this,0)" onClick="getleftbar(this);"><a href="#">
                        学员信息</a>
                        <div class="menu_childs" onMouseOut="Menus.Hide(0);">
                            <ul>
                                <li><a href="xueshengxinxi_list2.jsp" target="frmright">学员信息查询</a> </li>
                                
                            </ul>
                        </div>
                        <div class="menu_div">
                            <img style="vertical-align: bottom" src="images/menu01_right.gif"></div>
                    </li>
                   
                    <li id="menu_4" onMouseOver="Menus.Show(this,0)" onClick="getleftbar(this);"><a href="#">
                        在线考试</a>
                        <div class="menu_childs" onMouseOut="Menus.Hide(0);">
                            <ul>
                                <li><a href="shijuanshengcheng_list3.jsp" target="frmright">在线考试</a> </li>
                                <li><a href="cj_list2.jsp" target="frmright">我的成绩</a> </li>
                            </ul>
                        </div>
                        <div class="menu_div">
                            <img style="vertical-align: bottom" src="images/menu01_right.gif"></div>
                    </li>
                   <li id="menu_5" onMouseOver="Menus.Show(this,0)" onClick="getleftbar(this);"><a href="#">
                        通知公告</a>
                        <div class="menu_childs" onMouseOut="Menus.Hide(0);">
                            <ul>
                                
                                <li><a href="newsproclaim_list2.jsp" target="frmright">通知公告查询</a> </li>
                            </ul>
                        </div>
                        <div class="menu_div">
                            <img style="vertical-align: bottom" src="images/menu01_right.gif"></div>
					</li> 
                    
                   
                </ul>
            </div>
        </div>
    </div>
    <div style="background: #337abb; height: 24px">
    </div>
    <!--导航部分结束-->
    <table style="background: #337abb" height="92%" cellspacing="0" cellpadding="0" width="100%"
        border="0">
        <tbody>
            <tr>
                <td class="main_left" id="frmTitle" valign="top" align="middle" name="fmTitle">
                    <table class="main_left_top" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                            <tr height="32">
                                <td valign="top">
                                </td>
                                <td class="main_left_title" id="leftmenu_title">
                                    常用快捷功能
                                </td>
                                <td valign="top" align="right">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <iframe class="left_iframe" id="frmleft" name="frmleft" src="left2.html" frameborder="0"
                        allowtransparency></iframe>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                            <tr height="32">
                                <td valign="top">
                                </td>
                                <td valign="bottom" align="middle">
                                </td>
                                <td valign="top" align="right">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
              <td style="width: 10px" bgcolor="#337abb">
                    <table height="100%" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td style="height: 100%" onClick="switchSysBar()">
                                    <span class="navPoint" id="switchPoint" title="关闭/打开左栏">
                                        <img src="images/right.gif"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td valign="top" width="100%" bgcolor="#FFFFFF">
                    <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#c4d8ed" border="0">
                        <tbody>
                            <tr height="32">
                                <td valign="top" width="10" background="images/bg2.gif">
                                    <img alt="" src="images/teble_top_left.gif">
                                </td>
                                <td width="28" background="images/bg2.gif">
                                </td>
                                <td background="images/bg2.gif">
                                    <span style="float: left">欢迎使用驾校管理系统！--学生登录页面</span><span id="dvbbsannounce"
                                        style="font-weight: bold; float: left; width: 300px; color: #c00"></span>
                                </td>
                                <td style="color: #135294; text-align: right" background="images/bg2.gif">
                                  当前用户：<%=request.getSession().getAttribute("username")%>  | <a href="logout.jsp"
                                        target="_top">退出</a> |
                                </td>
                                <td valign="top" align="right" width="28" background="images/bg2.gif">
                                    <img alt="" src="images/teble_top_right.gif">
                                </td>
                                <td align="right" width="16" bgcolor="#337abb">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <iframe class="main_iframe" id="frmright" name="frmright" src="syscome.html"
                        frameborder="0" scrolling="yes"></iframe>
                    <table style="background: #c4d8ed" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                            <tr>
                                <td>
                                    <img height="6" alt="" src="images/teble_bottom_left.gif" width="5">
                                </td>
                                <td align="right">
                                    <img height="6" alt="" src="images/teble_bottom_right.gif" width="5">
                                </td>
                                <td align="right" width="16" bgcolor="#337abb">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <div id="dvbbsannounce_true" style="display: none">
    </div>

    <script language="JavaScript">
<!--
document.getElementById("dvbbsannounce").innerHTML = document.getElementById("dvbbsannounce_true").innerHTML;
//-->
    </script>

</body>
</html>
