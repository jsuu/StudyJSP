<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/testForm2.jsp</h1>
<!--사용자의 나이, 이름을 입력받아 testPro2.jsp 페이지에서 정보를 전달받아 화면에 출력  -->

<form action="testPro2.jsp" method="post">
	이름: <input type="text" name="name"><br>
	나이: <input type="text" name="age">
	
	<input type="submit" value="전송">
</form>

</body>
</html>