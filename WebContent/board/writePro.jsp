<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/writePro.jsp</h1>
	
	<%	//한글처리  post방식 은 한글꺠질수 있다.
		request.setCharacterEncoding("utf-8");
		//전달된 파라미터값 저장 (자바빈 객체 - 액션태그 사용)

	%>	<!--bb변수명으로 객체생성  -->
		<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"></jsp:useBean>
		
		<!-- form에서 전달된 모든정보 저장  -->
		<jsp:setProperty property="*" name="bb"/>

		<%=bb %>
		
		<%
		//bb객체에 ip주소 추가 (파라미터로 전달되지 않으므로..)
		//localhost ip=0:0:0:0:0:0:0:1
		bb.setIp(request.getRemoteAddr());
		%>
		<hr>

		<%=bb %>
		
		<%
		//DB처리객체 생성
		BoardDAO bDAO = new BoardDAO();
		
		//글쓰기 매서드 호출
		bDAO.insertBoard(bb);
// 		bDAO.getCon(); //(사용하면 안됨)  DB연결정보 노출 


		
		
		//글쓰기 이후 글 목록 페이지 이동(list.jsp)
		response.sendRedirect("list.jsp");
		%>
		
		
</body>
</html>