<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
	function fun(){
		location.href="logout.jsp";		
	}
</script>



</head>
<body>
	<h1>WebContent/jsp5/main.jsp</h1>
	<h2>main페이지</h2>
	<!-- 로그인시 접근가능한 페이지  -->
	<%
	//session영역에 있는 정보저장
	
	//session정보가 없으면 로그인페이지로 이동	
	String id = (String)session.getAttribute("id");
			
	
	if(id == null){
		response.sendRedirect("loginForm.jsp");				
		
	}	
	%>
	
	<!--회원id 출력  -->
		<h4><%=id %></h4>님 로그인하셔ㅆ습니다/~^^<input type="button" value="로그아웃" onclick="fun();">
									<!-- <input type="button" value="로그아웃" onclick="location.href='logout.jsp';"> -->
									
   <hr>
   
   <a href="info.jsp"> 회원 정보 조회 (select)</a><br>
   <a href="updateForm.jsp"> 회원 정보 수정 (update)</a><br>
   <a href="delete.jsp"> 회원 정보 삭제 (update)</a><br>
   
   
</body>
</html>