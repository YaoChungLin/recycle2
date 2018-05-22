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
					<img class="logo" src="/img/logo3.png"></img>
					<span>测试用语</span>
					<ul class="ter">
						<form action="#" method="post">
						<li><a class="lia" href="/rest/front/index">首页</a></li>
						<li><a class="lia" href="">商城</a></li>
						<li><a class="lia" href="">导航</a>
							<div class="navbar">
								<div class="nav-bar">
									<div class="items">
									</div>
									<!-- 二级链接 -->
								
							</div>
						</li>
						<li><a class="lia" href="">关于</a></li>
						</form>
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
					<img class="firpic" src="/img/slidepic1.jpg"></img>
					<img class="secpic" src="/img/slidepic1.jpg"></img>
					<img class="thrpic" src="/img/slidepic1.jpg"></img>
					<img class="forpic" src="/img/slidepic1.jpg"></img>
				</div>
				<div class="text">
					<img src="/img/slidepic2.jpg" alt="占位">
					<img src="/img/slidepic2.jpg" alt="占位">
					<img src="/img/slidepic2.jpg" alt="占位">
					<img src="/img/slidepic2.jpg" alt="占位">
					<img src="/img/slidepic2.jpg" alt="占位">
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
				<img src="/img/slidepic2.jpg">
				<img src="/img/slidepic2.jpg">
				<img src="/img/slidepic2.jpg">
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

<script>
	$(function () {
	    //一级类目
	    <c:forEach items="${itemCatResult.itemCats}" var="i">
			console.log("${i.name}"+"${i.url}");
		</c:forEach>

		console.log("-------------");

		//二级类目(手机)
			<c:forEach items="${itemCatResult.itemCats[0].items}" var="j">
       			 console.log("${j}");
			</c:forEach>

        console.log("-------------");

        //三级类目(手机中的苹果)
        <c:forEach items="${itemCatResult.itemCats[0].items[0]}" var="k">
        		console.log("${k}");
        </c:forEach>
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

