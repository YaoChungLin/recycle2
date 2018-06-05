<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>数码在线回收-修改密码 </title>
        <meta charset="utf-8">
        
        <style>
            body {
                background-attachment: fixed;
                background-image: url(/image/SignLogBG.jpg);
                background-repeat: no-repeat;
                background-size: 100% 100%;
				overflow: hidden;
            }
            
            #Profle {
                position: absolute;
                text-align: center;
                left: 50%;
                top: 10px;
                transform: translate(-50%);
            }
            
            #ProfleIMG {
                width: 96px;
                height: 96px;
            }
            
            h3 {
                color: azure;
            }
            
            .form {
                position: relative;
                z-index: 1;
                background: rgba(0, 0, 0, 0.8);
                max-width: 300px;
                margin: 200px auto 0;
                padding: 30px;
                border-top-left-radius: 3px;
                border-top-right-radius: 3px;
                border-bottom-left-radius: 3px;
                border-bottom-right-radius: 3px;
                text-align: center;
            }
            
            .form input {
                outline: 0;
                background: #F2F2F2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                border-top-left-radius: 3px;
                border-top-right-radius: 3px;
                border-bottom-left-radius: 3px;
                border-bottom-right-radius: 3px;
                box-sizing: border-box;
                font-size: 14px;
            }
            
            #subButton {
                outline: 0;
                background: #01b4d1;
                width: 100%;
                border: 0;
                padding: 15px;
                border-top-left-radius: 3px;
                border-top-right-radius: 3px;
                border-bottom-left-radius: 3px;
                border-bottom-right-radius: 3px;
                color: #FFFFFF;
                font-size: 14px;
                cursor: pointer;
            }
            
            .form .message {
                margin: 15px 0 0;
                color: #B3B3B3;
                font-size: 12px;
            }
            
            .form .message a {
                color: #01b4d1;
                text-decoration: none;
            }
        </style>
        
        <script>
            function checkForm() {
                var flag = true;
                var passwordValue = document.getElementById("password").value;
                var repasswordValue = document.getElementById("repassword").value;

                
                if(checkPassword(passwordValue) == false) {
                    alert("密码是包含大小写字母下划线或减号的6-16位字符");
                    flag = false;
                }

                if(repasswordValue != passwordValue) {
                    alert("Error: The passwords you entered do not match. Please re-enter!");
                    flag = false;
                }
                return flag;
            }

            
            function checkPassword(passwordValue) {
                var passwordRep = /^[a-zA-Z0-9_-]{6,16}$/;  //密码是包含大小写字母下划线或减号的6-16位字符
                return passwordRep.test(passwordValue);
            }

            
        </script>
        <script src="/js/jquery.min.js"></script>
        <script type="text/javascript" src="/js/jquery.cookie.js"></script>
        <script type="text/javascript">
            $(function () {
                var username=$.cookie("TT_TOKEN");
                var edithref='/rest/UserInformation/edit/'+username;
                $('#editbutton').attr('href',edithref);

                $('#oldpass').blur(function () {
                    var oldpass=document.getElementById("oldpass").value;
                    $.ajax({
                        url:'/rest/UserInformation/checkPass',
                        type:'POST',
                        data:JSON.stringify({password:oldpass}),
                        dataType:'json',
                        contentType: 'application/json; charset=utf-8',
                        statusCode:{
                            201:function(){
                            },
                            404:function(){
                                alert("原密码错误，请重新输入！！！");
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
    
    <body scroll='no' style="overflow-x: hidden">
    <div id="Profle">
        <img id="ProfleIMG" src="/img/profle.png" />
        <div></div>
        <a href="/rest/front/index" > <img id="home" src="/img/home.png" /></a>
        <h3 style="display:inline;margin-right:24px" > ${user.username} </h3>
    </div>
        
        <div class="form">
            <h3> 修改密码</h3>
            <form class="register-form" action="/rest/UserInformation/updatePass" method="post" onsubmit="return checkForm()">
				<input type="password" id="oldpass" name="oldpass" placeholder="请输入原密码" required/>
                <input type="password" id="password" name="password" placeholder="请输入新密码" required/>
                <input type="password" id="repassword" name="repassword" placeholder="再次输入新密码" required/>
				<input type="submit" id="subButton" value="Submit">
                <p class="message"> <a href="" id="editbutton"> 修改绑定信息 </a> </p>
            </form>
        </div>
    </body>
</html>