<%@page import="com.itwillbs.beantest.JavaBean2"%>
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
	String pass = request.getParameter("pass");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	
	//전달된 모든정보를,javabean 객체생성후 사용사용
	JavaBean2 jb2 = new JavaBean2();
	jb2.setId(id);		
	jb2.setPass(pass);
	jb2.setAge(age);
	//jb2.setTel(tel);		
	jb2.setTel(request.getParameter("tel"));		
	
	System.out.println("jb2.toString(): "+jb2.toString());
	%> 
	
<%-- 	<%=jb3 %> <br> --%>
<%-- 	<%=jb3.getId() %> <br> --%>
	
	
	

	<!-- 액션태그 사용. javaBean 객체사용 -->
	
	<!--  javaBean 객체생성  >>=같은의미=>	JavaBean2 jb3 = new JavaBean2();  -->
		<jsp:useBean id="jb3" class="com.itwillbs.beantest.JavaBean2"></jsp:useBean>  <!-- id 는 객체참조변수명 -->
	
	<!--자바민 객체정보저장(액션태그  -->
	<!-- property: JavaBean객체의 필드명id, name: 참조변수명,   param:파라미터	
			jb3.setId(request.getParameter("id"));		property 와 param 이름이 동일할경우 param생략가능			-->
<%-- <jsp:setProperty property="id" name="jb3" param="id"/>
	 <jsp:setProperty property="pass" name="jb3" param="pass"/>
	 <jsp:setProperty property="age" name="jb3" param="age"/>
	 <jsp:setProperty property="tel" name="jb3"/>				 --%>
	
	
	<%
//	jb3.setAge(age) + Integer.parseInt(request.getParameter("age"));
	//액션태그는 위 2개의 동작을 결합환 형태로실행되지만, 자동으로 타입(int,String...에 무관)에 맞는 처리 실행.
	%>
	<!-- 전달되는 property 와 param 이름이 전부 동일할경우-->		
	<jsp:setProperty property="*" name="jb3"/>	
	
	<!--자바민 객체정보 출력(액션태그  -->
	<jsp:getProperty property="id" name="jb3"/> 
	<jsp:getProperty property="pass" name="jb3"/> 
	<jsp:getProperty property="age" name="jb3"/> 
	<jsp:getProperty property="tel" name="jb3"/> 
	
	
	<%
	System.out.println("액션태그: "+jb3);
	%>
</body>

</html>