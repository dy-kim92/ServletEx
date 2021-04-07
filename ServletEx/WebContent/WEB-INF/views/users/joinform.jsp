<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/includes/header.jsp"%>
<jsp:include page = "/WEB-INF/views/includes/nav.jsp" />

<script>
	function validateForm(){
		var frm = document.joinform;
		
		if(frm.name.value.trim().length == 0){
			alert("이름을 입력해 주세요.");
			frm.name.focus();
			return false;
		}
		
		if(frm.password.value.trim().length == 0){
			alert("비밀번호를 입력해 주세요.");
			frm.password.focus();
			return false;
		}
		
		if(frm.email.value.trim().length == 0){
			alert("이메일을 입력해 주세요.")
			frm.email.focus();
			return false;
		}
		
		return true;
	}
</script>

	<h1>회원 가입</h1>
	<!-- /users 서블릿에 POST 방식으로 폼을 전달 -->
	<form name = "joinform" onsubmit = "return validateForm()" method = "POST" action = "<%= request.getContextPath() %>/users">
	
	<!-- 액션 히든 필드 -->
	<input type = "hidden" name = "a" value = "join" />
	
	<!-- 이름 필드 -->
	<!-- name : 서버로 전송되는 이름 (입력된 내용 전송) / id : HTML 내에서 식별하기 위한 이름 -->
	<label for = "name">이름</label>
	<input id = "name" name = "name" type = "text" /><br/>
	
	<!-- 비밀번호 필드 -->
	<label for = "password">비밀번호</label>
	<input id = "password" name = "password" type = "password" /><br/>
	
	<!-- 이메일 필드 -->
	<label for = "email">이메일</label>
	<input id = "email" name = "email" type = "text" /><br/>
	
	<!-- 성별 : M or F-->
	<fieldset>
		<legend>성별</legend>		<!-- radio 에서 name값이 같으면 둘 중 하나만 선택되게 묶임 -->
		<!-- checked 속성 부여 : 초기값으로 체크되어 있음 -->
		<label>여</label>	<input type = "radio" name = "gender" value = "F" checked/>
		<label>남</label>	<input type = "radio" name = "gender" value = "M" />
	</fieldset>
	
	<!-- 전송 버튼 -->
	<input type = "submit" value = "가입하기" />
	
	</form>

<%@ include file = "/WEB-INF/views/includes/footer.jsp" %>