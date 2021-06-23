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
	<h1>WebContent/board/deletePro.jsp</h1>
	<%
		//한글처리
		request.setCharacterEncoding("utf-8");
	
		//전달된파라미터 저장
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
		
		//DAO객체 생성 -> 글삭제 메서드
		BoardDAO bDao = new BoardDAO();
		int check = bDao.deleteBoard(num, pass);
		
		// ->(-1 0 1)을 사용해 페이지이동 (Js)
	if(check == 1){
		
	%>
		<script type="text/javascript">
			alert("글정보 삭제완료!");
			location.href='list.jsp?pageNum=<%=pageNum %>';
		</script>	
	<%		
	}else if(check == 0){
	%>
		<script type="text/javascript">
			alert("글삭제 비밀번호 오류");
			history.back();
		</script>
	<%				
	}else{	//check == -1		
	%>		
		<script type="text/javascript">
			alert("해당글이 없네용^^");
			history.back();		
		</script>
	<%		
		
	}
	%>
	
	%>
	

</body>
</html>