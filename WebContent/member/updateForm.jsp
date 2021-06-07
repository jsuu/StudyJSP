<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp5/updateForm.jsp</h1>
		
		<h2>회원정보수정</h2>
		<!-- DB에서 정보를 가져와 화면에 출력
			아이디 -> 수정불가, 
			비밀번호 표시안함.   그외 나머지정보느 모두 화면에 표시
		 -->
		<% 
		 String id = (String)session.getAttribute("id");
		 
		 if(id == null){
			 response.sendRedirect("loginForm.jsp");
		 }
		
	 // 2) DB에 있는 회원정보 모두를 가져오기
		 // 한글처리
    	request.setCharacterEncoding("utf-8");
   		 // 전달된 정보(id,pass) 저장
    			
    	String pass = request.getParameter("pass");
    	
	        // DB 접근해서 로그인 여부 판단
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
		String sql = "select * from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		//데이터처리
			String name = "";
			int age = 0;
			String gender = "";
			String email = "";
			
		if(rs.next()){
			
// 			id = rs.getString("id");  //위의 session에서 가져와도 돠고, DB에서 가져와도 된다
			name = rs.getString("name");
			age = rs.getInt("age");
			gender = rs.getString("gender");
			email = rs.getString("email");
		}
		
		//성별정보가 없는경우 기본값 설정
		 if(gender == null){
			 gender = "남자";
		 }
		%>
		
		<fieldset>
    		<form action="updatePro.jsp" method="post">
	    			아이디:<input type="text" name="id" readonly value="<%=id %>"><br>
	    			<!--
	    			readonly : 수정x .  읽기전용   해당input태그 사용가능
	    			disabled : 사용x.			해당input태그 사용불가능  다음페이지로 값을 못넘기게 된다
	    			  -->
	    			
	    			비밀번호:<input type="password" name="pass" placeholder="수정전 비밀번호를 입력요"><br>
	    			
	    			이름:<input type="text" name="name" value="<%=name %>"><br>
	    			나이:<input type="text" name="age" value="<%=age %>"><br>
	    			성별:<input type="radio" name="gender" value="남자"
	    			<%if(gender.equals("남자")) {%>
						checked	    			
	    			<%} %>
	    			>남  
	    			   <input type="radio" name="gender" value="여자"
	    			<%if(gender.equals("여자")) {%>
						checked	    			
	    			<%} %>
	    			   
	    			   >여<br>
	    			이메일:<input type="text" name="email" value="<%=email %>"><br>
	    			<hr>
    			<input type="submit" value=" 수정하기">    		
    		</form>
    		
    	</fieldset>
		
		
</body>
</html>