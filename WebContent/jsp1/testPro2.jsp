<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WebContent/jsp1/testPro2.jsp</h1>
 
  
  <%
  // 스크립틀릿 : JSP/Java코드 작성
  //request.getParameter("파라미터명");
  	//* form에서 데이터를 전달할때(파라미터값 생성시) 모든데이터는 String 타입으로 처리

	//한글처리 - form태그 정보를 post방식 전달시  한글데이터가 깨짐(인코딩오류), get방식은 무관.
 	request.setCharacterEncoding("utf-8");

  	String name = request.getParameter("name");			//request객체에서 name파라미터를 가져옴.
  	int age = Integer.parseInt(request.getParameter("age"));				
  	
  %>
  
  이름: <%=name %><br>										<!-- 화면 표시방법 3.  저장된 변수 -->
  나이: <%=age %><br>										<!-- 화면 표시방법 3.  저장된 변수 -->
  <%
  	//사용자나이가 20이상  : "ooo님은 성인입니다"
  	//사용자나이가 20미만  : "ooo님은 미성녕자입니다"
  	
  	//1. Java
  if(age >= 20){
	  out.println(name+"님은 성인이니다<br>");
  }else{
	  out.println(name+"님은 미성녕자입니다<br>");	  
  }

  //2. Java + html
  if(age >= 20){
	%>
	님은 성인이니다<br>
	<%	 
  }else{
	%>
	님은 미성녕자입니다<br>
	<%	 
  }  
  //3. 표현식
  if(age >= 20){
	%>
	 <%=name %>님은 성인이니다<br>
	<%	 
  }else{
	%>
	 <%=name %>님은 미성녕자입니다<br>
	<%	 
  }   
  %>
</body>
</html>