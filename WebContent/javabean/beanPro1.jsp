<%@page import="com.itwillbs.beantest.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/javabean/beanPro1.jsp</h1>
	
	<%
	request.setCharacterEncoding("utf-8");
	
	//전달된 파라미터값 저장
	String id = request.getParameter("id");
	
	
	%>
	
	아이디: <%=id %>
	
	<%
		//javabean 객체사용
		JavaBean1 jb1 = new JavaBean1();	
		
// 		System.out.println("jb1.toString()= "+jb1.toString());
 		System.out.println("jb1 = "+jb1);	//객체만 생성했고 set한게 아무것도 없다.

		jb1.setId(request.getParameter("id"));
 		System.out.println("set메서드: "+jb1);
	
	%>
	<!-- 액션태그 사용. javaBean 객체사용 -->
	
	<!--  javaBean 객체생성  >>=같은의미.
		    JavaBean1 jb2 = new JavaBean1();  -->
	<jsp:useBean id="jb2" class="com.itwillbs.beantest.JavaBean1"></jsp:useBean>	<!-- id 는 객체참조변수명 -->
	
	
	<!-- property: JavaBean클래스의 필드명id, name: 참조변수명,   param:파라미터	
			jb2.setId(request.getParameter("id"));						-->
	<jsp:setProperty property="id" name="jb2" param="id"/>
	
	<!--자바민 객체정보 출력  -->
	<jsp:getProperty property="id" name="jb2"/>
	
	<%
	System.out.println("액션태그: "+jb2);
	%>
</body>

</html>