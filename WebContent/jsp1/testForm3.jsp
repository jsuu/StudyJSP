<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/testForm3.jsp</h1>
<!--사용자의 나이, 이름을 입력받아 testPro2.jsp 페이지에서 정보를 전달받아 화면에 출력  -->

<form action="testPro3.jsp" method="post">
	이름: <input type="text" name="name"><br>
	성별: <input type="radio" name="gender" value="남">남
		<input type="radio" name="gender" value="여">여<br>
		
	취미: <input type="checkbox" name="hobby" value="캠핑">캠핑	
	     <input type="checkbox" name="hobby" value="영화">영화	
		 <input type="checkbox" name="hobby" value="음악">음악	<br>
	과목: <select name="subject">
			<option value="">선택하세요</option>
			<option value="java">자바</option>
			<option value="js">자바스크립트</option>
			<option value="web">웹</option>
			<option value="db">디비</option>
		</select>
		
	<hr>		
	<input type="submit" value="전송">
</form>

</body>
</html>