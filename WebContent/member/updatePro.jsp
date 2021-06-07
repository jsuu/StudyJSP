<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/jsp5/updatePro.jsp</h1>
	<%
	// 1) 로그인 세션 제어
 		String id = (String)session.getAttribute("id");	
		if(id==null){
			response.sendRedirect("loginForm.jsp");
		}
	
		//한글처리 (왜?  <form action=..   method="post">)
		request.setCharacterEncoding("utf-8");
		
		//전달되는 파라미터값 모두 저장
		//pass, name, age,gender,email
		String pass = request.getParameter("pass");	
		String name = request.getParameter("name");	
		int age = Integer.parseInt(request.getParameter("age"));	
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
				
		//전달받은 정보를 DB에 저장후 페이지 이동.
		// 1. 드라이버 로드
	    final String DRIVER = "com.mysql.jdbc.Driver";
	    final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	    final String DBID = "root";
	    final String DBPASS = "1234";
    
	    Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공!");
	
	    // 2. 디비연결
	    Connection con = DriverManager.getConnection(DBURL,DBID,DBPASS);	
	    
	    System.out.println("DB연결 성공!"+con);
	    
		// 3. sql(insert) & pstmt 객체 
		String sql = "select pass from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//?
		pstmt.setString(1, id);
		//4. sql실행
		ResultSet rs = pstmt.executeQuery();
		
		// 5 데이터 처리  (update)
		//  본인일때만 수정 (pass 데이터로) ==> main.jsp 페이지
		//  회원 X, 비밀번호 오류 => 수정X, 뒤로가기
		
		if(rs.next()){	//pass가 조회된다 => 회원정보 가 있다.
					
			if(pass.equals(rs.getString("pass"))){
				//본인
				
			// 3 sql 작성 & pstmt 객체 생성
				sql = "update itwill_member set name=?,gender=?,age=?,email=? where id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, name);			
				pstmt.setString(2, gender);			
				pstmt.setInt(3, age);			
				pstmt.setString(4, email);
				pstmt.setString(5, id);
			 
			 // 4 sql 실행
				pstmt.executeUpdate();
				%>
				<script type="text/javascript">
					alert("회원정보 수정완료!");
					location.href="main.jsp";
				</script>
				
				<%
				//JSP가 js보다 실행우선순위가 더 높으므로 js를 삽입시 순서에 유념해야 한다. 
				
				}else{
				//회원정보 o , 비번 오류
				%>
				<script type="text/javascript">
					alert("비밀번호 오류!  수정불가!");
					history.back();
				</script>
				
				<%
				 
				}
		}else{
	// 회원정보가 없음
			 %>
			  <script type="text/javascript">
			     alert("회원정보 오류  수정불가.");
			     history.back();
			  </script>			  
			  <%
		}
		
	
	%>
	
	
	
	
	
</body>
</html>