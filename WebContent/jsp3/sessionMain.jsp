<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp3/sessionMain.jsp</h1>
<%

	// 세션 영역객체의 값을 사용해서 로그인여부 체크
	String Id = (String)session.getAttribute("id");
	String Pw = (String)session.getAttribute("pw");
	
	if(Id ==null){
		//로그인x
		response.sendRedirect("sessionLogin.jsp");
	}
%>
			<h2>메인페이지</h2>
			입력아이디: <%=Id %>님 안녕하세요? <br>
			입력비번: <%=Pw %>
			<hr>
			<input type="button" value="로그아웃" 
					onclick="location.href='sessionLogout.jsp'">
</body>
</html>