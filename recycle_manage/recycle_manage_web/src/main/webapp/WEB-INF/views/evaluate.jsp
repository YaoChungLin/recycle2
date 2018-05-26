<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<style type="text/css">
		*{
			padding:0px;
			margin:0px;
		}
		body{
			background-color:#F8F8F8;
		}
		.clearfix {zoom:1;}
		.clearfix:after {
	    clear:both;
	    content:'';
	    display:block;
	    width: 0;
	    height: 0;
	    visibility:hidden;
		}
		.left-pic,.right-price{
			padding:15px;
			float:left;
		}
		.left-pic{
			width:300px;
			height:550px;
			background:#fff;
			margin-left:160px;
		}
		.right-price{
			width:680px;
			height:550px;
			background:#fff;
			margin-left:30px;
		}
		.right-price dt{
			margin:30px 0;
			color:black;
		}
		.right-price dd h1{
			color:#FF3737;
		}
		.phoneData{
			margin:30px 0;
		}
		.money,.revalue{
			width:130px;
			height:40px;
			float:left;
			margin-left:15px;
			text-align:center;
			font:16px/40px "微软雅黑";
			cursor:pointer;
		}
		.money{
			background:#FF3737;
			color:#fff;
		}
		.revalue{
			background:#fff;
			color:#FF3737;
			border:1px solid #FF3737;
		}
		.long{
			margin-top:30px;
			width:500px;
			height:20px;
			background:#ccc;
		}
	</style>
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script>
		$(function(){
		    //获取products页面传过来的session值
            var evaluatePrice=window.sessionStorage.getItem("data");
            var itemCatId=window.sessionStorage.getItem("itemCatId");
            //把评估价显示到界面
            $('.titleValue').text(evaluatePrice);

            $("#btn-money").click(function () {
                $(location).attr('href', '/rest/information/write');//跳转到评估结果页面
            })

            $("#btn-evaluate").click(function () {
                $(location).attr('href', '/rest/products/'+itemCatId+'.html');//跳转到评估页面
            })
		})


	</script>
</head>
<body>
	<div class="content">
		<div class="left-pic">
			<img src="">
		</div>
		<div class="right-price">
			<dl>
				<dt>评估报价</dt>
				<dd><h1 class="titleValue">￥</h1></dd>
			</dl>
			<p class="phoneData" id="phoneData">机子参数</p>
			<div class="clearfix">
				<div class="money" id="btn-money">立即变现</div>
				<div class="revalue" id="btn-evaluate">重新评价</div>
			</div>
			<div class="long">动态长条显示，有待二次开发</div>
		</div>
	</div>
</body>
</html>