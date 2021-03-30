<%@page import="com.bit.servlet.dao.EmailVo"%>
<%@page import="com.bit.servlet.dao.EmailDaoOrclImpl"%>
<%@page import="com.bit.servlet.dao.EmailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일리스트 : 정보 수정</title>
</head>
<body>

	<h1>메일링 리스트 정보수정 (Model 2)</h1>
	<p>메일링 리스트에 등록된 정보를 수정하려면<br/>
	변경할 정보를 입력 후 수정버튼을 눌러주세요.</p>

	

	<form action = "<%= request.getContextPath() %>/el"
		method = "POST">
		<input type = "hidden" name = "action" value = "update" />	<!-- 숨은 데이터 -->
		<input type = "hidden" name = "no" value = "<%= request.getParameter("no") %>" />	<!-- 숨은 데이터 -->
		
		<label for = "last_name">변경할 성</label>
		<input type = "text" name = "last_name" id = "last_name"
				 value = <%= request.getParameter("lastName") %> />
		<br/>
		<label for = "first_name">변경할 이름</label>
		<input type = "text" name = "first_name" id = "first_name"
				value = <%= request.getParameter("firstName") %> />
		<br/>
		<label for = "email">변경할 이메일</label>
		<input type = "text" name = "email" id = "email" 
				value = <%= request.getParameter("email") %> />
		<br/>
		<input type = "submit" value = "수정" />
	</form>
	
	<p>
		<a href = "el">목록</a>
	</p>

</body>
</html>