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
	<h1>WebContent/jsp5/delete.jsp</h1>
		<!--
			deleteForm.jsp 삭제될정보입력
			deletePro.jsp  전달받은  정보를 사용 db에 회원삭제.
	  -->
  <%
	  String id = (String)session.getAttribute("id");
	  String pass = (String)session.getAttribute("pass");
	    System.out.println("pass: "+pass);
	  
	  if(id == null){
		  response.sendRedirect("loginForm.jsp");
	  }
	  
  
		// 1. 드라이버 로드
	    final String DRIVER = "com.mysql.jdbc.Driver";
	    final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	    final String DBID = "root";
	    final String DBPASS = "1234";
  
	    Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공!");
	
	    // 2. 디비연결
	    Connection con = DriverManager.getConnection(DBURL,DBID,DBPASS);	
	    
	    System.out.println("DB연결 성공! con: "+con);
	    
	    
		// 3. sql(insert) & pstmt 객체 
		String sql = "select pass from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		//4. sql실행
		ResultSet rs = pstmt.executeQuery();

		
		// 5. 데이터 처리  (delete)
		//  본인일때만 삭제 (pass 데이터로) ==> main.jsp 페이지
		//  회원 X, 비밀번호 오류 => 삭제X, 뒤로가기
		
		//pass가 조회된다 => 회원정보 가 있다.
		if(rs.next()){	
			
			if(pass.equals(rs.getString("pass"))){
				
				// 6. sql 작성 & pstmt 객체 생성
				sql = "delete from itwill_member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				 // 4 sql 실행
				pstmt.executeUpdate();
			%>
			<script type="text/javascript">
				alert("회원정보 삭제완료!");
				location.href="loginForm.jsp";
			</script>
			<%	 
			}else{
			%>
				<script type="text/javascript">
					alert("비밀번호 오류!  삭제불가!");
				</script>
			<%		
			}			
			
		}else{
			//비회원
		%>
			<script type="text/javascript">
				alert("회원이 아니네요~ 삭제불가!");
				history.back();
			</script>
		<%
		}		
	  	%>
</body>	  
</html>