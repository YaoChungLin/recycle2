var PName="";
	var CName="";
	var QName="";
	var CData="";
	var Clength="";
	var QData="";
	var PData="";
	// function Information(PName,CName,QName,detials,date,Name,phone){
	// 	this.proName = PName;
	// 	this.cityName = CName;
	// 	this.quName = QName;
	// 	this.detialsAdress = detials;
	// 	this.time = date;
	// 	this.name = Name;
	// 	this.phoneNumber = phone;
	// }
	$(function(){
		$('.selectAdress').click(function(){
			if($('.select-area').hasClass('hide')){
				$('.select-area').removeClass('hide');
				$('.sendAdress .adress span').removeClass('down').addClass('up');
				judge();
			}else{
				$('.select-area').addClass('hide');
				$('.sendAdress .adress span').removeClass('up').addClass('down');
			}
		})
/*		$.ajax({
					url:'info/province.json',
					type:'post',
					dataType:'json',
					success:function(data){
						var secData="";
						var backObj = {
							items:data
						};
						PData = data;
						var backStr = template('template',backObj);
						$('.items').append(backStr); 
						bindArea();
					}
				})*/
		function bindArea(){
			for(var i=0;i<3;i++){
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
					judge();//判断函数
				}
			}
		}
		function bindProvince(){
			for(var i=0;i<32;i++){
				$('.area-content li')[i].onclick = function(){
					var proName = this.getAttribute('data-value');
					console.log(i);
					$('#province').text(proName).addClass('selected').next().removeClass('none');
					$('ul.items').children('li').remove();
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
					// var backStr = template('template1',backObj);
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
			/*if(PName==null||PName==""){
				$('#sAdress').next().css('display','block');
				return false;
			}*/
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
			var province = $('.province option:selected').text();
            var city = $('.city option:selected').text();
            var area = $('.area option:selected').text();
			var dAdress = $('input[name="dAdress"]').val();
			var date = $('input[name="date"]').val();
			var name = $('input[name="name"]').val();
			var phone = $('input[name="phone"]').val();
            //获取products页面传过来的session值
            var evaluatePrice=window.sessionStorage.getItem("data");
            var itemDesc=window.sessionStorage.getItem("itemDesc");
            var itemCatId=window.sessionStorage.getItem("itemCatId");
            var itemName=window.sessionStorage.getItem("itemName");


            $.ajax({
                url:'/rest/order',
                type:'POST',
                data:JSON.stringify({receiver_name:name,receiver_phone:phone,receiver_state:province,receiver_city:city,receiver_district:area,receiver_address:dAdress,bookdate:date,item_cat:itemCatId,item_name:itemName,item_desc:itemDesc,item_recycle_price:evaluatePrice}),
                dataType:'json',
                contentType: 'application/json; charset=utf-8',
                statusCode:{
                    201:function(data){
                        $(location).attr('href', '/rest/page/succeed');
                    },
                    500:function(){
                        $(location).attr('href', '/rest/page/failed');
                    },
                    400:function(){
                        $(location).attr('href', '/rest/page/failed');
                    }
                }
            })
			// var ifm = new Information(PName,CName,QName,dAdress,date,name,phone);
			// var postData = JSON.stringify(ifm);
			// $.ajax({
			// 	url:'ifmTest.php',
			// 	type:'post',
			// 	data:{name:postData},
			// 	dataType:'json',
			// 	contentType: 'application/json; charset=utf-8',
			// 	success:function(data){
			// 		console.log("你好");
			// 	}
			// })
		});		
	})