<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>成功</title>
        <meta http-equiv="refresh" content="3;url=/rest/front/index">
        <style>
            body {
                background-attachment: fixed;
                background-image: url(/img/succeedbg.png);
                background-repeat: no-repeat;
                background-size: 100% 100%;
            }
            p {
                color: aliceblue;
                text-align: center;
            }
            
        </style>
    </head>
    
    <body>
        <div style="margin-top: 13%">
            <p><img src="/img/succeedicon.png" /></p>
        </div>
        <div style="margin-top: 5%">
            <p>${msg}成功，页面即将跳转</p>
        </div>
    </body>
</html>