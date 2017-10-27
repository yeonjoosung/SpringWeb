<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Jquery</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	//window.addEventListener("load", function(){
	$(function(){
		//DOM객체를 
		var _chButton = document.getElementById("ch-button");
		//jQuery 객체로 바꾸는 방법1: jQuery함수이용하기
		var chButton = jQuery(_chButton);
		//jQuery 객체로 바꾸는 방법2: $함수이용하기
		var chButton = $(_chButton);
		//jQuery 객체로 바꾸는 방법3: CSS Selector 이용하기
		var chButton = $("#ch-button");
		/* 
		// 이벤트 바인딩 두가지 옵션 : 첫번째 범용 이벤트 바인딩 함수 on()
		chButton.on("click", function(){
			alert("aaaa");
		});
		 */
		 
		// 이벤트 바인딩 두가지 옵션 : 두번째 특수 이벤트 바인딩 함수 click/keydown...()
		chButton.click(function(){
			//alert("abcdefg");
			//과거
//			.style.background ="red";

			
			// 여러개의 스타일 설정해야하는경우 방법1
		/* 	$("#p").css("background","red");
			$("#p").css("font-size","13px");
			 */
			// 여러개의 스타일 설정해야하는경우 방법2
			$("#p").css({
				background : "red",
				"font-size"  : "27px"
			});
			
		});
		
	});
</script>
</head>
<body>
	<hr />
	<!-- 노드 순회 예제------------------------------------------------------------------------------------ -->
	<input id="ch-button" type="button" value="배경색 변경"/>
	<div>
		<div>1</div>
		<div id="p">
			<div>2</div>
			<!-- comment -->
		</div>
		<div>3</div>
	</div>
	<hr />
	<!-- iframe 예제------------------------------------------------------------------------------------ -->
	<div>
		<input id="nav-button" type="button" value="페이지 전환"/>
		<iframe src="notice.html" style="width:500px; height:300px;"></iframe>
	</div>
	<hr />
	<!-- open a window 예제------------------------------------------------------------------------------------ -->
	<div>
		<input id="open-button" type="button" value="새창띄우기"/>
		<input id="mov-button" type="button" value="왼쪽으로 이동"/>
		<input id="trans-button" type="button" value="페이지 이동"/>
	</div>
	<hr />
	<!-- Timer 예제------------------------------------------------------------------------------------ -->
    <p>
	       남은시간 <span id="count-label">60</span>초
	       <input type="button" id="count-button" value="카운트 시작" />
    </p>
    <hr />
	<!-- Calculator 예제------------------------------------------------------------------------------------ -->
	<div id="ex1">
		<input type="text" id="x" placeholder="x값을 입력하세요" />
		<input type="text" id="y" placeholder="y값을 입력하세요" />
		=
		<input type="button" value="더하기" id="add-button" />
		<input type="text" value="" id="result" />
	</div>
</body>
</html>