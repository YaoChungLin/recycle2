<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>数码在线回收</title>
	<link rel="stylesheet" type="text/css" href="/css/information.css">
</head>
<body>
	<div class="nav">
				<div class="w clearfix">
					<img class="logo" src="/img/logo3.png"></img>
					<span>测试用语</span>
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
	<div class="information">
		<div class="ifm-content">
			<form action="#" method="post">
				<%--<div class="sendKind">
					<label>快递类型</label>
					<ul>
						<li>快递类型1</li>
						<li>快递类型2</li>
						<li>快递类型3</li>
					</ul>
				</div>--%>
				<div class="sendAdress">
					<h3>请填写您的地址信息</h3>
					<%--<div class="adress">
						<div class="selectAdress">
							<div id="sAdress">选择省/市/区</div>
							<div class="wrong">请选择地址！</div>
							<span class="down"></span>
						</div>

						
						<div class="select-area hide">
							<div class="area-top">
								<ul>
									<li class="active " id="province">省</li>
									<li class="active none" id="city">市</li>
									<li class="active none" id="qu">区</li>
								</ul>
							</div>
							<div class="area-content">
								<ul class="items">
								</ul>
							</div>
						</div>
					</div>--%>
					<div id="element_id"  data-required="true">
						<select class="province" ></select>
						<select class="city"></select>
						<select class="area"></select>
					</div>

					<input class="detialsAdress" name="dAdress" type="text" placeholder="请填写您详细的地址" required></input>
					<label class="wrong">请填写具体地址</label>
					<p>预约时间</p>
					<input type="date" name="date" class='sendTime'>
					<label class="wrong">请选择预约时间!</label>
				</div>
				<div class="sendIfm">
					<label>收款人</label>
					<input type="text" name="name" required>
					<div class="wrongMessage">请输入收款人！</div>
					<label>手机号码</label>
					<input type="text" name="phone" required>
					<div class="wrongMessage">请输入电话号码！</div>
				</div>
				<div class="btn-submit">
					提交订单
				</div>
				<span>提交订单表示您同意<a href="#">《数码在线回收条款》</a></span>
			</form>
		</div>		
	</div>
	<div class="right-pic">此处应有图片</div>
	<div class="bottom">此处有待二期开发</div>
</body>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script src="/js/jquery.cxselect.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<%--<script type="text/javascript" src="/js/template-native.js"></script>--%>
<script type="text/javascript" src="/js/information.js"></script>
<script>

	$(function () {
        $('#element_id').cxSelect({
            url: '/js/cityData.min.json',               // 提示：如果服务器不支持 .json 类型文件，请将文件改为 .js 文件
            selects: ['province', 'city', 'area'],  // selects 为数组形式，请注意顺序
            emptyStyle: 'none'
        });


    })

</script>

<%--<script type="text/template" id="template">
	<% for(var i=0;i<items.length;i++){%>
		<li class="items" data-value="<%=items[i].name%>"><%=items[i].name%></li>
	<%}%>
</script>
<script type="text/template" id="template1">
	<% for(var i=0;i<items.length;i++){%>
		<li class="items" data-value="<%=items[i]%>"><%=items[i]%></li>
	<%}%>
</script>--%>

