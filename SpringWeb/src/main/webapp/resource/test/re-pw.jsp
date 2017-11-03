<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login/Sign-In</title>
<link href="loginstyle.css" type="text/css" rel="stylesheet" />

<!-- 비밀번호 확인 -->

<script type="text/javascript">
/* function button1_click() {
	window.name = "parentForm";
    window.open("IdCheck.jsp",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");
}
function inputIdChk(){
    document.userInfo.idDuplication.value ="idUncheck";
} */
window.onload = function(){
	
		$('#user-pw').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup	
		$('#user-pw-repeat').keyup(
						function() {
							if ($('#user-pw').val() != $('#user-pw-repeat')
									.val()) {
								$('font[name=check]').text('');
								$('font[name=check]')
										.html("<span style='color:red'>**패스워드가 같지 않습니다.<\/span><input type='hidden' name='pwd-check' value='no'>");

							} else {
								$('font[name=check]').text('');
								$('font[name=check]')
										.html("<span style='color:blue'>**올바른 비밀번호를 입력하였습니다.<\/span><input type='hidden' name='pwd-check' value='yes'>");
							}
						}); 		
	}
</script>
</head>

<body>

							
							<form method="post" name="userInfo" accept-charset="utf-8" action="#" class="simform">
							
								<div class="sminputs">
									<div class="input string optional">
										<div class="string optional" for="user-pw">비밀번호 *</div>
										<input class="string optional" maxlength="255" id="user-pw" name="pw"
											placeholder="비밀번호" type="password" size="50" />
									</div>
									<div class="input string optional">
										<div class="string optional" for="user-pw-repeat">비밀번호확인
											*</div>
										<input class="string optional" maxlength="255"
											id="user-pw-repeat" placeholder="비밀번호확인" type="password" name="pw-re"
											size="50" />
									</div>
								</div>
									<div>
										<div class="string optional pw-check" style="text-align: right;"> <font name="check" size="2"></font> </div>
									</div>
								<div class="sminputs">
									<div class="input full">
										<div class="string optional" for="user-name">이메일 *</div>
										<input class="string optional" maxlength="250" id="user-email" name="email"
											placeholder="이메일" type="email" size="50" />
									</div>
								</div>
								<div class="sminputs">
									<div class="input string optional" id="user-gender">
										<div class="string optional" for="user-gender">성별 *</div>
										<label>남자<input class="option-input radio"
											name="gender" type="radio" value="1"></label>
									</div>
									<div class="input string optional">
										<div class="string optional" for="user-gender">
											<br />
										</div>
										<label>여자<input class="option-input radio"
											name="gender" type="radio" value="2" checked></label>
									</div>
								</div>
								<div class="sminputs">
									<div class="input full">
										<div class="string optional" for="user-phone">전화번호 *</div>
										<input type="text" id="phone1" name="phone_num1" placeholder="010" class="phone" size="5" />-
										<input type="text" id="phone2" name="phone_num2" class="phone" size="10"/>-
										<input type="text" id="phone3" name="phone_num3" class="phone" size="10"/>

									</div>
								</div>
								<div class="sminputs">
									<div class="input full">
										<div class="string optional" for="user-address">주소 *</div>
										<span style="font-size: 13px;">시/도: * </span><input type="text" id="address1" name="address1" placeholder="ex)서울,경기, 인천, 대전.." class="address" size="2" />
										<span style="font-size: 13px;">시/군/구: *</span> <input type="text" id="address2" name="address2" placeholder="ex)마포구, 강서구, 구로구.." class="address" size="10"/>
									</div>
								</div>
								
								
							</form>
							
			
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="index.js"></script>
</body>
</html>



