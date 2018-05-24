<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>数码在线回收</title>
	<link rel="stylesheet" type="text/css" href="/css/products.css">
</head>
<body>
	<div class="nav clearfix">
				<div class="w">
					<img class="logo" src="/img/Logo4.png"></img>
					<span>数码在线回收</span>
					<ul>
						<li><a href="/rest/front/index">首页</a></li>
						<li><a href="">商城</a></li>
						<li><a href="">导航</a>
							<div class="navbar">
								<div class="nav-bar"/>
									<!-- 一级链接 -->
								<div class="nav-bar-bottom">
									<!-- 二级链接 -->
								</div>
							</div>
						</li>
						<li><a href="">关于</a></li>
					</ul>
					<div class="login">
						<a href="/rest/page/loginAndRegister">登陆/注册</a>
						<a href="">回收车</a>
						<div class="num">0</div>
					</div>
					<!-- 搜索 -->
						<div class="search">
							<input type="text" name="search" id="search" placeholder="回收各种手机">
							<div class="searchimg">111</div>
						</div>
					<!--搜索结束-->
					</div>
				</div>
	</div>
	<!-- nav end -->
	<div class="content">
		<form action="#" method="post">
			<div class="products">
				<div class="left">
					<img src="${image}" alt="产品图片" >
				</div>
				<div class="right">
					<dl class="memory clearfix">
						<dt class="selkind">
							<span>基本信息</span>
							<span id="price">选定的价格</span>
							<i>修改</i>
						</dt>
						<dd>
							<ul class="memorykind items">
								<!-- <li data-value="16G">16G</li>
								<li data-value="32G">32G</li>
								<li data-value="64G">64G</li> -->
							</ul>
						</dd>
					</dl>
					<dl class="screen">
						<h2>使用情况</h2>
						<dt class="scrkind">
							<span>边框背板</span>
							<span id="usescr">边框背板</span>
							<i>修改</i>
						</dt>
						<dd>
							<ul class="screenkind use">
								<li data-value="85" data-text="外壳完美，无任何使用痕迹">外壳完美，无任何使用痕迹</li>
								<li data-value="80" data-text="外壳有轻微使用痕迹">外壳有轻微使用痕迹</li>
								<li data-value="75" data-text="外壳有轻微掉漆，磕碰">外壳有轻微掉漆，磕碰</li>
								<li data-value="90" data-text="全新机，包装配件齐全未使用">全新机，包装配件齐全未使用</li>
							</ul>
						</dd>
					</dl>
					<dl class="sborder">
						<dt class="borkind">
							<span>屏幕外观</span>
							<span id="useborder">屏幕外观</span>
							<i>修改</i>
						</dt>
						<dd>
							<ul class="borderkind use">
								<li data-value="90">屏幕完美，无任何划痕</li>
								<li data-value="85">屏幕有轻微划痕</li>
								<li data-value="80">屏幕有缺角/碎裂</li>
								<li data-value="75">屏幕严重裂缝</li>
							</ul>
						</dd>
					</dl>
					<dl class="surface">
						<dt class="surkind">
							<span>屏幕显示</span>
							<span id="usesurface">屏幕显示</span>
							<i>修改</i>
						</dt>
						<dd>
							<ul class="surfacekind use">
								<li data-value="90">显示完美，无任何异常</li>
								<li data-value="85">不影响使用，但有色差/亮坏点/色斑</li>
								<li data-value="80">显示异常，有漏液/错乱/严重老化</li>
								<li data-value="75">屏幕无法显示</li>
							</ul>
						</dd>
					</dl>
					<dl class="service">
						<dt class="serkind">
							<span>维修情况</span>
							<span id="useservice">维修情况</span>
							<i>修改</i>
						</dt>
						<dd>
							<ul class="servicekind use">
								<li data-value="90">无维修情况</li>
								<li data-value="85">屏幕维修</li>
								<li data-value="80">主板维修/多处维修痕迹</li>
								<li data-value="75">屏幕和主板均有维修</li>
							</ul>
						</dd>
					</dl>
					<div class="evalue" id="btn-sumbit">
						立即询价！
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src='/js/template-native.js'></script>
<%--<script type="text/javascript" src="/js/products.js"></script>--%>