<!-- <script type="text/javascript">
	var PName="";
	var CName="";
	var QName="";
	var CData="";
	var Clength="";
	var QData="";
	var PData="";
	function Information(PName,CName,QName,detials,date,Name,phone){
		this.proName = PName;
		this.cityName = CName;
		this.quName = QName;
		this.detialsAdress = detials;
		this.time = date;
		this.name = Name;
		this.phoneNumber = phone;
	}
	$(function(){
		$('.selectAdress').click(function(){
			if($('.select-area').hasClass('hide')){
				$('.select-area').removeClass('hide');
				$('.sendAdress .adress span').removeClass('down').addClass('up');
				
				//bindArea();
				
				/*if(!$('#province').hasClass('selected')){
					proName=bindProvince();
				}else if(!$('#city').hasClass('selected')){
					cityName=bindCity(PName);
				}else if(!$('#qu').hasClass('selected')){
					bindQu(PName,CName);
					console.log(PName,CName);
				}*/
				//bindProvince();
				// bindCity();
				// bindQu();
				judge();
			}else{
				$('.select-area').addClass('hide');
				$('.sendAdress .adress span').removeClass('up').addClass('down');
			}
		})
		$.ajax({
					url:'info/province.json',
					type:'post',
					dataType:'json',
					success:function(data){
						//console.log(data.length);//数据测试
						//console.log(data[3].city);//数据测试
						var backObj = {
							items:data
						};
						PData = data;
						//console.log(backObj.items[0].name);
						var backStr = template('template',backObj);
						$('.items').append(backStr); 
						bindArea();
						//judge();
					}
				})
		function bindArea(){
			for(var i=0;i<3;i++){
			//	var index = $('.area-top li').index(this);
				$('.area-top li')[i].onclick = function(){
					console.log($(this).index());
					if($(this).index()===0){
						if(!$('#province').hasClass('.selected')){
							$('#province').removeClass('selected').nextAll().removeClass('selected').addClass('none');
							$('.items').children('li').remove();
						}
					}else if($(this).index()===1){
						if(!$('#city').hasClass('.selected')){
							$('#city').removeClass('selected').next().addClass('none');
						}
					}
					//bindProvince();
					judge();//判断函数
				}
			}
			/*$('area-top li').click(function(){
				console.log($(this).index());
				if(!$('.active').hasClass('.selected')){
						$('.active').removeClass('selected').next().addClass('none');
					}
					bindProvince();
			})*/
		}
		function bindProvince(){
			for(var i=0;i<32;i++){
				$('.area-content li')[i].onclick = function(){
					var proName = this.getAttribute('data-value');
					console.log(i);
					$('#province').text(proName).addClass('selected').next().removeClass('none');
					$('ul.items').children('li').remove();
					/*$.ajax({
								url:'info/province.json',
								type:'post',
								dataType:'json',
								success:function(data){
									var cityData="";
									for(var i=0;i<data.length;i++){
										for(var key in data[i]){
											if(data[i][key]==proName){
												cityData = data[i].city;
												CData = cityData;
											}
										}
									}
									var backObj = {
										items:cityData
									};
									//console.log(backObj.items[0].name);
									var backStr = template('template',backObj);
									$('.items').append(backStr); 
									bindCity(proName,cityData);
									//judge();
								}
							})*/
					//bindCity(proName);
					var cityData="";
					for(var i=0;i<PData.length;i++){
						for(var key in PData[i]){
							if(PData[i][key]==proName){
								cityData = PData[i].city;
								CData = cityData;
							}
						}
					}
					var backObj = {
						items:cityData
					};
					//console.log(backObj.items[0].name);
					var backStr = template('template',backObj);
					$('.items').append(backStr); 
					bindCity(proName,cityData);
					PName = proName;
				}
			}
		}
		function bindCity(proName,cityData){
			for(var i=0;i<cityData.length;i++){
				$('.area-content li')[i].onclick = function(){
					var cityName = this.getAttribute('data-value');
					var quData="";
					$('#city').text(cityName).addClass('selected').next().removeClass('none');
					$('ul.items').children('li').remove();
					for(var k=0;k<i;k++){
						for(var key in cityData[k]){
							if(cityData[k][key]==cityName){
								quData = cityData[k].area;
								QData = quData;
							}
						}
					}
					var backObj={
						items:quData
					};
					var backStr = template('template1',backObj);
					$('.items').append(backStr);
					bindQu(cityName,proName,backObj.items.length);
					Clength = backObj.items.length;
					CName = cityName;
				}
			}
		}
		function bindQu(cityName,proName,length){
			for(var i=0;i<length;i++){
				$('.area-content li')[i].onclick = function(){
					var quName = this.getAttribute('data-value');
					$('#qu').text(quName).next().removeClass('none');
					/* console.log(quName+cityName+proName);*/
					var address=proName+cityName+quName;
					QName = quName;
					$('.sendAdress .adress').css('width','220');
					$('#sAdress').text(address);
					$('.selectAdress').next().addClass('hide');
					$('.sendAdress .adress span').removeClass('up').addClass('down');
				}
			}
		}
		function judge(){
			if(!$('#province').hasClass('selected')){
					if($('.items').find('li').length==0){
						console.log('111');
						var backObj = {
							items:PData
						};
						var backStr = template('template',backObj);
						$('.items').append(backStr); 
						bindProvince();
					}else{
						bindProvince();
					}
				}else if(!$('#city').hasClass('selected')){
					$('.items').children('li').remove();
					var backObj = {
						items:CData
					};
					var backStr = template('template',backObj);
					$('.items').append(backStr); 
					bindCity(PName,CData);
				}else if(!$('#qu').hasClass('selected')){
					$('.items').children('li').remove();
					var backObj={
						items:QData
					};
					var backStr = template('template1',backObj);
					$('.items').append(backStr);
					bindQu(PName,CName,Clength);
					console.log(PName,CName,QName);
				}
		}
		$('input[name="date"]').change(function(){
            var myDate = new Date();  //获取当前时间对象，精确到当前的时、分、秒

            var this_time=$('input[name="date"]').val();//获取用户选择后的时间值

            var this_datetime=new Date(this_time);//获取用户选择的时间，生成时间对象  具体时间为时间8:00:00
            var year = myDate.getFullYear();    //获取当前时间的年份 格式xxxx 如：2016
            var month =myDate.getMonth()+1;     //获取当前时间的月份 格式1-9月为x， 10-12月为xx 如：11
            var date = myDate.getDate();        //获取当前时间的日期 格式同月份 如11
             myDate=new Date(year+'-'+month+'-'+date);  //获取根据上述时间生成的时间对象 具体时间为0:00:00  
            var now=new Date(year+'-'+month+'-'+date);
            myDate.setDate(now.getDate()+7); //设置now对象相应日期的七天前日期 具体时间为0:00:00
            console.log(myDate);
            if(this_datetime<=now||this_datetime>myDate){    //时间对象可以直接比较大小
                alert('拜访时间需选择今天及以前7天内的时间');
                $('input[name="date"]').val('');   
            };
         });
		$('input[name="name"]').blur(function(){
			if($('input[name="name"]').val()==''||$('input[name="name"]').val()==null){
				$('input[name="name"]').next().css('display','block');
			}else{
				$('input[name="name"]').next().css('display','none');
			}
		})
		$('input[name="phone"]').blur(function(){
			if($('input[name="phone"]').val()==''||$('input[name="phone"]').val()==null){
				$('input[name="phone"]').next().css('display','block');
			}else{
				$('input[name="phone"]').next().css('display','none');
			}
		})
		$('.btn-submit').click(function(){
			if(PName==null||PName==""){
				$('#sAdress').next().css('display','block');
				return false;
			}
			if($('input[name="dAdress"]').val()==''||$('input[name="dAdress"]').val()==null){
				console.log('1111');
				$('input[name="dAdress"]').next().css('display','block');
				return false;
			}
			if($('input[name="date"]').val()==''||$('input[name="date"]').val()==null){
				$('input[name="date"]').next().css('display','block');
				return false;
			}
			if($('input[name="name"]').val()==''||$('input[name="name"]').val()==null){
				$('input[name="name"]').next().css('display','block');
				return false;
			}
			if($('input[name="phone"]').val()==''||$('input[name="phone"]').val()==null){
				$('input[name="phone"]').next().css('display','block');
				return false;
			}
			var dAdress = $('input[name="dAdress"]').val();
			var date = $('input[name="date"]').val();
			var name = $('input[name="name"]').val();
			var phone = $('input[name="date"]').val();
			var ifm = new Information(PName,CName,QName,dAdress,date,name,phone);
			console.log(ifm);
			console.log(PName+CName+QName+dAdress+date+name+phone);
			var postData = JSON.stringify(ifm);
			$.ajax({
				url:'ifmTest.php',
				type:'post',
				data:{name:postData},
				dataType:'json',
				success:function(data){
					console.log("你好");
				}
			})
		});		
	})
</script> -->
</html>