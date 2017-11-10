<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

/* 
애니메이션을 구현하는 기술 세가지
1. 스크립트 절차를 직접 이용한 애니메이션
2. jQuery와 같은 라이브러리를 이용한 애니메이션
3. css3 애니메이션 기능을 이용한 애니메이션
*/


/* 
function animate(target, to){
		timer = setInterval(function(){
			var width = parseInt(target.style.width);
			target.style.width = (width+1)+"px";
			
			if(width > to)
				clearInterval(timer);
		},17);
	
}

*/
window.addEventListener("load", function(event) {
	
	var widthButton = document.querySelector("#ex-tool input[value='너비늘리기']");
	var item = document.querySelector("#ex1-box .item1");
	var timer = null;
	widthButton.onclick = function(e) {
		
		/*  if(timer == null)
		timer = setInterval(function(){
			
			var width = parseInt(item.style.width);
			item.style.width = (width+2)+"px";
			
			if(width > 400)
				clearInterval(timer);
		}, 17)  */
		
			//2. 애니메이션함수로(animate) 리펙토링
			//animate(item,300);
			
			
			
	}; 

});

	$(function(){
	var widthButton = $("#ex-tool input[value='너비늘리기']");
	var item = $("#ex1-box .item1");
	
	widthButton.click(function(e) {
		
		//1. 한번에 변화를 주는 방법 
	/* 	 item.css("width","200px");
		item.css({
			width: "200px"
		}); 
		 */
		
		
		//2. 기간(duration)을 두고 변화를 주는 방법
	/* 	 item.animate({
			width:"200px"
		}, 2000, "linear", function(){
			alert("야야야야야");
		}); */
		 item.css({
	            width: "200px",
	            opacity: "0.5"
	         })
	});
});
</script>
<style>
.item1{
	width: 100px;
	height: 100px;
	background: pink;	
	
	/* transition:1s; */
	transition-property: width, opacity;
	transition-delay:500ms;
	transition-timing-function:cubic-bezier(0.450, 0, 0.775, 1);
	/*
	transition-duration:
	transition-delay:
	transition-property:
	transition-timing-function:	 */
}
.item1:hover{
	/* transform: rotate(45deg); */
	/* opacity: 0.5;
	width: 200px;
	height: 200px; */
}
</style>
</head>
<body>
	<!-- 1. 너비를 변경하는 애니메이션 -->
	<div id="ex-tool">
		<input type="button" value="너비늘리기" />
	</div>
	<div id="ex1-box" style="width:500px;height:300px; background:gray;"> 
		<div class="item1" >
		</div>
	</div>

</body>
</html>