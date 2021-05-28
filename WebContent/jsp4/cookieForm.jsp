<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>WebContent/jsp4/cookieForm.jsp</h1>
		<% //메시지출력 ("안녕하세요~ 쿠키연습" , "Hello Cookie Test~")
			//cookiePro.jsp로 언어정보 전달(라디오button 사용)
			//생성된 쿠키정보에 따른 출력.
		
			//6. 생성된 쿠키값에  따라 출력메시지 변경
			//7. 쿠키값을 request해서 가져오기
			Cookie[] cookies = request.getCookies();	// request.getCookies() 리턴값은 무조건 배열이다.
		
			//8. 쿠키배열값을 모두 비교후 원하는 정보 사용
			//9. 출력을위한 언어정보 저장변수
			String lang = "kor";	//값을 초기화.
				
			if(cookies != null){
				for(int i=0;i<cookies.length;i++){
					if(cookies[i].getName().equals("lang")){
						out.print(cookies[i].getValue());
						lang = cookies[i].getValue();	//가져온 쿠키값을 변수에 저장.
					}
				}//for
			}
			// 10.언어선택 결과출력
			if(lang.equals("kor")){
				out.print("안녕하세요~ 쿠키연습");
			}else{
				out.print("Hello Cookie Test~");
			}
			
			//1. 쿠키값을 생성하기 위한 데이터전달
		%>
		<form action="cookiePro.jsp" method="post">
			<input type="radio" name="language" value="kor" 
				<% if(lang.equals("kor")) {%>	
				checked="checked"
				<%} %>
				>한국어						
			<input type="radio" name="language" value="eng"
			<% if(lang.equals("eng")){%>
			checked="checked"
			<%} %> >영어
			<input type="submit" value="언어설정">
		</form>
		
</body>
</html>