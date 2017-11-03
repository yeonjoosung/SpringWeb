<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   //window.addEventListener("load", function() {
      
      $(function() {
            
      //DOM 객체를
      //var _chButton = document.getElementById("ch-button"); 
      //jQuery 객체로 바꾸기
      //방법 1 : jQuery 함수 이용하기
      //var chButton = jQuery(_chButton);
      
      //방법2 : $ 함수 이용하기
      //var chButton = $(_chButton);      
      
      //방법3 : CSS Selector 이용하기 -> 제일 많이 사용
      var chButton = $("#ch-button");      
      
      //이벤트 바인딩 두 가지 옵션 : 첫번째 범용 이벤트 바인딩 함수 on()
      /* chButton.on("click", function(){ //jQuery는 이러한 속성을 갖고 있지 않음. document 객체가 아님.
         alert("aa");
      }); */
      
      //이벤트 바인딩 두 가지 옵션 : 두번째 특수 이벤트 바인딩 함수 click/keydown....()
      chButton.click(function(){
         //여러개의 스타일을 설정해야 하는 경우 : 방법1
         /* $("#p").css("background", "red");
         $("#p").css("font-size", "13px"); */
         
         //여러개의 스타일을 설정해야 하는 경우 : 방법2
         $("#p").css({  
            background : "red",
            "font-size" : "23px"
            
         }); //{}는 객체를 의미
         
      });
   });

   //--속성변경예제 --
   $(function() {
      var chImgButton = $("#ch-img-button");
      var container = $("#img-container");
      var img = $("img");
      var imgSrc = $("#img-src");

      chImgButton.click(function() {
         img.attr("src", imgSrc.val());
      });
   });

   //--자식노드변경예제 
   $(function() {
      var chNodeButton = $("#ch-node-button");
      var container = $("#ch-node-container");
      chNodeButton.click(function() {
         //1.텍스트 노드 추가
           //container.textContent = "<h1>testtestset</h1>"
           //container.text("<h1>testtestset</h1>");
         //2. 엘리먼트 노드 추가
           //container.innerHTML = "<h1>testtestset</h1>"
         container.html("<h1>testtestset</h1>");
      });
   });

   //-- 텍스트 노드 추가 예제 ----------------
   $(function()  {
      var addTextNodeButton = $("#add-text-node-button");
      var addImgNodeButton = $("#add-img-node-button");
      var removeNodeButton = $("#remove-node-button");
      var container = $("#node-container");

      var remove = function(e) {
         //container.removeChild(e.target);
         container.removeChild(this);
      }
      var idx = 0;
      addTextNodeButton.click(function() {
         //1.TextNode 생성
         var span = $('<span />');
         var txt ='안녕하세여' + idx++;
         //2. container(부모) 얻기
         //3. 부모에 자식을 추가
         span.append(txt);
         container.append(span);

         span.click(remove);

      });
      addImgNodeButton.click(function() {
         //How to 1(성능에 좋음)
         //1 Element 생성
         // 이 방법은 너무 DOM을 사용하는 스타일로 구현 한 코드
         /* var img = $('<img />');
         img.attr("src", "https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/2jJV/image/Mf_XOc0EP5PP_Ki7DrKrvPSm_cI.jpg"); */
         
         $("<img src='https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/2jJV/image/Mf_XOc0EP5PP_Ki7DrKrvPSm_cI.jpg'/>")
         .appendTo(container /* 부모 */)
         .click(remove);
         
         //2. container(부모) 얻기
         //3. 부모에 자식을 추가
         container.append(img);
         img.click(remove);

         
         //How to 2 (성능에 좋지 않지만 편리함.-> 한두개 넣는 상황의 성능에 영향을 주지 않을 거라면 이를 사용)
         //container.innerHTML += '<img onClick="remove()" src="http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile1.uf.tistory.com/image/2134514F579B4C7D165741" />';


      });
      removeNodeButton.click(function() {
         // 1. 내정된 노드를 지우기
         /* if (container.hasChildNodes()) {
            container.removeChild(container.lastChild);
         } */
         
         // 2. 선택된 노드를 지우기
         //막내 찾기
         //$("#node-container *:last-child").remove();
         /* $("#node-container")
         .children()
         .last()
         .remove(); */
         //$("#node-container img").eq(0).attr("src","http://www.seoulmilkblog.co.kr/wp/wp-content/uploads/2016/10/%EA%B2%A8%EC%9A%B8%EC%9C%A0%EB%9F%BD%EC%97%AC%ED%96%893.jpg");
         //$("#node-container img").get(0).src="http://www.seoulmilkblog.co.kr/wp/wp-content/uploads/2016/10/%EA%B2%A8%EC%9A%B8%EC%9C%A0%EB%9F%BD%EC%97%AC%ED%96%893.jpg";
         $("#node-container img").each(function(index){ //항목이 발견 될때마다 실행 되는 것.(이미지가 this라는 객체로 전달)
            $(this).remove(); //DOM 형식으로 존재
         });
      });
   });
   
   //!--노드 바꾸기 예제 -->
   $(function() {
      var swapNodeButton = $("#swap-node-button");
      var container = $("#swap-node-container");   
      
      swapNodeButton.click(function() {
         var nodes = container.find("img");
         //var nodes =$("#swap-node-container img"); //위에와 동일함. 둘중 하나 선택해서 쓰면 됨.
         
         var node1 = nodes.eq(0); //nodes[0];
         var node2 = nodes.eq(1); //nodes[1];
         var node3 = nodes.eq(2); //nodes[2];
         
         /* var node1 = container.firstElementChild;
         var node3 = container.lastElementChild; */
         //var oldNode = container.replaceChild(node1, node3);
         //container.insertBefore(node3, container.firstChild);
         
         //DOM 기능을 이용한 코드
         //var oldNode = container.replaceChild(node2, node3);
         //container.insertBefore(node3, container.firstElementChild);
         
         //jQuery 기능을 이용한 코드
         /* var oldNode = node3.replaceWith(node2);
         node1.before(node3); //node3 : 삽입될 것. */
         
         //jQuery 스러운 코드
         node3
         .replaceWith(node2)
         .insertBefore(node1);
         
      });
   });
   
   //!--노드 바꾸기 예제 2 -->
   $(function() {
      var moveUpButton = $("#move-up-button");
      //var radioButton = document.
      var container = $("#move-up-container");

      var checkedId = 0;

      var tbody = container.find("tbody"); //container 안에서 query 찾는 거니까 find 사용. $ 쓰면 전체를 다 찾기떄문에
      //var td = tbody.querySelector("tr:first-child td:last-child");
      //var td = tbody.firstElementChild.lastElementChild;
      //var td = tbody.children().first().children().last();
      var td = tbody.children(":first-child").children(":last-child"); //위에꺼 쓰거나 이거 쓰거나 둘중 하나만 사용
      
      
      var tr = null;

      td.click( function(e) {
         //e.stopPropagation();

         console.log("td");
         //e.target.style.background = "green";
         $(e.target).css("background", "green");

      });

      tbody.click( function(e) {

         if (e.target.nodeName == "INPUT") {

            //tr = e.target.parentNode.parentNode;
            tr=$(e.target).parent().parent();

            //var oldNode = container.replaceChild(tr1, tr2);
            //container.insertBefore(oldNode, tr3);

         }

         //console.log("tbody");
         //alert("target : " + e.target.nodeName + ", current : " + e.currentTarget.nodeName);
         //e.target.style.background = "pink";
         //e.target.style.background = "pink";
      });

      /* var trs = container.querySelectorAll("tbody tr");
      
      for(var i=0; i<trs.length; i++)
         trs[i].onclick = function(e){
            e.target.style.background = "pink";
         }; */

      moveUpButton.click (function() {

         if (tr == null)
            return;
         
         //노드 순회
         var container = tr.parent();
         var bf = tr.prev();
         var af = tr.next();
         if (bf == null)
            bf = container.children().first();
         
         //container.replaceChild(tr, bf);
         bf.replaceWith(tr);

         //if (af == 0)
         if(af.length == 0)
            //container.appendChild(bf);
            container.append(bf);
         else
            //container.insertBefore(bf, af);
            bf.insertBefore(af);
      });
   });
   
   /* --- 엘리먼트의 기본 행위 막기 ------------------------------------------------- */
   $(function() {
      var titleText = $("form input[name]");
      var submitButton = $("form input[type='submit']");
      var cancelButton = $("form a");

      submitButton.click(function(e) {
         if (titleText.val() == "") {
            alert("제목을 입력하세요.");
            e.preventDefault();
         }
      });

      cancelButton.click(function(e) {
         if (titleText.val() != "") {
            if (!confirm("작성중이던 입력을 취소하시겠습니까?"))
               e.preventDefault();
         }
      });
   });
   
   /* --- 노드복제 예제----------------------------------------------------------------- */

   $(function() {
      var cloneButton = $("#ex-clone input[value='단순복제']");
      var tbody = $("#ex-clone tbody");

      cloneButton.click (function(e) {
         //var tr = tbody.querySelector("tr");
         
         /* var clone = tr.cloneNode(true);
          tbody.appendChild(clone);  */ 
         tbody
         .find("tr")
         .clone(true)
         .appendTo(tbody);
      });

   });
   
   /*----Template 태그를 이용한 노드복제 and Ajax 요청 예제--------*/
   $(function() {
      var cloneButton = $("#ex2-clone input[value='단순복제']");
      var ajaxButton = $("#ex2-clone input[value='Ajax요청']");
      var tbody = $("#ex2-clone tbody");
      var template = $("#ex2-clone template");
      var container = $("#ex2-clone div:first-child");

      var data = [ 
         {id : "1", title : "자바스크립트 야호~", writerId : "newlec"}, 
         {id : "2", title : "자바도 야호~", writerId : "dragon"}, 
         {id : "3", title : "둘다 ~", writerId : "wa~~~"} 
      ];
      
      //jQuery 객체의 필드와 속성
      /* 
         HTML <---------------------------------> DOM ================================> jQuery
         <input checked ="checked"/>              obj.checked // true/false             jboj.attr("checked")
         <input checked />                                                jboj.prop("checked")
         <input required="required" />
         <input required />
      */
      
      //1.복제하기
      cloneButton.click( function(e) {
         // 현재 브라우저가 template 태그를 지원하는지에 대한 확인
         if ('content' in template.get(0)) {
            // 1. template의 content에 값을 설정하고 노드를 복제 하는 경우
            /* var tds = template.content.querySelectorAll("td");
            tds[0].appendChild(document.createTextNode("1"));
            tds[1].textContent = "test title";
            tds[2].textContent = "newlec";
            
            var clone = document.importNode(template.content, true); */

            // 2. 복제를 한 후에 content를 설정하는 경우         
            for (var i = 0; i < data.length; i++) {
               var clone = $(document.importNode(template.prop("content"), true));
               //var clone = template.clone(true);

               var tds = clone.find("td");
               //tds[0].appendChild("document.createTextNode("1")");
               //tds.eq(0).html(tds.(0).html() + data[i].id);
               tds.eq(0).append(data[i].id);
               tds.eq(1).text(data[i].title);
               tds.eq(2).text(data[i].writerId);

               // 복제된 clone(tr)을 노드 트리에 추가
               tbody.append(clone);
            }
         }
         /* var obj = {kor:30, eng:40, math:50};
         
         obj.com = 60;
         
         if( 'com' in obj)
            alert(obj.kor + obj.com); */
      });
      
      //2. Ajax 요청하기
      ajaxButton.click(function(e){
         //3. jQuery.get()으로 문서를 요청한 방식
         $.get("../../customer/notice-ajax", function(data){
            alert(JSON.parse(data)[0].writerName);
            });
      
         /*  /* 2. 비동기형으로 문서를 요청한 방식 */
         //var xhr = new XMLHttpRequest();
         /* xhr.onreadystatechange = function(e){
            if(xhr.readyState == 4)
               data = eval(xhr.responseText);
         }; 
         xhr.onload = function() {
            //alert("tt");
            data = JSON.parse(xhr.responseText);
            // 2. ajax icon 제거
            container.removeChild(container.lastChild);
         };
         xhr.onerror = function(e) {
            alert("예기치 못한 오류가 발생하였습니다.");
         };
         xhr.open("GET", "../../customer/notice-ajax", true);
         xhr.send();
         // 1. ajax icon 추가
         var img = document.createElement("img");
         img.src = "../images/ajax-loader.gif";
         container.appendChild(img); */

         /* 1. 동기형으로 문서를 요청한 방식 */
         /* var xhr = new XMLHttpRequest();
         xhr.open("GET", "../../customer/notice-ajax", false);
         xhr.send();
         data = eval(xhr.responseText); */

      });
      

   });
