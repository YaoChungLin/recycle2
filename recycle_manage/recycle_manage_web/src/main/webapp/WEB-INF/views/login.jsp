<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	
<head>
		<meta charset="utf-8">
		<title>登录界面</title>
		<link rel="stylesheet" href="/css/reset.css" />
		<link rel="stylesheet" href="/css/common.css" />
		<link rel="stylesheet" href="/css/font-awesome.min.css" />
	</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							登录
						</div>
						<form id="doLoginForm" method="post">
							<div class="form_text_ipt">
								<input name="username" id="username" type="text" placeholder="用户名">
							</div>
							<div class="ececk_warning" id="username_div"><span id="username_warning">用户名不能为空</span></div>
							
							<div class="form_text_ipt">
								<input name="password" id="password" type="password" placeholder="密码">
							</div>
							<div class="ececk_warning" id="password_div"><span id="password_warning">密码不能为空</span></div>
							
							<div class="form_check_ipt">
								<div class="left check_left">
									<label><input name="" type="checkbox"> 下次自动登录</label>
								</div>
								<div class="right check_right">
									<a href="#">忘记密码</a>
								</div>
							</div>
							<div class="form_btn">
								<button type="button" onclick="submitForm()">登录</button>
							</div>
							<div class="form_reg_btn">
								<span>还没有帐号？</span><a href="register.html">马上注册</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="/js/jquery.min.js" ></script>
		<script type="text/javascript" src="/js/register_common.js" ></script>
		<script>
            function submitForm(){
                var _password = $("#doLoginForm [name=password]").val();
                var _username = $("#doLoginForm [name=username]").val();

                //提交到后台的RESTful
                $.ajax({
                    type: "post",
                    url: "/rest/user/doLogin",
                    contentType : "application/x-www-form-urlencoded; charset=utf-8",
                    data : {password:_password,username:_username},
                    dataType : 'json',
                    statusCode:{
                        201:function(){
                            $(location).attr("href",'/rest/page/index');
                        },
                        500:function(){
                            alert('登录失败!');
                            $(location).attr("href",'/rest/page/login');
                        },
                        400:function(){
                            alert('提交的参数不合法!');
                            $(location).attr("href",'/rest/page/login');
                        }
                    }

                });
            }
		</script>
	</body>
</html>
