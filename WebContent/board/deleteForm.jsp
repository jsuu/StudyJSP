<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/deleteForm.jsp</h1>
	
	<h2>글삭제페이지</h2>
<!-- 	사용자로부터 글비밀번호을 입력받아 처리페이지(deletePro.jsp)로 이동 -->

<%
	//전달된 정보저장(num, pageNum)
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

	<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post">
		<input type="hidden" name="num" value="<%=num %>">
		비밀번호: <input type="password" name="pass"><br>
				  <input type="submit" value="글삭제"> 
	</form>
</body>
</html>