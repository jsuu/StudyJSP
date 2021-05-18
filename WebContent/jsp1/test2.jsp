<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	alert("js실행");			
	</script>


</head>
<body>
	<h1>WebContent/jsp1/test2.jsp</h1>
	<h2>jsp: 객체지향언어</h2>
  <h2> ** jsp : 내장객체 (p177~)</h2>
  <%
     //var TV = new Object();
  %>
  
  <h3> javax.servlet 패키지 (8개) </h3>
    request : http 요청정보를 저장하는 객체<br>
    response : http 응답정보를 저장하는 객체 <br>
    session : 클라이언트 세션정보를 저장객체<br>
    page : 해당페이지 정보를 저장객체(서블릿객체)<br>
    pageContext : 페이지에 필요한 실행정보 저장 객체(프로젝트안에 있는 페이지)<br>
    application : 애플리케이션의 컨텍스트(프로젝트)정보를 저장하는 객체<br>
    out : 응답 페이지를 출력하는 객체<br>
    config : 페이지에 필요한 서블릿 정보를 저장객체(초기화정보)<br>
      
  <h3> java.lang 패키지(1개) </h3>
    exception : 예외 처리 객체<br>
  
</body>
</html>