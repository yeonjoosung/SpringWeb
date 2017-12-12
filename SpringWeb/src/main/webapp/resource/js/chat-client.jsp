<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="id" value="yeonjoo"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="border:1px solid #a9a9a9; width:300px;height:500px;padding:10px; background:gray;">
		<div style="border:1px solid #a9a9a9; height:430px; background:pink;">
			<input id="con-button" type="button" value="연결" style="border:1px solid #a9a9a9;"/>
		</div>
		<div id="chat-list">
			<li></li>
		</div>
		<div style="height:50px; border:1px solid #e9e9e9; background:white;">
		<textarea id="chat-text" style="width:98%; height:100%;">
		</textarea>
		<input type="button" id="send-button" value="send"/>
		</div>
	
	</div>
</body>
<script type="text/javascript">
window.addEventListener("load", function(event){
	var id='${id}';
	var chatlist = document.querySelector("#chat-list");
	
	var chatText = document.querySelector("#chat-text");
	var sendButton = document.querySelector("#send-button");
	
	var socket = null;
	var conButton = document.querySelector("#con-button");
	sendButton.onclick = function(){
		//XML,CVS,JSON
		var data = {id:id,text:chatText.value};
		/* socket.send(chatText.value);	 */
		socket.send(JSON.stringify(data));
		/* alert(chatText.value); */
		
	}
	
	conButton.addEventListener("click", function(e){
		socket= new WebSocket("ws://211.238.142.72/SpringMVC/resource/chat-server");
		socket.onopen = function(evt){
			var li = document.createElement("li");
			li.textContent = "접속되었습니다.";
			chatlist.appendChild(li);
		};
		socket.onmessage = function(evt){
			var li = document.createElement("li");
			var data = JSON.parse(evt.data);
			li.textContent = data.id +":"+data.text;
			
			chatlist.appendChild(li);
		};
		socket.onclose = function(evt){
			var li = document.createElement("li");
			li.textContent = "서버와의 연결이 종료되었습니다.";
			chatlist.appendChild(li);
		};
	})
})
</script>
</html>