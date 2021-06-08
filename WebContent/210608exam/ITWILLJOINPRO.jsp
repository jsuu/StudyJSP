<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ 
page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	ITWILLJOINPRO.jsp
	<h2>회원목록 - 정수영</h2>
	
	<%  
	// 한글처리
	request.setCharacterEncoding("utf-8");
	
		//전달정보 저장(파라미터)
	String id = request.getParameter("id");
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
	String name = request.getParameter("name");
	int ju1 = Integer.parseInt(request.getParameter("ju1"));
	int ju2 = Integer.parseInt(request.getParameter("ju2"));

	String gender = request.getParameter("gender");
	
	String hobby = request.getParameter("hobby");
	
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");
	
		
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
    String sql = "insert into itwill_join values(?,?,?,?,?,?,?,?,?,?)"; 
    PreparedStatement pstmt = con.prepareStatement(sql);
        
    // 4. sql 실행
    pstmt.setString(1, id);
    pstmt.setString(2, pw1);
    pstmt.setString(3, pw2);
	pstmt.setString(4, name);
    pstmt.setInt(5, ju1);
    pstmt.setInt(6, ju2);
    pstmt.setString(7, gender);
    pstmt.setString(8, hobby);
    pstmt.setString(9, subject);
    pstmt.setString(10, message);
	
    pstmt.executeUpdate();
	//데이터처리
	
	  // DB에서 모든 회원정보 출력 (관리자 제외)
	%>
	<table border="1">
	  <tr>
        <td>아이디</td>
        <td>비밀번호</td>
        <td>비밀번호확인</td>
        <td>이름</td>
        <td>주민번호앞자리</td>
        <td>주민번호뒷자리</td>
        <td>성별</td>
        <td>취미</td>
        <td>좋아하는과목</td>
        <td>한마디</td>
      </tr>

      <tr>
        <td><%=id %></td>
        <td><%=pw1 %></td>
        <td><%=pw2 %></td>
        <td><%=name %></td>
        <td><%=ju1 %></td>
        <td><%=ju2 %></td>
        <td><%=gender %></td>
        <td><%=hobby %></td>  
        <td><%=subject %></td>
        <td><%=message %></td>
      </tr>
	</table>	
	
</body>
</html>