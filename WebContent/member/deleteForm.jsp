<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp5/deleteForm.jsp</h1>
		<h2>회원삭제(탈퇴)</h2>
		<!--
		회원정보확인 (세션체크 
		비밀번호입력
		회원삭제페이지 이동 
		-->
	<%
	 String id = (String)session.getAttribute("id");
	 
	if(id ==null){
		response.sendRedirect("loginForm.jsp");
	}
	
	
	
	
	%>	
	<form action="deletePro.jsp" method="post">
	<input type="hidden" name="id" value="<%=id %>">
	비밀번호: <input type="password" name="pass">
	
			<input type="submit" value="탈퇴하기">
	
	</form>	
		
		
</body>
</html>