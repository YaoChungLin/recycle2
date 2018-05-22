
var memory = "";
var screen = "";
var border = "";
var face = "";
var services = "";
var firstPercent = "";
var url=window.location.href+"";
console.log(url);
$(function(){

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
		for(var i=0;i<3;i++){
			$('.memorykind li')[i].onclick = function(){
				$('.memory').addClass('selected');
				var data = this.getAttribute('data-value');
				memory = data;
				$('#price').text(data);
				$('.screen').addClass('finish');
				}
			}
		}
	function movescreen(){
		for(var i=0;i<4;i++){
			$('.screenkind li')[i].onclick = function(){
				$('.screen').addClass('selected');
				var firPer = this.getAttribute('data-percent');
				//var data = this.getAttribute('data-value');
				//screen = data;
				firstPercent = firPer;
				console.log(firPer);
				$('#usescr').text(firPer);
				$('.sborder').addClass('finish');
				}
			}
		}
	function movesborder(){
		for(var i=0;i<4;i++){
			$('.borderkind li')[i].onclick = function(){
				$('.sborder').addClass('selected');
				var data = this.getAttribute('data-value');
				border = data;
				$('#useborder').text(data);
				$('.surface').addClass('finish');
				}
			}
		}
	function movesurface(){
		for(var i=0;i<4;i++){
			$('.surfacekind li')[i].onclick = function(){
				$('.surface').addClass('selected');
				var data = this.getAttribute('data-value');
				face = data;
				$('#usesurface').text(data);
				$('.service').addClass('finish');
				}
			}
		}
	function moveservice(){
		for(var i=0;i<4;i++){
			$('.servicekind li')[i].onclick = function(){
				$('.service').addClass('selected');
				var data = this.getAttribute('data-value');
				services = data;
				$('#useservice').text(data);
				$('.evalue').css('display','block');
				// $('.service').addClass('finish');
				}
			}
		}
	$('#btn-sumbit').click(function(){
		var strdata = memory+screen+border+face+services;
		/*$.ajax({
			url:'',
			type:'post',
			data:{name:strdata},
			dataType:'json',
			contentType: 'application/json; charset=utf-8',
			success:function(data){
				 $(location).attr('href', '');//跳转路径
			}
		})*/
	})
	movescreen();
	movesborder();
	movesurface();
	moveservice();
})
	