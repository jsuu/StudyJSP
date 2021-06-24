<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	<h1>WebContent/board/fWritePro.jsp</h1>
	
	<%	
		//한글처리  post방식 은 한글꺠질수 있다.
		request.setCharacterEncoding("utf-8");
	
		//파일 업로드		
	int maxSize = 10*1024*1024;  //10MB
	String realPath = request.getRealPath("/upload");	//실제업로드 경로
// 	String realPath = "D:/fileup";	//	진짜경로는 보안 취약
	System.out.println("realPath: "+ realPath);	
	
	//파일업로드
	MultipartRequest multi = new MultipartRequest(
								request,
								realPath,
								maxSize,
								"UTF-8",
								new DefaultFileRenamePolicy()
								);
	String file = multi.getOriginalFileName("file"); 
	//파일업로드 완료
	System.out.println("파일업로드 완료 !----------------");
		
		
	//파일 다운로드 (content.jsp 에서 )
		
	%>
		
<!-- 		글정보를 객체에 저장(BoardBean) -->
<!-- 		파일은 파일이름만 저장 -->
		<!--bb변수명으로 객체생성  -->
		<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"></jsp:useBean>
		
		<!-- form에서 전달된 모든정보 저장  -->
		<jsp:setProperty property="*" name="bb"/>
		
		<%
		bb.setFile(file);
		bb.toString();
		
		System.out.println(bb);
		//BoardDAO객체생성 글저장.  
		BoardDAO bDAO = new BoardDAO();
		
		//insertBoard() 메서드이용
		bDAO.insertBoard(bb);
		
		//리스트페이지로 이동.
		response.sendRedirect("list.jsp");
		%>
		
</body>
</html>