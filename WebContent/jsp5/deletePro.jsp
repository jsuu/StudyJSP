<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h1>WebContent/jsp5/deletePro.jsp</h1>
	
	<%	request.setCharacterEncoding("utf-8");
		//전달된파라미터값 저장(delId, delPw)		
		String delID = request.getParameter("delID");
		String delPW = request.getParameter("delPW");
		
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	//1. 드라이버 로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공!");
	
	 // 2. 디비 연결
	Connection con =  DriverManager.getConnection(DBURL,DBID,DBPW);
	System.out.println("DB연결 성공!"+con);
	
	 // 3. sql 작성 & pstmt 객체 생성
	// pass가 DB에서 not null조건이므로 pass가 나온다면 회원, 안나오면 비회원
	String sql = "select pass from itwill_member where id=?";	
	PreparedStatement pstmt = con.prepareStatement(sql);
	//? 처리
	pstmt.setString(1, delID);
	 
	// 4. sql 실행
	ResultSet rs = pstmt.executeQuery();
	
	// 데이터처리	
	if(rs.next()){		
			//rs에 있다면, 회원이다 (위 sql문 설명참고)
			//본인여부판단. 비번이 맞는지 체크
			if(delPW.equals(rs.getString("pass"))){
				//회원이면서 비밀번호 동일 =>본인=> 수정/삭제 	
				//sql생성 & pstmt객체
				sql = "delete from itwill_member where id=?";
				
			    pstmt = con.prepareStatement(sql);  //항상 sql과 pstmt는 짝으로 있어야함*
				pstmt.setString(1, delID);
			    
			    // 4. sql 실행
				int result = pstmt.executeUpdate();
			    //sql문이 영향을 준 row갯수를 리턴.
			    //0: sql문이 영향x./ 실행오류 / DDL구문 
				System.out.println("회원탈퇴 성공!" + result);
				
			}else{
				// 회원이지만, 비밀번호 오류
				System.out.println("비밀번호 오류 입니다");
	    		System.out.println("아이디 또는 비밀번호 오류 입니다!");
			}
	}else{
		//비회원이다. 
		System.out.println("비회원 입니다");
	}
	
	
	
	
	%>
	
	
</body>
</html>