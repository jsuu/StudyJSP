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
	
	<h2>회원가입 페이지</h2>
	   <!-- 
   		   아이디, 비밀번호, 이름,나이, 성별,이메일 입력받아서
     	 insertPro.jsp 페이지에 전달 -> DB 저장
    	-->
    	
    	<fieldset>
    		<form action="insertPro.jsp" method="post">
    			아이디:<input type="text" name="id"><br>
    			비밀번호:<input type="password" name="pass"><br>
    			이름:<input type="text" name="name"><br>
    			나이:<input type="text" name="age"><br>
    			성별:<input type="radio" name="gender" value="남자">남  
    			   <input type="radio" name="gender" value="여자">여<br>
    			이메일:<input type="text" name="email"><br>
    			<hr>
    			<input type="submit" value="화원가입">    		
    		</form>
    		
    	</fieldset>
	

</body>
</html>