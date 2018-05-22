<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
		<meta charset="utf-8">
		<title>注册界面</title>
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
							注册
						</div>
						<form  id="doRegisterForm" method="post" >
							<div class="form_text_ipt">
								<input name="username" id="username" type="text" placeholder="用户名" >
							</div>
							<div class="ececk_warning" id="username_div"><span id="username_warning"></span></div>
							
							<div class="form_text_ipt">
								<input name="tel" id="tel" type="text" placeholder="手机号" >
							</div>
							<div class="ececk_warning" id="tel_div"><span id="tel_warning"></span></div>
							
							<div class="form_text_ipt">
								<input name="password" id="password" type="password" placeholder="密码" >
							</div>
							<div class="ececk_warning" id="password_div"><span id="password_warning"></span></div>
							
							<div class="form_text_ipt">
								<input name="repassword" id="repassword" type="password" placeholder="重复密码" >
							</div>
							<div class="ececk_warning" id="repassword_div"><span id="repassword"></span></div>
							
							<div class="form_btn">
								<button type="button" onclick="submitForm()">注册</button>
								<%--<a href="javascript:void(0)"  onclick="submitForm()">提交</a>--%>
							</div>
							
							<div class="form_reg_btn">
								<span>已有帐号？</span><a href="login.jsp">马上登录</a>
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
                var _password = $("#doRegisterForm [name=password]").val();
                var _username = $("#doRegisterForm [name=username]").val();
                var _phone = $("#doRegisterForm [name=tel]").val();

                //提交到后台的RESTful
                $.ajax({
                    type: "post",
                    url: "/rest/user",
                    contentType : "application/x-www-form-urlencoded; charset=utf-8",
                    data : {password:_password,username:_username,phone:_phone},
                    dataType : 'json',


                });
            }

            $(function(){
                $('#username').blur(function () {
                    var value = $(this).val();
                    $.ajax({
                        url:"/rest/user/"+value+"/1?r="+Math.random(),
						dataType:"json",
                        success:function(data){
                            if(!data){
                                $('#username_div').css('display','block');
                				$('#username_warning').text("该名称已被占用！");
                    			data = false;
                            }
                            else{
                                $('#username_div').css('display','block');
                				$('#username_warning').text("恭喜你该名称可以使用！");
                				data=true;
                            }
                        }
                    })
                })
                $('#tel').blur(function () {
                    var value = $(this).val();
                    $.ajax({
                        url:"/rest/user/"+value+"/2?r="+Math.random(),
                        dataType:"json",
                        success:function(data){
                            if(!data){
                                $('#tel_div').css('display','block');
                                $('#tel_warning').text("该手机号码已被占用！");
                                data = false;
                            }
                            else{
                                $('#tel_div').css('display','block');
                                $('#tel_warning').text("恭喜你该手机号码可以使用！");
                                data=true;
                            }
                        }
                    })
                })
			})
        </script>
	</body>
</html>
