<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<title>管理员登录</title>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<style>
body, p, div, ul, li, h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}

body {
	background: #E9E9E9;
}

#login {
	width: 400px;
	height: 250px;
	background: #FFF;
	margin: 200px auto;
	position: relative;
}

#login h1 {
	text-align: center;
	position: absolute;
	left: 120px;
	top: -40px;
	font-size: 21px;
}

#login   p {
	text-align: center;
}

#user {
	background: url(images/user.png) rgba(0, 0, 0, .1) no-repeat;
	width: 200px;
	height: 30px;
	border: solid #ccc 1px;
	border-radius: 3px;
	padding-left: 32px;
	margin-top: 50px;
	margin-bottom: 30px;
}

#pwd {
	background: url(images/pwd.png) rgba(0, 0, 0, .1) no-repeat;
	width: 200px;
	height: 30px;
	border: solid #ccc 1px;
	border-radius: 3px;
	padding-left: 32px;
	margin-bottom: 30px;
}

#submit {
	width: 232px;
	height: 30px;
	background: rgba(0, 0, 0, .1);
	border: solid #ccc 1px;
	border-radius: 3px;
}

#submit:hover {
	cursor: pointer;
	background: #D8D8D8;
}
</style>
</head>
<body>
	<div id="login">
		<h1>管理员登录</h1>
	 
			 <p>
				<input type="text" name="user" id="user" onchange="checkname()" placeholder="用户名">
			 
			 </p>
			 <p>
				<input type="password" name="password" id="pwd" placeholder="密码">
			 
		 </p><p>
				<input type="button" id="submit" onclick="login()" value="登录">
			 </p>
		  
	</div>
	<div style="text-align: center;"></div>
</body>
<script type="text/javascript">
function checkname(){
	$.post("/adminBag/login_check",{
		username : $("#user").val()		
	} ,function(data, status){
		if (data == "error") {
			alert("此用户不存在");
		}  
	}
	);
}
function login() { 
	$.post("/adminBag/do_login", { 
		username : $("#user").val(),
		password : $("#pwd").val()
	}, function(data, status) {
		if (data == "error") {
			alert("登陆失败 请输入正确的用户密码");
		}  
		if (data == "success")
			{ 
			window.location.href = "index";   
			}
	});  
}  
</script>
</html>