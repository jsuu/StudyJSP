<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/jsp1/testPro1.jsp</h1>
  
  <!-- 
  testForm1.jsp페이지에서 전달된 정보 파라미터값을 저장
   -->
  
  <%
  // 스크립틀릿 : JSP/Java코드 작성
  //http://localhost:8088/StudyJSP/jsp1/testPro1.jsp?num=222
  //request.getParameter("파라미터명");
  
//* form에서 데이터를 전달할때(파라미터값 생성시) 모든데이터는 String 타입으로 처리
  
  	String num = request.getParameter("num");					//request객체에서 num파라미터를 가져옴.
  	
 	 out.print(request.getParameter("num"));		//  화면 표시방법 1.
 	 
 	 //문자형데이터(문자형숫자 의미)를 숫자로 변경
 	 int num2 = Integer.parseInt(request.getParameter("num"));	
  %>
  <%=request.getParameter("num") %>					<!-- >화면 표시방법 2. -->
  
  <%=num %><br>										<!-- >화면 표시방법 3.  저장된 변수 -->
  
  num +100 = <%=num+100 %> <br>		<!-- String 연결연산자 -->
  num2 +100 = <%=num2+100 %><br>	<!-- int 더하기 연산자 -->
  
  
  
  
  
  
  
  
  
  
</body>
</html>