<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>数码在线回收</title>
	<link rel="stylesheet" href="/css/indexcss.css">
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.fullPage.min.js"></script>
</head>
<body>
	<!-- nav star -->
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
									<ul>
										<a href=""><li class="navlia">手机</li></a>
										<a href="">										<li class="navlia">平板</li></a>
										<a href="">										<li class="navlia">电脑</li></a>
										<a href="">										<li class="navlia">摄影</li></a>
									</ul>
								</div>
								<div class="navbar-second"></div>
								<div class="navbar-third"></div>
							</div>
							<!-- <div class="navbar">
								<div class="nav-bar">
									<div class="items">
									</div>
							</div> -->
						</li>
						<li><a class="lia" href="">关于</a></li>
						</form>
					</ul>
					<div class="login">
						<a href="" class="register cart">登陆/注册</a>
						<div class="loginName"><label></label><a href="javascript:void(0);">注销</a></div>
						<a href="" class="cart">回收车</a>
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
	<div class="fullPage">
		<!-- first Page-->
		<div class="section first">
			<div class="warp">
				<div class="slide" id="slide">
					<ul>
						<li><img src="/img/slidepic1.jpg"></li>
						<li><img src="/img/slidepic2.jpg"></li>
						<li><img src="/img/slidepic3.jpg"></li>
						<li><img src="/img/slidepic4.jpg"></li>
						<li><img src="/img/slidepic5.jpg"></li>
					</ul>
					<div class="arrow" id="arrow">
						<a class="prev" id="prev" href="javascript:;"><</a>
						<a class="next" id="next" href="javascript:;">></a>
					</div>
					<div class="lapse">
						<div class="jt">
							<div class="jtforto">
								◇
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- second Page -->
		<div class="section second">
			<div class="warp">
				<div class="slide">
					<img class="firpic" src="/img/1.png"></img>
					<img class="secpic" src="/img/2.png"></img>
					<img class="thrpic" src="/img/3.png"></img>
					<img class="forpic" src="/img/4.png"></img>
				</div>
				<div class="text">
					<img src="/img/安.png" alt="安"></img>
					<img src="/img/全.png" alt="全"></img>
					<img src="/img/高.png" alt="高"></img>
					<img src="/img/效.png" alt="效"></img>
					<img src="/img/信.png" alt="信"></img>
					<img src="/img/赖.png" alt="赖"></img>
				</div>
				<a href="">马上体验>>></a>
				<div class="seclapse">
						<div class="jt">
							<div class="jtforto">
								◇
							</div>
						</div>
					</div>
			</div>
		</div>
		<!-- third Page -->
		<div class="section third">
			<div class="thrpage">
				<div class="thrleft"></div>
				<div class="thrrigth">
					<div class="right-first"><img src="/img/slidepic2.jpg" alt="占位">
						<div class="desc">便宜点100卖你了</div>
					</div>
					<div class="right-second"><img src="/img/slidepic2.jpg" alt="占位">
						<div class="desc">占位</div>
					</div>
					<div class="right-third"><img src="/img/slidepic2.jpg" alt="占位">
						<div class="desc">占位</div>
					</div>
					<div class="right-forth"><img src="/img/slidepic2.jpg" alt="占位">
						<div class="desc">占位</div>
					</div>
					<div class="right-fifth"><img src="/img/slidepic2.jpg" alt="占位">
						<div class="desc">占位</div>
					</div>
					<div class="right-sixth"><img src="/img/slidepic2.jpg" alt="占位">
						<div class="desc">占位</div>
					</div>
				</div>
			</div>
		</div>
		<!-- fourth Page -->
		<div class="section fourth">
			<!-- <div class="fallball">
				
			</div> -->
			<div class="fourpage">
				<div class="title"></div>
				<img src="/img/快递.png">
				<img src="/img/短信.png">
				<img src="/img/打款.png">
				<div class="backtop">
					<<!-- ul id="menu">
						<li data-menuanchor="page1"><a href="#page1"></a></li>
						<li data-menuanchor="page2"><a href="#page2"></a></li>
						<li data-menuanchor="page3"><a href="#page3"></a></li>
					</ul> -->
				</div>
			</div>
		</div>
	</div>
	<!-- <script type="text/javascript"> 
		
		$('#search').mouseout(function(){
			$('#search').animate({
				width:'-150px',
				opacity:'0'
			},function(){
				$('#search').css({'display':'none','opacity':1});
			})	
		})
	</script> -->
