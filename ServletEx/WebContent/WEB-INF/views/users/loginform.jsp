<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>

<script>
	
	function validateForm() {
		var frm = document.loginForm;
		
		if (frm.email.value.trim().length == 0){
			alert("이메일 주소를 입력해 주세요.");
			frm.email.focus();
			return false;
		}
		
		if (frm.password.value.trim().length == 0){
			alert("비밀번호를 입력해 주세요.");
			frm.password.focus();
			return false;
		}
		
		return true;
	}
	
</script>

<body>

	<h1>Login</h1>
	
	<form name = "loginForm" onsubmit = "return validateForm()" method = "POST" action = "<%= request.getContextPath() %>/users">
		<input type = "hidden" name = "a" value = "login">
		<label for = "email">이메일</label>
		<input name = "email" id = "email" type = "text" /><br/>
		
		<label for = "password">비밀번호</label>
		<input name = "password" id = "password" type = "password" /><br/>
		
		<input type = "submit" value = "로그인" />
	</form>

</body>
</html>