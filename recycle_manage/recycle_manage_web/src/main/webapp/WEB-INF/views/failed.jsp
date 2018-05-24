<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>页面出错</title>

	<link rel="stylesheet" href="/css/failedstyle.css" />
	
</head>
<body>


	<nav class="shelf">
	  <a class="book home-page" href="/rest/front/index" style="text-decoration: none">首页</a>
	  <a class="book about-us">关于我们</a>
	  <a class="book contact">联系我们</a>
	  <a class="book faq">F.A.Q.</a>
	  
	  <span class="book not-found"></span>
	 
	  <span class="door left"></span>
	  <span class="door right"></span>
	</nav>
	<h1>Error</h1>
	<p>${msg}</p>
	
</body>
</html>