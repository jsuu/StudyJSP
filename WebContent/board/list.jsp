<%@page import="java.awt.List"%>
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
	<h1>WebContent/board/list.jsp</h1>
	<%
	//테이블에 저장된 글의 총갯수 확인
	//BoardDAO 객체 생성
	BoardDAO bDAO = new BoardDAO();
	BoardBean bBean = new BoardBean();
	
	// 글의 총갯수 계산하는 매서드 
	 int cnt = bDAO.getBoardCount();
	%>
	
	<h2>게시판 목록 [총: <%=cnt %>개]</h2><br>
	
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>이름</td>
			<td>제목</td>		
			<td>내용</td>		
			<td>조회수</td>		
			<td>작성일</td>		
			<td>ip</td>		
		</tr>
	<%
	//저장된 모든글의 정보를 가져오는 메서드
	if(cnt > 0){ // cnt !=0
		bDAO.getBoardList();	
		ArrayList list = bDAO.getBoardList();
		
		for(int i=0;i<list.size();i++){
			bBean = (BoardBean)list.get(i);
			System.out.println(i);
	%>
		<tr>
			<td><%=bBean.getNum() %></td>
			<td><%=bBean.getName() %></td>
			<td><%=bBean.getSubject() %></td>		
			<td><%=bBean.getContent() %></td>		
			<td><%=bBean.getReadcount() %></td>	
			<td><%=bBean.getDate() %></td>					
			<td><%=bBean.getIp() %></td>		
		</tr>
	
	<%	}
		
	}else{
		out.println("----작성된 글이 없어요----^^");
	}
	%>		
	
	</table>
	<br>
	<a href="writeForm.jsp">글쓰기</a>
	
</body>
</html>