<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp5/insertForm.jsp</h1>
	<!--
		insertForm.jsp 정보입력
		insertPro.jsp전달후 전달된 정보를 db에 저장.
	  -->
	  
	  <form action="insertPro.jsp" method="post">
	  	아이디: <input type="text" name="id"><br>
	  	비밀번호: <input type="password" name="pass"><br>
	  	이메일: <input type="text" name="email" value=""><br>
	  	
	  	<input type="submit" value="전달"> 
	  
	  </form>

</body>
</html>