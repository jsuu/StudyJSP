<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp3/cookieSet.jsp</h1>

<h2>서버</h2>
<%
	//쿠키값 생성(서블릿API)
	Cookie cookie = new Cookie("name","cookievalue");
	
	// 쿠키 필수옵션을 지정
	//쿠키 사용가능 시간을 지정
	cookie.setMaxAge(600);	//600sec.
	
	//쿠키정보를 클라이언트로 전달.(사용자의 HDD저장)
	response.addCookie(cookie);
	
%>

	<script type="text/javascript">
		alert("서버: 쿠키값생성!");
		location.href = "cookieTest.jsp";
	</script>

</body>
</html>