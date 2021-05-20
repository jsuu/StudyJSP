%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
// 	alert("js실행");			
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
    <hr>
   
   서버 도메인명 : <%=request.getServerName() %><br>  
   서버 포트번호 : <%=request.getServerPort() %><br>
   URL : <%=request.getRequestURL() %><br>
   URI : <%=request.getRequestURI() %><br>	<!-- URL에서 http:/serverName:port 제외됨  -->
   프로토콜: <%=request.getProtocol() %><br>
  client 호스트명: <%=request.getRemoteHost() %><br>
  client IP주소:  <%=request.getRemoteAddr() %><br>
  
  페이지 요청방식(전송방식): <%=request.getMethod() %><br>
 context정보(project 정보) : <%=request.getContextPath() %> <br>
 물리적 경로: <%=request.getRealPath("/") %>
 
 http헤더 정보(user-agent): <%=request.getHeaders("user-agent") %><br>
 http헤더 정보(accept-language): <%=request.getHeaders("accept-language") %><br>
 http헤더 정보(host): <%=request.getHeaders("host") %><br>
 http헤더 정보(connection): <%=request.getHeaders("connection") %><br>
   <hr>
  <%
  	// response : 서버 -> 클라이언트 응답정보 저장
  	 response.addHeader("Refresh", "5;url=/StudyJSP/jsp1/test2.jsp");		// 새로고침을 5초마다
  	 //response.setHeader("헤드속성",값);
  	 //response.addCookie("쿠키값");
  	 //response.setContextType("속성");
  	 //response.sendRedirect("페이지");
  %> 
  
  <h2>session 객체</h2>
  session ID값: <%=session.getId() %><br>
  세션생성시간: <%=session.getCreationTime() %> <br>
  최종접속시간: <%=session.getLastAccessedTime() %> <br>
 세션유지시간(1800sec): <%=session.getMaxInactiveInterval() %><br>   <!--1800sec :  30min  -->
 
 <% //세션유지시간 60분으로 변경
 	session.setMaxInactiveInterval(3600);
 %>
 세션유지시간(3600sec): <%=session.getMaxInactiveInterval() %><br>   <!--3600sec :  60min  -->
 
서버정보: <%=application.getServerInfo() %><br>
서버 물리적경로: <%=application.getRealPath("/") %><br>

<%
	out.print("hello~");
	out.print("hello2~");
	out.print("hello3~");
	out.print("hello4<br>~");
%>
버퍼사이즈: <%=out.getBufferSize() %><br>		<!--  buffer 박스개념-->
사용후 버퍼사이즈: <%=out.getRemaining() %><br>

  
  
   
 
</body>
</html>