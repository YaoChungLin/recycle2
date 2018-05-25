$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});


$(function(){
    $('.fullPage').fullpage({
            // 设置背景色
            sectionsColor : ['#000', '#B0C4DE', '#DE8910', '#8794a9', '#0DA5D6'],
            anchors: ['page1', 'page2', 'page3', 'page4'],
            menu:'#backtop',
            afterLoad: function (anchorLink, index) {
                //$('.test').removeClass('.animate');
                // 延时100毫秒执行
                // setTimeout(function () {
                //     $('.test').eq(index - 1).addClass('.animate');
                // }, 100);
                console.log(index);
                $('.second').removeClass('current');
                $('.third').removeClass('current');
                $('.fourth').removeClass('current');
                if(index==2){
                $('.second').addClass('current');
            }else if(index==3){
                $('.third').addClass('current');
            }
            else if(index==4){
                $('.fourth').addClass('current');
            }
            }
    })
})
$('.searchimg').mouseover(function(){
    $('#search').css("display","block");
    $('#search').animate({
        width:'150px'
    })
});
    var arr = [
        {   //  1
            width:400,
            top:3,
            left:50,
            opacity:20,
            zIndex:2
        },
        {  // 2
            width:600,
            top:53,
            left:0,
            opacity:80,
            zIndex:3
        },
        {   // 3
            width:800,
            top:33,
            left:200,
            opacity:100,
            zIndex:4
        },
        {  // 4
            width:600,
            top:53,
            left:600,
            opacity:80,
            zIndex:3
        },
        {   //5
            width:400,
            top:3,
            left:750,
            opacity:20,
            zIndex:2
        }
    ];
    var aData="";
    var slide = document.getElementById("slide");
    var liArr = slide.getElementsByTagName("li");
    var aprev = document.getElementById("prev");
    var anext = document.getElementById("next");
    var flag = true;
function move(bool){
        //判断：如果等于undefined,那么就不执行这两个if语句
        if(bool === true || bool === false){
            if(bool){
                arr.unshift(arr.pop());
            }else{
                arr.push(arr.shift());
            }
        }
        //在次为页面上的所有li赋值属性，利用缓动框架
        for(var i=0;i<liArr.length;i++){
            scroll(liArr[i],arr[i], function () {
                flag = true;
            });
        }
    }
$(document).ready(function(){
    

    //0.获取元素
    
    // var liArr = $('.arrow ul li');
    // var arrow = $('.arrow a');
    // var arrowChildren = $('.arrow a');
    
    // console.log(liArr);
    slide.onmouseenter = function(){
        clearInterval(timeMove);
    }
    slide.onmouseleave = function(){
        timeMove = setInterval('move(false)',3000);
    }

    move();

    aprev.onclick = function () {
        if(flag){
            flag = false;
            move(true);
        }
    }
    anext.onclick = function () {
        if(flag){
            flag = false;
            move(false);
        }
    }
    var timeMove=setInterval('move(false)',3000);
})
/*$(function(){
    $.ajax({
        url:'/rest/api/item/cat',
        type:'get',
        dataType:'json',
        success:function(data){
            var secData="";
            console.log(data.data[0].u);
            console.log(data.data.length);
            var backObj={
                items:data
            };
            for(var k=0;k<data.length;k++){
                secData = data[k].city;
            }

            aData =data;
            var backStr = template('template-first',data);
            console.log(backStr);
            console.log(data.data[0].i);
            $('.items').append(backStr);
            console.log(data.data[0].i.length);
            bindSec(aData);    
        }
    })
    function bindSec(data){
        for(var i=0;i<data.data.length;i++){
            $('a.items')[i].onmouseover = function(){
                $('.nav-bar-bottom').children().remove();
                var proName = this.getAttribute('data-value');
                var k = $(this).index();
                var backObj={
                    items:data.data[k].i
                };
                var backStr = template('template-second',backObj);
                $('.nav-bar-bottom').append(backStr); 
            }
        }
    }
})*/
