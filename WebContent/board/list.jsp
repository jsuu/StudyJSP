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
	
	// 글의 총갯수 계산하는 매서드 
	 int cnt = bDAO.getBoardCount();
	
	//// paging  ////////////////////////
	//처리
	
//한페이지에 출력할 글갯수
	int pageSize =3;	//한페이지에 보여줄 글갯수
	
	//현재 페이지의 위치정보
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";  //DB에는 필요없지만 페이지가 바뀔때마다,파라미터로 넘겨야한다(param넘길때  String타입으로 바뀜)	
	}
	
	//각페이지당 시작행번호 계산   1.... 11 .... 21....
	int currentPage = Integer.parseInt(pageNum); //현재페이지.  계산해야하므로 숫자로.
	int startRow = (currentPage-1)*pageSize + 1;
				  		// (1-1)*10 +1 = 1
				 		// (2-1)*10 +1 = 11				  
				 	 	// (3-1)*10 +1 = 21 
	
	// 끝행번호계산.     10....20....30....
	int endRow = currentPage * pageSize;
	
	////////////////////////	
	
	%>	
	
	
	<h2>게시판 목록 [총: <%=cnt %>개]</h2><br>
	<a href="writeForm.jsp">글쓰기</a><br><br>
	
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>		
			<td>이름</td>
			<td>작성일</td>		
			<td>조회수</td>		
			<td>ip</td>		
		</tr>
	<%
	ArrayList boardList = null;
	//저장된 모든글의 정보를 가져오는 메서드
	if(cnt > 0){ // cnt !=0
// 		boardList = bDAO.getBoardList();
		boardList = bDAO.getBoardList(startRow, pageSize);	//페이지당 일정글갯수 표시
		
//		System.out.println(boardList.toString());
//		System.out.println(boardList);   //ArrayList가 Object의 toString()을 상속받으므로 따로 표시않아도 됨
		
    	// size() : 가변길이 배열의 요소의 수를 리턴하는 메서드
		for(int i=0;i<boardList.size();i++){
			
			BoardBean bBean = (BoardBean)boardList.get(i);	//downcast'
			System.out.println(i);
	%>
		<tr>
			<td><%=bBean.getNum() %></td>
			<td><%=bBean.getSubject() %></td>		
			<td><%=bBean.getName() %></td>
			<td><%=bBean.getDate() %></td>					
			<td><%=bBean.getReadcount() %></td>	
			<td><%=bBean.getIp() %></td>		
		</tr>
	
	<%	}
		
	}else{
		out.println("----작성된 글이 없어요----^^");
	}
	%>		
	</table>
	<hr>
	
	<%
	////////////////  page링크 버튼   //////////////////////////
	if(cnt >0){
//한페이지에서 보여줄 페이지번호버튼 갯수
		int pageBlock = 2;
		
		//전체페이지갯수  (10의 배수보다 크면  +1 한다)
		int pageCount = cnt / pageSize + (cnt % pageSize ==0? 0:1);
		
		//페이지 블럭당 시작번호계산.   1~10=>1   11~20 =>11,  21~30 => 21
		int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		
		//페이지 블럭당 끝번호계산.    
		int endPage = startPage + pageBlock -1;

		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		//[이전]버튼
		if(startPage > pageBlock){
			%>
				<a href="list.jsp?pageNum=<%=startPage - pageBlock %>">[이전]</a>
			<%
		}		
				
		//[1...10][11...20][21...30]....
	 	for(int i=startPage;i<=endPage;i++){
			%>
			 <a href="list.jsp?pageNum=<%=i%>">[<%=i %>]</a>
			
			<% 
		}
		
		//[다음]버튼 *현재 페이지에서 다음페이지  있어야한다
		if(endPage < pageCount){
			%>
				<a href="list.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a>
			<%
		}
	}
	////////////////////////////////////////////////////
	%>
</body>
</html>