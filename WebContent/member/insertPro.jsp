<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp5/insertPro.jsp</h1>
	<%
		//한글처리
		request.setCharacterEncoding("utf-8");
	
		//전달정보 저장(파라미터)
		//id,pass,name,age,gender,email
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		

    // 날짜 정보생성 (DB에 컬럼은 있는데,파라미터로 안받으므로)
    //내 시스템시간정보를 저장.	
    Timestamp reg_date = new Timestamp(System.currentTimeMillis());
    
    // DB연결 후 회원 가입
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
    String sql = "insert into itwill_member values(?,?,?,?,?,?,?)"; 
    PreparedStatement pstmt = con.prepareStatement(sql);
        
    // 4. sql 실행
    pstmt.setString(1, id);
    pstmt.setString(2, name);
    pstmt.setString(3, gender);
	pstmt.setInt(4, age);
    pstmt.setString(5, pass);
    pstmt.setString(6, email);
    pstmt.setTimestamp(7, reg_date);
	
    pstmt.executeUpdate();
    
    
    // 로그인페이지로 이동(loginForm.jsp)
//     response.sendRedirect("loginForm.jsp");
    
	%>
	
	<script type="text/javascript">
	   alert(" 회원가입 성공! 로그인페이지로 이동! ");
	   location.href="loginForm.jsp";
	</script>
	
</body>
</html>