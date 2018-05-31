<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> 修改个人信息 </title>
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
                background: #EF3B3A;
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
                color: #EF3B3A;
                text-decoration: none;
            }
        </style>
        
        <script>
            function checkForm() {
                var flag = true;
                var usernameValue = document.getElementById("username").value;
                var passwordValue = document.getElementById("password").value;
                var repasswordValue = document.getElementById("repassword").value;
                var telValue = document.getElementById("tel").value;
//				var emailValue = document.getElementById("email").value;
                
                if(repasswordValue != passwordValue) {
                    alert("Error: The passwords you entered do not match. Please re-enter!");
                    flag = false;
                }
                
                if(checkUsername(usernameValue) == false) {
                    alert("用户名是以字母开头，包含大小写字母下划线或减号的4-16位字符");
                    flag = false;
                }
                
                if(checkPassword(passwordValue) == false) {
                    alert("密码是包含大小写字母下划线或减号的6-16位字符");
                    flag = false;
                }
                
                if(checkTel(telValue) == false) {
                    alert("请输入正确的手机号码");
                    flag = false;
                }
                    
                return flag;
            }
            
            function checkUsername(usernameValue) {
                var usernameRep = /^[a-zA-Z][a-zA-Z0-9_-]{3,15}$/;  //用户名是以字母开头，包含大小写字母下划线和减号的4-16位字符
                return usernameRep.test(usernameValue);
            }
            
            function checkPassword(passwordValue) {
                var passwordRep = /^[a-zA-Z0-9_-]{6,16}$/;  //密码是包含大小写字母下划线或减号的6-16位字符
                return passwordRep.test(passwordValue);
            }
            
            function checkTel(telValue) {
                var telRep = /^1(3[0-9]|47|5((?!4)[0-9])|7(0|1|[6-8])|8[0-9])\d{8,8}$/;
                return telRep.test(telValue);
            } 
            
        </script>
    </head>
    
    <body scroll='no' style="overflow-x: hidden">        
        <div id="Profle">
            <img id="ProfleIMG" src="/img/profle.png" />
            <h3> ID: 1234567890 </h3>
        </div>
        
        <div class="form">
            <h3> 修改绑定信息 </h3>
            <form class="register-form" action="#" method="get" onsubmit="return checkForm()">
<!--				<input type="text" id="username" placeholder="Username" required/>-->
<!--                <input type="password" id="password" placeholder="Password" required/>-->
<!--                <input type="password" id="repassword" placeholder="Confirm Password" required/>-->
                <input type="tel" id="tel" placeholder="Tel" required/>
                <input type="email" id="email" placeholder="E-mail" required/>
				<input type="submit" id="subButton" value="Submit">
                <p class="message"> <a href="/rest/page/EditPassword"> 修改密码 </a> </p>
            </form>
        </div>
    </body>
</html>