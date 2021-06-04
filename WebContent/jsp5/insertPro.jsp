<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
%>


<h2>JSP- MySql연결</h2>
<%
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	// 0) 필요한 드라이버파일 설치 (API/라이브러리) 프로젝트당 한번만 해도 됨
	//  1) 설치된 드라이버를 로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	
	// 2)드라이버를 사용,DB연결
	Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
	System.out.println("DB연결 성공!");
	System.out.println("연결정보: "+con);
	
	//3. sql 궈리작성 & stmt 실행객체
//	String sql = "insert into itwill_member(id,pass,email) values('itwill2','1234','test2@itwill.com')"; //값을직접
//	String sql = "insert into itwill_member(id,pass,email) values('"+id+"','"+pass+"','"+email+"')";   //변수
	String sql = "insert into itwill_member(id,pass,email) values(?,?,?)";							
	
	
	 // Statement 객체 : jdbc사용해서 SQL구문을 작성하고, 실행하도록 도와주는 객체 
	  //Statement stmt = con.createStatement();    values(?,?,?) 는 Statement객체로 사용할 수 없다
	 // PreparedStatement:  Statement객체에 비해, (sql)파라미터를 가진다. 처리속도 더 빠름.
	  PreparedStatement pstmt = con.prepareStatement(sql);   
	
	
    // ? 값 넣기
    // DB 테이블에 있는 컬럼의 타입에 따라서 메서드가 변경
    // pstmt.setXXXXX(?위치 ,?들어갈 값 );	
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, email);
	
	//4. sql구문실행
	//stmt.executeUpdate(sql);
	
	pstmt.executeUpdate();		//insert, update, delete 구문실행	
 // pstmt.executeQuery();	//select 구문실행
	
	System.out.println("insert 구문실행완료!");

%>
	
<%=id %><br>
<%=pass %><br>
<%=email %>

	
</body>
</html>