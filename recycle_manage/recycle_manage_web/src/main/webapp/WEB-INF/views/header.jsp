<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/css/header.css">
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.fullPage.min.js"></script>
	<script type="text/javascript" src="/js/scroll.js"></script>
	<script type="text/javascript" src="/js/jquery.cookie.js"></script>
	<script>
       // var username=$.cookie("TT_TOKEN");

        $(function () {
            var username=$.cookie("TT_TOKEN");
            var datajson="";
            console.log(username);
            checkName(username);
            $.ajax({
                url:'/rest/front/api',
                type:'GET',
                dataType:'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success:function (itemCatResultString) {
                    datajson=$.parseJSON(itemCatResultString);
                    console.log(datajson);
                }
            })
           var data = datajson.data;
            console.log(data);
            $('.loginName label').click(function(){
                //跳转到个人页面
            })
            $('.loginName a').click(function(){
                /*注销cookie*/
                $.cookie("TT_TOKEN", "", {expires: -1});
                checkName();

                $.ajax({
                    url:'/rest/user/logout',
                    type:'POST',
                    data:JSON.stringify({username:username}),
                    dataType:'json',
                    contentType: 'application/json; charset=utf-8',
                    statusCode:{
                        201:function(data){
                            window.location.reload();
                        },
                        500:function(){
                            $(location).attr('href', '/rest/page/failed');
                        }
                    }
                })
            })
            $('.navbar').parent().mouseover(function(){
                $('.navbar').css('display','block');
            })
            $('.navbar').parent().mouseleave(function(){
                $('.navbar').css('display','none');
            })
            $('.navbar').mouseleave(function(){
                $('.navbar-second').css('display','none');
                $('.navbar-third').css("display","none");
                $('.navbar').css('display','none');
            })
            function navshow(data){
                for(var i=0;i<4;i++){
                    $('.navbar-first li')[i].onmouseover = function(){
                        //$('.navbar-second').css('display','block');
                        var index = $(this).index('.navbar-first li');
                        $('.navbar-second').css('display','none');
                        $('.navbar-third').css("display","none");
                        $('.navbar-second').slideDown();
                        var thisTest = $(this).text();
                        console.log(index);
                        var thisData="";
                        var thisLength="";
                        $('.navbar-second').children().remove();
                        console.log(thisTest);
                        var htmlStr = "";
                        if(thisTest ==data[index].n){
                            thisData = data[index].i;
                        }
                        for(k in thisData){
                            htmlStr +='<a href="'+thisData[k].u+'">'+thisData[k].n+'</a>';
                            thisLength++;
                        }
                        console.log(htmlStr);
                        console.log(thisLength);


                        var length = 5;//变量长度
                        // for(var i=0;i<length;i++){ //变量长度length
                        // 	htmlStr +='<a href="">'+bianlian+'</a>';
                        // }
                        $('.navbar-second').append(htmlStr);
                        /*结束*/
                        console.log(thisData);
                        navtshow(thisData,thisLength);//参数是循环的变量i

                    }
                }
            }
            function navtshow(data,length){
                for(var i=0;i<length;i++){
                    $('.navbar-second a')[i].onmouseover = function(){
                        $('.navbar-third').css("display","none");
                        $('.navbar-third').slideDown();
                        var thisTest = $(this).text();
                        var index = $(this).index('.navbar-second a');
                        var thisData ="";
                        $('.navbar-third').children().remove();
                        console.log(thisTest);
                        console.log(data);
                        var htmlStr = "";
                        console.log(index);
                        if(thisTest ==data[index].n){
                            thisData = data[index].i;
                        }
                        console.log(thisData);
                        var dataStr= "";
                        for(k in thisData){
                            dataStr = thisData[k];
                            var thisArr=dataStr.split('|');
                            console.log(thisArr);
                            htmlStr +='<a href="'+thisArr[0]+'">'+thisArr[1]+'</a>';
                        }

                        $('.navbar-third').append(htmlStr);
                    }
                }
            }
            function checkName(name){
                if(name =="" ||name ==undefined||name==null){

                    $('.loginName').css('display','none');
                    $('.register').css('display','block');
                }else{
                    $('.loginName').css('display','block').children('label').text(name);
                    $('.register').css('display','none');
                }
            }
            navshow(data);
        })

	</script>
</head>
<body>
	<div class="nav">
				<div class="w">
					<img class="logo" src="/img/Logo4.png"></img>
					<span>数码在线回收</span>
					<ul class="ter">
						<form action="#" method="post">
						<li><a class="lia" href="/rest/front/index">首页</a></li>
						<li><a class="lia" href="">商城</a></li>
						<li><a class="lia" href="">导航</a>
							<div class="navbar">
								<div class="navbar-first">
									<div class="navbar-first">
										<ul>
											<a href=""><li class="navlia">手机</li></a>
											<a href=""><li class="navlia">平板电脑</li></a>
											<a href=""><li class="navlia">笔记本</li></a>
											<a href=""><li class="navlia">摄影摄像</li></a>
										</ul>
									</div>
									<div class="navbar-second"></div>
									<div class="navbar-third"></div>
							</div>
							<!-- <div class="navbar">
								<div class="nav-bar">
									<div class="items">
									</div>
									二级链接
								
							</div> -->
						</li>
						<li><a class="lia" href="">关于</a></li>
						</form>
					</ul>
					<div class="login">
						<a href="/rest/page/loginAndRegister" class="register cart">登陆/注册</a>
						<div class="loginName"><label></label><a class="logout" href="javascript:void(0);">注销</a></div>
						<a href="" class="cart">回收车</a>
						<div class="num">0</div>
					</div>
					<!-- 搜索 -->
						<div class="search">
							<input type="text" name="search" id="search" placeholder="回收各种手机">
							<%--<div class="searchimg">111</div>--%>
						</div>
					<!--搜索结束-->
					</div>
				</div>
	</div>
	<!-- nav end -->
</body>

</html>