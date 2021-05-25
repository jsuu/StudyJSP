<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scopePro.jsp</title>
</head>
<body>
	<%
	//영역객체 생성(데이터-속성을 생성)
	pageContext.setAttribute("pc", "  페이지영역에 저장된 값");
	request.setAttribute("rq", "request영역정보 저장");
	session.setAttribute("se", "session영역정보 저장");
	application.setAttribute("ap", "application 영역정보 저장");
	%>
 <h1>WebContent/jsp2/scopePro.jsp</h1>
	<% 
	String id = request.getParameter("id"); 
	String pw = request.getParameter("pw"); 
	%>
		아이디: <%=id %>
	
	
	
	<h2>영역객체정보 출력</h2>
	pageContext 객체정보(pc속성값을 출력):		<%=pageContext.getAttribute("pc") %> <br>
	request 객체정보:						<%=request.getAttribute("rq") %> <br>
	session 객체정보:						<%=session.getAttribute("se") %> <br>
	application 객체정보:					<%=application.getAttribute("ap") %> <br>
	
	
	
	
	<h2>페이지이동(+ 데이터)</h2>
	
	<h3>1) a태그 이동 (파라미터,session,application 정보사용 가능)</h3>		
		<a href="scopeProAction.jsp?id=<%=id %>&pw=<%=pw %>">scopeProAction.jsp 페이지이동</a>			
	
	<h3>2) Js 사용 이동 (파라미터,session,application 정보사용 가능)</h3>
		<script type="text/javascript">
		//	alert("Js사용 페이지이동");		// 한 페이지에 JSP사용 이동이 같이 있다면 우선권에 의해 Js이동은 무시.
		//	location.href= 'scopeProAction.jsp?id=<%=id%>&pw=<%=pw %>';
		</script>
	
	<h3>3) JSP 사용 이동</h3>
		<%
		//	response.sendRedirect("scopeProAction.jsp?id="+id+"&pw="+pw);
		%>

	<!-- p.222 액션태크 -->
	<h3>4) 액션태그 사용 이동</h3>
	<!-- 
	forward방식 이동(포워딩): 페이지이동시 request, response객체정보를 저장후 이동.
						페이지이동시 주소변경이 없다.  화면은 forward에 지정페이지로 변경됨.
						주소: pro.jsp
						화면:	 proAction.jsp
						
	 -->
	  <jsp:forward page='scopeProAction.jsp'>
		<jsp:param value="0000" name="pw"/>
	  </jsp:forward>
	
	  <%
//     RequestDispatcher dis =
//       request.getRequestDispatcher("scopeProAction.jsp");
//     dis.forward(request, response);
  	  %>
	
</body>
</html>