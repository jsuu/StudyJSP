<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionDel.jsp</title>
</head>
<body>
 <h1>WebContent/jsp3/sessionDel.jsp</h1>
 
 <%
 	//특정 세션값 삭제
 	session.removeAttribute("name");
 		System.out.println("session값        삭제!");
 
  	 //page이동 (sessionTest.jsp)  - Js방식 이용 	 
 %>
  	<script type="text/javascript">
 		alert("세션값 삭제 후 페이지이동");
 		location.href='sessionTest.jsp';
 	</script>
 
</body>
</html>