</body>
</html>
<script type="text/javascript" src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/template-native.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<script>

	$(function () {
		var username=$.cookie("TT_TOKEN");
		checkName(username);

		$('.loginName label').click(function(){
			//跳转到个人页面
		})
		$('.loginName a').click(function(){
			/*注销cookie*/
		// username=$.cookie("TT_TOKEN",null);
		// checkName(username);
		})
		$('.navbar').parent().mouseover(function(){
			$('.navbar').css('display','block');
		})
		$('.navbar').parent().mouseout(function(){
			$('.nav-second').css('display','none');
			$('.nav-third').css('display','none');
			$('.navbar').css('display','none');
		})
		$('.navbar').mouseout(function(){
			$('.nav-second').css('display','none');
			$('.nav-third').css('display','none');
			$('.navbar').css('display','none');
		})
		function navshow(){
			for(var i=0;i<4;i++){
				$('.navbar-first li')[i].onmouseover = function(){
					//$('.navbar-second').css('display','block');
					$('.navbar-second').slideDown();
					var thisTest = $(this).text();
					$('.navbar-second').children().remove();
					console.log(thisTest);
					var htmlStr = "";
					var bianlian = "小米"; //变量示例
					/*从这里循环变量放入*/
					var length = 5;//变量长度
					for(var i=0;i<length;i++){ //变量长度length
						htmlStr +='<a href="">'+bianlian+'</a>';
					}
					$('.navbar-second').append(htmlStr);
					/*结束*/
					navtshow(length);//参数是循环的变量i
				}
			}
		}
		function navtshow(length){
			for(var i=0;i<length;i++){
				$('.navbar-second a')[i].onmouseover = function(){
					$('.navbar-third').slideDown();
					var thisTest = $(this).text();
					$('.navbar-third').children().remove();
					console.log(thisTest);
					var htmlStr = "";
					var bianlian = "小米4c"; //变量示例
					/*从这里循环变量放入*/
					for(var i=0;i<5;i++){
						htmlStr +='<a href="">'+bianlian+'</a>';
					}
					$('.navbar-third').append(htmlStr);
					/*结束*/
				}
			}
		}
		function checkName(name){
			if(name =="" ||name ==undefined){
			
			$('.loginName').css('display','none');
			$('.register').css('display','block');
		}else{
			$('.loginName').css('display','block').children('label').text(name);
			$('.register').css('display','none');
		}
		}
		navshow();
	   <%--/* //一级类目--%>
	    <%--<c:forEach items="${itemCatResult.itemCats}" var="i">--%>
			<%--console.log("${i.name}"+"${i.url}");--%>
		<%--</c:forEach>--%>

		<%--console.log("-------------");--%>

		<%--//二级类目(手机)--%>
			<%--<c:forEach items="${itemCatResult.itemCats[0].items}" var="j">--%>
       			 <%--console.log("${j}");--%>
			<%--</c:forEach>--%>

        <%--console.log("-------------");--%>

        <%--//三级类目(手机中的苹果)--%>
        <%--<c:forEach items="${itemCatResult.itemCats[0].items[0]}" var="k">--%>
        		<%--console.log("${k}");--%>
        <%--</c:forEach>*/--%>
    })

</script>


<%--<script type="text/template" id='template-first'>
	<% for(var i=0;i<data.length;i++){%>
        <a href="<%=data[i].u%>" class="items" data-value="<%=data[i].n%>"><%=data[i].n%><div class="nav-bar-bottom"></div></a>
	<%}%>
</script>
<!-- <script type="text/template" id='template-first'>
	<% for(var i=0;i<items.length;i++){
	 for(var j=0;i<items[i].city[i].area.length;j++){ %>
        <a hred="<%=items[i].path%>" class="items" data-value="<%=items[i].name%>"><%=items[i].name%><div class="nav-bar-bottom"><%=items[i].city[i].area[j]%></div></a>
        <%}
	}%>
</script> -->
<script type="text/template" id='template-second'>
	<% for(var i=0;i<items.length;i++){%>
        <a href="<%=items[i].u%>" class="item"   data-value="<%=items[i].n%>"><%=items[i].n%><div class="nav-bar-bottom-bottom"></div></a>
	<%}%>
</script>--%>

