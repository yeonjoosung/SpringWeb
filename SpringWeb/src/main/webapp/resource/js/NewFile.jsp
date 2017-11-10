<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
//---- template 태그이용한 노드 복제 예제-------------------------------------------------------------------------------
$(function(){
	var cloneButton =$("#ex2-clone input[value='단순복제']");
	var ajaxButton =$("#ex2-clone input[value='Ajax요청']");
	var tbody = $("#ex2-clone tbody");
	var template = $("#ex2-clone template");
	var container = $("#ex2-clone div:first-child");
	var data = [
		{id:"11", title:"자바스크립",writerId:"yeonjoo"},
		{id:"22", title:"자바스크립트",writerId:"yeonjooyeonjoo"},
		{id:"33", title:"자바스크립트트",writerId:"yeonjooyeonjooyeonjoo"}
		
	];
	
	ajaxButton.click(function(e){
		
		// **2. 비동기형 문서 요청
		/* xhr.onreadystatechange = function(e){
			if(xhr.readayState == 4)
				data = eval(xhr.responseText);
		} */
		var xhr = new XMLHttpRequest();
		xhr.onload = function(){
			//alert(xhr.responseText);
			//data = eval(xhr.responseText);
			data =JSON.parse(xhr.responseText);
			// 2. ajax icon 제거
			container.removeChild(container.lastChild);
		}
		
		xhr.onerror = function(e){
			alert("예기치못한오류가발생하였습니다.");
		}
		xhr.open("GET", "../../customer/notice-ajax", true);
		xhr.send();
		
		// 1. ajax icon 추가
		
		var img = document.createElement("img");
		img.src= "../images/ajax-loader.gif";
		container.appendChild(img);
		// **1. 동기형 문서 요청
		/* 
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "../../customer/notice-ajax",false);
		
		xhr.send();
	//	alert(xhr.responseText);
		data = eval(xhr.responseText); 
		*/
	})
	
});
</script>
</head>
<body>
<!-- template 태그를 이용한 노드 복제 예제 -->
	<div id="ex2-clone">
	<div>
		<input type="button" value="단순복제"/>
		<input type="button" value="Ajax요청"/>
	</div>
	
	<div id="clone-container">
		<table border="1">
			<thead>
				<tr>
					<td></td>
					<td>코드</td>
					<td>제목</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
			</table>
			
		
	
	</div>
	<template>
				<tr>
					<td><input name="id" type="radio" value="1"/></td>
					<td></td>
					<td></td>
					
				</tr>
			</template>
	</div>
</body>
</html>