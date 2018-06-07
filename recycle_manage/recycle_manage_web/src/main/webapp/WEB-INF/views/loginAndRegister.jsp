<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>注册/登录</title>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/css/normalize.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src='/js/jquery.min.js'></script>
    <script>
        // 清除输入错误的提示框
        function clearPrompt(input) {
            input.setCustomValidity("");
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $('#username').blur(function () {
                var username=document.getElementById("username").value;
                $.ajax({
                    url:'/rest/user/'+username+'/1',
                    type:'GET',
                    contentType: 'application/json; charset=utf-8',
                    statusCode:{
                        201:function(){
                        },
                        400:function(){
                            alert("该用户已经被注册，请重新输入！！！");
                            window.location.reload();
                        },
                        500:function(){
                            alert("服务出错，请稍后再试！！！");
                            window.location.reload();
                        }
                    }
                })
            })
            $('#phone').blur(function () {
                var phone=document.getElementById("phone").value;
                $.ajax({
                    url:'/rest/user/'+phone+'/2',
                    type:'GET',
                    contentType: 'application/json; charset=utf-8',
                    statusCode:{
                        201:function(){
                        },
                        400:function(){
                            alert("该手机号码已经被注册，请重新输入！！！");
                            window.location.reload();
                        },
                        500:function(){
                            alert("服务出错，请稍后再试！！！");
                            window.location.reload();
                        }
                    }
                })
            })
            $('#email').blur(function () {
                var email=document.getElementById("email").value;
                $.ajax({
                    url:'/rest/user/'+email+'/3',
                    type:'GET',
                    contentType: 'application/json; charset=utf-8',
                    statusCode:{
                        201:function(){
                        },
                        400:function(){
                            alert("该用户已经被注册，请重新输入！！！");
                            window.location.reload();
                        },
                        500:function(){
                            alert("服务出错，请稍后再试！！！");
                            window.location.reload();
                        }
                    }
                })
            })
        })
    </script>
</head>

<body>

    <div class="form">

        <ul class="tab-group">
            <li class="tab active"><a href="#signup">Sign Up</a></li>
            <li class="tab"><a href="#login">Log In</a></li>
        </ul>
      
        <div class="tab-content">
            <div id="signup">   
                <h1>Sign Up for Free</h1>
          
                <form action="/rest/user/doRegister" method="post">
          
                    <div class="top-row">
                        <div class="field-wrap">
                            <label>
                                Username<span class="req">*</span>
                            </label>
                            <input type="text"  id="username" name="username" required pattern="[a-zA-Z][a-zA-Z0-9_-]{3,15}" oninput="clearPrompt(this)" oninvalid="setCustomValidity('用户名是以字母开头，包含大小写字母下划线和减号的4-16位字符')" />
                        </div>
        
                        <div class="field-wrap">
                            <label>
                                Tel<span class="req">*</span>
                            </label>
                            <input type="tel" id="phone" name="phone" required pattern="1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}" oninput="clearPrompt(this)" oninvalid="setCustomValidity('请输入正确的手机号码')" />
                        </div>
                    </div>

                    <div class="field-wrap">
                        <label>
                            Email Address<span class="req"></span>
                        </label>
                        <input type="email" id="email" name="email" autocomplete="off"/>
                    </div>
          
                    <div class="field-wrap">
                        <label>
                            Set A Password<span class="req">*</span>
                        </label>
                        <input type="password"  id="password" name="password" required pattern="[a-zA-Z0-9_-]{6,16}" oninput="clearPrompt(this)" oninvalid="setCustomValidity('密码是包含大小写字母下划线或减号的6-16位字符')" />
                    </div>

                    <button type="submit" class="button button-block">Get Started</button>
          
                </form>

            </div>
        
            <div id="login">   
                <h1>Welcome Back!</h1>
          
                <form action="/rest/user/doLogin" method="post">
          
                    <div class="field-wrap">
                        <label>
                            Tel<span class="req">*</span>
                        </label>
                        <input type="tel" id="login_phone" name="login_phone"  required pattern="1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}" oninput="clearPrompt(this)" oninvalid="setCustomValidity('请输入正确的手机号码')" />
                    </div>
          
                    <div class="field-wrap">
                        <label>
                            Password<span class="req">*</span>
                        </label>
                        <input type="password" id="login_password" name="login_password" required autocomplete="off" pattern="[a-zA-Z0-9_-]{6,16}" oninput="clearPrompt(this)" oninvalid="setCustomValidity('密码是包含大小写字母下划线或减号的6-16位字符')" />
                    </div>
          
                    <p class="forgot"><a href="#">Forgot Password?</a></p>
          
                    <button class="button button-block">Log In</button>
          
                </form>

            </div>
        
        </div><!-- tab-content -->
      
    </div> <!-- /form -->
    <script src='/js/logindex.js'></script>
</body>
</html>
