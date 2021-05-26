<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionLoginPro.jsp</h1>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		   //본인정보와 비교 (itwill/1234)
		   String userID = "itwill";
		   String userPW = "1234";
		   
		if(id.equals(userID)){
			if(pw.equals(userPW)){
				out.print("로그인성공~^^");
				
				//세션영역에 로그인성공시 입력한 id값 저장.
				//세션영역에서 항상 확인가능.
				session.setAttribute("id", id);	//페이지 이동전 속성 저장
				session.setAttribute("pw", pw);
				response.sendRedirect("sessionMain.jsp");
				
			}else{
				out.print("아이디 같음, 비번이 틀렸네요~");				
			}			
		}else{
				out.print("아이디가 다릅니다(비회원)~");				
		}
		//session 생성
		
	%>
			
   <%	//쌤해법
//     // * 전달된 정보 저장(파라미터-id,pw)
//    String id = request.getParameter("id");
//    String pw = request.getParameter("pw");		   
   
//    //System.out.println("아이디 : "+id+",비밀번호 : "+pw);   
//    out.println("아이디 : "+id+",비밀번호 : "+pw);
//    //본인정보와 비교 (itwill/1234)
//    String userID = "itwill";
//    String userPW = "1234";
   
//    // == / equals()
//    // 1)  A == B  :	 논리형데이터(boolean)리턴   
//    //  - 기본형 : 기본형 값을 비교
//    //  - 참조형 : 객체의 주소를 비교
//    System.out.println(id.toString()+"/"+id.hashCode());
//    System.out.println(userID.toString()+"/"+userID.hashCode());
//    // 2) A.equals(B) : 논리형데이터 (boolean) 리턴
//    //   - 참조형 타입의 값을 같은지 다른지 비교(String 타입)
//    System.out.println( id.equals(userID) );
   
//    // 로그인 처리 로직
   
//    //if(id == userID){
//    if(id.equals(userID)){
// 	   System.out.println("아이디 같음");
// 	   if(userPW.equals(pw)){
// 		   System.out.println("본인 - 로그인 성공!");
// 		   // 페이지 이동
// 		   response.sendRedirect("sessionMain.jsp");
// 	   }else{
// 		   System.out.println("아이디 같음, 비밀번호 오류 !");
// 	   }	   
//    }else{
// 	   System.out.println("아이디 다름(비회원)");
//    }
   
   %>
	
</body>
</html>