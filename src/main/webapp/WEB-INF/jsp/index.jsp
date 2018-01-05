<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>存包后台管理系统</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/themes/icon.css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
<script type="text/javascript" src='js/outlook2.js'> </script>

<script type="text/javascript">
  var _menus = {"menus":[
						{"menuid":"2","icon":"icon-sys","menuname":"柜子管理 ",
							"menus":[
									 {"menuid":"13","menuname":"柜子管理","icon":"icon-edit","url":"${pageContext.request.contextPath}/parentbags"}  
								]
						},
						{"menuid":"6","icon":"icon-sys","menuname":"优惠券管理",
							"menus":[
									{"menuid":"61","menuname":" 优惠券管理","icon":"icon-add", "url":"${pageContext.request.contextPath}/coupon"}  
								]
						},
						{"menuid":"5","icon":"icon-sys","menuname":"用户信息管理 ",
							"menus":[
									{"menuid":"22","menuname":"用户信息管理 ","icon":"icon-nav","url":"${pageContext.request.contextPath}/userExt"}
								]
						},{"menuid":"3","icon":"icon-sys","menuname":"订单管理",
							"menus":[{"menuid":"31","menuname":"订单管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/order"} 
						]
						},{"menuid":"4","icon":"icon-sys","menuname":"用户账户余额管理",
							"menus":[ 
									{"menuid":"43","menuname":"用户账户余额管理","icon":"icon-nav", "url":"${pageContext.request.contextPath}/account"}
								]
						},{"menuid":"1","icon":"icon-sys","menuname":" 用户推荐位置管理",
							"menus":[ 
									{"menuid":"52","menuname":" 用户推荐位置管理","icon":"icon-nav","url":"${pageContext.request.contextPath}/position"}
								]
						}
				]};
        //设置修改密码窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭修改密码窗口
        function closePwd() {
            $('#w').window('close');
        } 

        //修改密码
        function editpwd(){
        	 alert("a");
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');
           /*  alert($newpass.val());
            alert($rePass.val()); */
            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }
            
            $.post("${pageContext.request.contextPath}/editpassword",{  
            	newpass:$newpass.val()
            } ,function(data, status) { 
            	if(data=="success")
            		{ 
            		 msgShow('系统提示', '恭喜，密码修改成功 ', 'info');
                     $newpass.val('');
                     $rePass.val('');
                     closePwd(); 
            		}
            	else
            		{
            		if(data=="false")
            			{
            			 msgShow('系统提示', '修改失败系统异常！', 'info');
            			}
            		} 
            });   
        }
        

        $(function() {

            openPwd();

            $('#editpass').click(function() {
                $('#w').window('open');
            }); 

			$('#btnCancel').click(function(){closePwd();});

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
                    if (r) {
                    	
                  //location.href = '${pageContext.request.contextPath}/loginout'; 
                  $.post("${pageContext.request.contextPath}/loginout",{  
                   
                  } ,function(data, status) { 
                  	if(data=="success")
                  		{ 
               location.href = '${pageContext.request.contextPath}/'
                  		}
                  	else
                  		{
                  		 
                  			 msgShow('系统提示', '系统异常！', 'info');
                  			 
                  		} 
                  });         
                    }
                });
            });
            
        }); 
    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<noscript>
		<div
			style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<!-- 顶部边框 -->
	<div region="north" split="true" border="false"
		style="overflow: hidden; height: 30px; background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;" class="head">欢迎登录
			 <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a>
		</span> <span style="padding-left: 10px; font-size: 16px;"><img
			src="images/blocks.gif" width="20" height="20" align="absmiddle" />
			存包后台管理系统</span>
	</div>
	<!-- 底部边框 -->
	<div region="south" split="true"
		style="height: 30px; background: #D2E0F2;">
		<div class="footer"></div>
	</div>
<!-- 左边导航菜单 -->
	<div region="west" hide="true" split="true" title="导航菜单"
		style="width: 180px;" id="west">
		<div id="nav" class="easyui-accordion" fit="true" border="false">
			<!--  导航内容 -->

		</div>
	</div>
	
	<!-- 中间主内容     当前设置为打开后的首页 -->
	<div id="mainPanle" region="center"
		style="background: #eee; overflow-y: hidden">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
	 
		</div>
	</div>


	<!--修改密码窗口-->
	<div id="w" class="easyui-window" title="修改密码" collapsible="false"
		minimizable="false" maximizable="false" icon="icon-save"
		style="width: 300px; height: 150px; padding: 5px; background: #fafafa;">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<table cellpadding=3>
					<tr>
						<td>新密码：</td>
						<td><input id="txtNewPass" type="Password" class="txt01" /></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input id="txtRePass" type="Password" class="txt01" /></td>
					</tr>
				</table>
			</div>
			<div region="south" border="false"
				style="text-align: right; height: 30px; line-height: 30px;">
				<button id="btnEp" class="easyui-linkbutton" icon="icon-ok" onclick="editpwd()"
					 > 确定</button>
					  <button id="btnCancel"
					class="easyui-linkbutton" icon="icon-cancel"
					href="javascript:void(0)">取消</button>
			</div>
		</div>
	</div>

	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>