<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="utf-8" %>

<html lang="en" class="no-js">
<head>
	<meta charset="utf-8">
	<title>商城后台管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- CSS -->
	<link rel="stylesheet" href="../assets/css/reset.css">
	<link rel="stylesheet" href="../assets/css/supersized.css">
	<link rel="stylesheet" href="../assets/css/style.css">

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

</head>

<body>

<div class="page-container">
	<h1>登录</h1>
	<div class="login-form" >
		<input type="text" id="username" name="username" class="username" placeholder="用户名">
		<input type="password" id="password" name="password" class="password" placeholder="密码">
		<button id="loginBtn">登陆</button>
		<div class="error"><span>+</span></div>
	</div>
</div>

<!-- Javascript -->
<script src="../assets/js/jquery-1.8.2.min.js"></script>
<script src="../assets/js/supersized.3.2.7.min.js"></script>
<script src="../assets/js/supersized-init.js"></script>
<script src="../assets/js/scripts.js"></script>
<script type="application/javascript">

	$('#loginBtn').on('click', function() {
		var username = $('#username').val();
		var password = $('#password').val();
		$.ajax({
			url:'/login.json',
			data:{username:username, password: password},
			dataType:'json',
			success: function (rest) {
				if(rest.code == 1) {
					window.location = "/index.html";
				} else {
					alert(rest.tip);
				}
			}
		});
		//
	});
</script>
</body>

</html>


