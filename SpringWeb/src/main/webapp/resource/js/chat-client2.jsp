<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="border: 1px solid #a9a9a9;
         background: orange;
         width: 300px;
         height: 500px;
         padding: 10px;">
   <div style="">
      <input id="conn-button" type="button" value="연결" />
   </div>
   
   <div id="chat-list" 
      style="border: 1px solid #a9a9a9; 
      height: 430px;
      background: white;">
   
   </div>
   
   <div style="border: 1px solid #e9e9e9; 
            height: 50px;
            background: white;">
      <textarea id="chat-text" style="width: 100%; height: 100%;"></textarea>
   </div>
</div>


<script type="text/javascript">

window.addEventListener("load", function(){
   var socket = null;
   var connButton = document.querySelector("#conn-button");
      
   connButton.addEventListener("click", function(){
      socket = new WebSocket("ws://newlec.newlecture.com/SpringMVC/chat-server");
      socket.onopen = function(evt){
         alert("연결되었습니다.");
      };
      socket.onmessage = function(evt){
         
      };
      socket.onclose = function(evt){
         
      };
            
   });


})

</script>


</body>
</html>