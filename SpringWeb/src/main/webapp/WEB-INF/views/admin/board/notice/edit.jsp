<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>수정 페이지</h2>

	<form action="?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" >
		 <fieldset>
		
			<legend>공지사항 수정정보 필드</legend>
			<table border="1">
			 <tbody>
						<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" name="title" value="${n.title}" /></td>
					</tr>
				<tr>
						<td>작성자</td>
						<td>${n.writerId}</td>
						
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="3">
					
						</td>
					</tr>
					<tr>
						<td colspan="4"><textarea name="content" rows="20" cols="60">${n.content}</textarea>

						</td>
					</tr>
				</tbody>
			</table> 
			 <div>				
				<input type="submit" value="저장" />

				<a href="../{n.id}">취소</a>				
			</div>  
		</fieldset> 
	</form> 