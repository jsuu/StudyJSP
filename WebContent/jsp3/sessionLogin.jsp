<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionLogin.jsp</h1>
	
		<h2>sessionLogin 페이지</h2>
		<%
		//1.로그인 페이지에서 사용자정보(id,pw) 입력
		//2. 로그인처리페이지(sessionLoginPro.jsp) 이동
		//3. 전달된 회원정보를 저장  / 본인정보와 비교  (itwill/ 1234)
		
		//4. 로그인체크 로직
		//4-1. 아이디 o => 비번체크 /  아이디x => 비회원알림
		//4-2. 비번 o  => 본인  (로그인성공) / 비번x => 본인(비번오류)
		
		//5. 로그인성공시 페이지 이동 (sessionMain.jsp)
		//6. 로그인성공여부 판단		
		%>
		<form action="sessionLoginPro.jsp" method="post"><br>
			아이디:<input type="text" name="id"><br>
			비번:<input type="password" name="pw"><br><br>
			
			<input type="submit" value="로그인">
			<input type="reset" value="다시작성">
		</form>
		

</body>

</html>