<script>
	var startPrice = "";
    var memory = ""; //内存
    var screen = ""; //屏幕外观
    var border = ""; //边框
    var face = "";   //屏幕显示
    var services = ""; //维修
    var firstPercent = "";
    var screentext="";
    var bordertext="";
    var facetext="";
    var servicetext="";
    $(function () {
        //手机版本
        var liStr = '';
        <c:forEach items="${itemCatDescs}" var="i">
        	console.log("${i.version}");
            var items = "${i.version}";
            var price = "${i.price}";
                liStr +='<li class="items" data-price="'+price+'" data-value="'+items+'">'+items+'</li>';
                console.log(liStr);
        </c:forEach>
        $('.items').append(liStr);
        $('.selkind i').click(function(){
            $('.memory').removeClass('selected');
        })
        $('.scrkind i').click(function(){
            $('.screen').removeClass('selected');
        })
        $('.borkind i').click(function(){
            $('.sborder').removeClass('selected');
        })
        $('.surkind i').click(function(){
            $('.surface').removeClass('selected');
        })
        $('.serkind i').click(function(){
            $('.service').removeClass('selected');
        })
        /*$('.memorykind li')[0].onclick = function(){
            $('.memory').addClass('selected');
            var data = this.getAttribute('data-value');
            strdata += data;
            $('#price').text(data);
        }*/
        function move(){
            var forItems = 0;
            <c:forEach items="${itemCatDescs}" var="i">
			 	forItems++;
            </c:forEach>
			for(var i=0;i<forItems;i++){
                $('.memorykind li')[i].onclick = function(){
                    $('.memory').addClass('selected');
                    var data = this.getAttribute('data-value');
                    var price = this.getAttribute('data-price');
                    startPrice = price;
                    memory = data;
                    $('#price').text(data);
                    $('.screen').addClass('finish');
                }
            }
        }

        function movesborder(){
            for(var i=0;i<4;i++){
                $('.borderkind li')[i].onclick = function(){
                    $('.sborder').addClass('selected');
                    var data = this.getAttribute('data-value');
                    var text = this.textContent;
                    bordertext = text;
                    border = data;
                    $('#useborder').text(text);
                    $('.surface').addClass('finish');
                }
            }
        }

        function movescreen(){
            for(var i=0;i<4;i++){
                $('.screenkind li')[i].onclick = function(){
                    $('.screen').addClass('selected');
                    var data = this.getAttribute('data-value');
                    var firper = this.getAttribute('data-value');
                    var text = this.textContent;
                    screentext = text;
                    firstPercent = firper;
                    screen = data;
                    console.log(firper);
                    $('#usescr').text(text);
                    $('.sborder').addClass('finish');
                }
            }
        }

        function movesurface(){
            for(var i=0;i<4;i++){
                $('.surfacekind li')[i].onclick = function(){
                    $('.surface').addClass('selected');
                    var data = this.getAttribute('data-value');
                    var text = this.textContent;
                    facetext = text;
                    face = data;
                    $('#usesurface').text(text);
                    $('.service').addClass('finish');
                }
            }
        }
        function moveservice(){
            for(var i=0;i<4;i++){
                $('.servicekind li')[i].onclick = function(){
                    $('.service').addClass('selected');
                    var data = this.getAttribute('data-value');
                    var text = this.textContent;
                    servicetext = text;
                    services = data;
                    $('#useservice').text(text);
                    $('.evalue').css('display','block');
                    // $('.service').addClass('finish');
                }
            }
        }
        $('#btn-sumbit').click(function(){
            var itemDesc="版本："+memory+"屏幕外观:"+screentext+"边框背板:"+bordertext+"屏幕显示:"+facetext+"维修情况:"+servicetext;
            $.ajax({
                url:'/rest/condition/evaluate',
                type:'POST',
                data:JSON.stringify({startPrice:startPrice,screen:screen,border:border,face:face,services:services}),
                dataType:'json',
                contentType: 'application/json; charset=utf-8',
                statusCode:{
                    200:function(data){
                        window.sessionStorage.setItem("data",data);
                        window.sessionStorage.setItem("itemCatId",${itemCatId});
                        window.sessionStorage.setItem("itemName","${itemName}");
                        window.sessionStorage.setItem("itemDesc",itemDesc);
                       	$(location).attr('href', '/rest/page/evaluate');//跳转到评估结果页面
                    },
                    500:function(){
                        $(location).attr('href', '/rest/page/failed');
                    },
                    400:function(){
                        $(location).attr('href', '/rest/page/failed');
                    }
                }
            })
        })
		move();
        movescreen();
        movesborder();
        movesurface();
        moveservice();
    })

</script>
<%--<script type="text/template" id='template'>
<% for(var i=0;i<items.length;i++){%>
         <li class="items" data-value="<%=items[i].text%>"><%=items[i].text%></li>
<%}%>
</script>--%>

</html>