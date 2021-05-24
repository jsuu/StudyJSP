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
  <h1>WebContent/jsp1/testPro3.jsp</h1>
 
  
  <%
  
	//한글처리 - form태그 정보를 post방식 전달시  한글데이터가 깨짐(인코딩오류), get방식은 무관.
 	request.setCharacterEncoding("utf-8");

  	String name = request.getParameter("name");			//request객체에서 name파라미터를 가져옴.
  	String gender = request.getParameter("gender");			
// 	String hobby = request.getParameter("hobby");  	//getParameter단일선택인 경우만 되므로  checkbox는 안된다

	// request.getParameterValues("파라미터명");
    // => String[]  리턴 하는 메서드	
  	String[] hobArr = request.getParameterValues("hobby");	//취미(checkbox)는 다중선택, string배열리턴하는 함수
  	String subject = request.getParameter("subject");			
  	
  %>
  
  이름: <%=name %><br>										
 성별: <%=gender %><br>
 	 <% if(hobArr !=null){		//checkbox가 한개라도 선택되어야 실행. 선택된것이 없다면 null
		  	for(int i=0;i<hobArr.length;i++){
			%>	
		  		 취미: <%=hobArr[i] %>   <br>
		  	<%
		  	}
  		}	
      %>

  
 과목: <%=subject %>		  
  	 
 
  
</body>
</html>