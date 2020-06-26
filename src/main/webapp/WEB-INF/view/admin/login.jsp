<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
	<title>12380后台管理系统</title>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link href="/my/easyui/themes/insdep/easyui.css" rel="stylesheet" type="text/css">
	<link href="/my/easyui/themes/insdep/icon.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="/my/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="/my/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/my/easyui/themes/insdep/jquery.insdep-extend.min.js"></script>
	<style>
		.kit-login {
			position: relative;
			height: 100vh;
		}

		.kit-login-bg {
			position: absolute;
			top: 0px;
			left: 0px;
			right: 0px;
			bottom: 0px;
			background-size: cover;
			background-image: url(https://img.alicdn.com/tfs/TB1zsNhXTtYBeNjy1XdXXXXyVXa-2252-1500.png);
		}

		.kit-login-wapper {
			position: absolute;
			top: -100px;
			left: 0;
			right: 0;
			bottom: 0;
			max-width: 1080px;
			margin: 0 auto;
			display: -webkit-box;
			display: -webkit-flex;
			display: -ms-flexbox;
			display: flex;
			-webkit-justify-content: space-around;
			-ms-flex-pack: distribute;
			justify-content: space-around;
			-webkit-box-align: center;
			-webkit-align-items: center;
			-ms-flex-align: center;
			align-items: center;
		}

		.kit-login-wapper .kit-login-slogan {
			text-align: center;
			color: #fff;
			font-size: 36px;
			letter-spacing: 2px;
			line-height: 48px;
			margin-bottom: 9px;
			font-weight: 500;
		}

		.kit-login-wapper .kit-login-form {
			display: flex;
			justify-content: center;
			flex-direction: column;
			padding: 30px;
			background: #ffffff;
			border-radius: 6px;
			box-shadow: #eeeeee 1px 1px 2px;
			height: 260px;
			width: 280px;
			text-align: center;
		}

		.fl{float:left;color:#7d7d7d !important;font-size: 14px}
		.fr{float:right;color:#7d7d7d !important;font-size: 14px}

	</style>
</head>
<body>
<div class="kit-login">
	<div class="kit-login-bg"></div>
	<div class="kit-login-wapper">
		<h2 class="kit-login-slogan">欢迎使用 <br> 12380后台管理系统</h2>
		<div class="kit-login-form">
			<span style="font-size:22px;color: #00b5ad">登<span style="font-family: 宋体">&nbsp;</span>录</span>
			<form>
				<div style="height:20px;padding-bottom: 10px;">
					<p id="login_errormsg" style="color:#FF5722;"></p>
				</div>
				<div style="margin-bottom:25px">
					<input id="login_username" name="username" class="easyui-textbox theme-textbox-radius" prompt="帐号" iconWidth="28" style="width:100%;height:38px;padding:10px;">
				</div>
				<div style="margin-bottom:16px">
					<input id="login_password" name="password" class="easyui-passwordbox theme-textbox-radius" prompt="密码" iconWidth="28" style="width:100%;height:38px;padding:10px">
				</div>
				<div style="height:20px;margin-bottom:10px">
					<div class="fl"><input type="checkbox" name="remember" id="login_remember">&nbsp;记住密码</div>
				</div>
				<div style="margin-bottom: 15px;">
					<a href="#" class="easyui-linkbutton button-info button-lg" style="width: 100%"  onClick="loginSystem();">登录</a>
				</div>
			</form>
		</div>
	</div>
	<div style="position: absolute;bottom: 5px;width: 100%;height: 25px;text-align: center;">
		<span style="font-size: 12px">Copyright © xx股份有限公司</a>2020，All Rights Reserved</span>
	</div>
</div>
<script type="text/javascript">
	$(function () {
        $(document).keypress(function(event) {
            if (event.keyCode == 13)
                loginSystem();
        });
        if (localStorage.getItem("login_remember")) {
            $("#login_username").textbox('setValue', localStorage.getItem("login_username"));
            $("#login_password").passwordbox('setValue', localStorage.getItem("login_password"));
            $('#login_remember').attr("checked", true);
        }
    })

	function loginSystem(){
		$("#login_errormsg").html("");
		var username = $("#login_username").val();
		var password = $("#login_password").val();
		var remember = $("#login_remember").prop("checked");
		if(!username){
			$("#login_errormsg").html("请输入帐号！");
			return;
		}
		if(!password){
			$("#login_errormsg").html("请输入密码！");
			return;
		}
		$.post('/admin/login',{username:username,password:password},function(data){
			if(data.status){
                if (remember) {
                    localStorage.setItem("login_username", username);
                    localStorage.setItem("login_password", password);
                    localStorage.setItem("login_remember", true);
                } else {
                    localStorage.removeItem("login_username")
                    localStorage.removeItem("login_password")
                    localStorage.removeItem("login_remember")
                }
                window.location.href = "/admin/index";
            }else{
                $("#login_errormsg").html(data.message);
            }
		})
	}
</script>
</body>

</html>