</script>
</head>
<body>

   <!--Template 태그를 이용한 노드복제 and Ajax 요청 예제 -->
   <div id="ex2-clone">
      <div>
         <input type="button" value="단순복제" /> 
         <input type="button" value="Ajax요청" />
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
         <template>
         <tr>
            <td>
               <input name="id" type="radio" value="1" />
            </td>
            <td></td>
            <td></td>
         </tr>
         </template>
      </div>
   </div>
   <hr />

   <!--노드복제 예제 -->
   <div id="ex-clone">
      <div>
         <input type="button" value="단순복제" />
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
               <tr>
                  <td>
                     <input name="id" type="radio" value="1" />
                  </td>
                  <td>1</td>
                  <td>아~ 괜히 하자고 했지?</td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <hr />

   <!--기본 행위 막기 예제 -->
   <form>
      <input type="text" name="title" /><br />
      <input type="submit" value="전송" />
      <a href="">취소</a>
   </form>
   <hr />

   <!--노드 바꾸기 예제 2 + 이벤트 심화 : 버블링과 캡처링 -->
   <input id="move-up-button" type="button" value="위로 옮기기" />
   <div id="move-up-container">
      <table border="1">
         <thead>
            <tr>
               <td></td>
               <td>코드</td>
               <td>제목</td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>
                  <input name="id" type="radio" value="1" />
               </td>
               <td>1</td>
               <td>아~ 괜히 하자고 했지?</td>
            </tr>
            <tr>
               <td>
                  <input name="id" type="radio" value="2" />
               </td>
               <td>2</td>
               <td>졸ㄹ려~~</td>
            </tr>
            <tr>
               <td>
                  <input name="id" type="radio" value="3" />
               </td>
               <td>3</td>
               <td>아~ 졸ㄹ려~~</td>
            </tr>
            <tr>
               <td>
                  <input name="id" type="radio" value="4" />
               </td>
               <td>4</td>
               <td>정말 졸ㄹ려~~</td>
            </tr>
            <tr>
               <td>
                  <input name="id" type="radio" value="5" />
               </td>
               <td>5</td>
               <td>미쳐버리게 졸ㄹ려~~</td>
            </tr>
         </tbody>
      </table>

      <img src="../images/w3c.png" />
      <img src="../images/microsoft.png" />
   </div>
   <hr />

   <!--노드 바꾸기 예제 -->
   <input id="swap-node-button" type="button" value="노드 바꾸기" />
   <div id="swap-node-container">
      <img src="../images/answeris.png" /><img src="../images/w3c.png" />
      <img src="../images/microsoft.png" />
   </div>
   <hr />
   
   <!--텍스트 노드 추가 예제 -->
   <input id="add-text-node-button" type="button" value="텍스트노드 추가" />
   <input id="add-img-node-button" type="button" value="이미지노드 추가" />
   <input id="remove-node-button" type="button" value="노드 삭제" />
   <div id="node-container"></div>
   <hr />

   <!--자식노드변경예제 -->
   <input id="ch-node-button" type="button" value="자식노드 변경" />
   <div id="ch-node-container">hello</div>
   <hr />
   
   <!--속성변경예제 -->
   <input type="text" id="img-src" />
   <input id="ch-img-button" type="button" value="이미지 변경" />
   <div id="img-container">
      <img src="http://www.seoulmilkblog.co.kr/wp/wp-content/uploads/2016/10/%EA%B2%A8%EC%9A%B8%EC%9C%A0%EB%9F%BD%EC%97%AC%ED%96%893.jpg" />
   </div>
   <hr />
   
   <!-- 노드 순회 예제------------------------------------------------------------------------------------ -->
   <input id="ch-button" type="button" value="배경색 변경" />
   <div>
      <div>1</div>
      <div id="p">
         <div>2</div>
      </div>
      <div>3</div>
   </div>
</body>
</html>