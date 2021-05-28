<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    // 데이터저장 -> 변수
    // 데이터를 연속적인 공간 -> 배열
    // 여러개의 데이터 저장 -> 클래스/객체
    // => 영구적인 사용 X
    //  => 영구적인 사용을 위한 방법 : 파일을 생성
    
        // 쿠키 : HTTP통신에서 사용자의 응답을 처리하고나서(서버-클라이언트는 끊김), 서버의 정보를
    //       	저장하기위한 정보(사용자의 HDD저장)
    // 크롬쿠키저장위치    C:\Users\ITWILL\AppData\Local\Google\Chrome\User Data\Default\Cache
    
   // * 쿠키는 브라우저가 종료해도 생존시간이 지정되면 그동안 데이터 삭제 X
   // (HDD에 파일로 저장)
   
   //세션: 서버의 정보를 저장, 서버에 저장.  (쿠키에 비해)상대적으로 보안상 중요데이터
   //쿠키: 서버의 정보를 저장, 클라이언트에 저장(사용자의 HDD), 일반데이터
   
   //쿠키: 이름,값,유효기간,도메인,경로,.... 구성됨
   //	 -이름은 알파벳과 숫자로 구성(공백,특수문자,사용가능 - 인코딩필요)   
   
   // 쿠키 생성 (서블릿 API사용)
   // Cookie cookie = new Cookie(이름,값);
   
   // 쿠키정보를 저장(response객체에 저장)
   //response.addCookie(쿠키객체);		//server == 쿠키준다==>  client
   
   //쿠키사용(request 객체애 있는 쿠키사용)
   // Cookie[] cookies = request.getCookies();	//객체배열   
   //쿠키의 정보는 객체배열의 형태로 사용.
   
   //객체: 보이는 모든 사물.  클래스: 객체를 만들기 위한 코드. 추상화된 속성 기능을 만든다.
   //객체로 사용하기 위해 메모리에 올린다(Load) => new , 인스턴스화  
   
   //* 객체배열
   //Cookie[] cookies = new Cookie[3];	객체레퍼런스 3개 생성
   
   //Cookie c = new Cookie();  x3 ?  =>  객체를 3개 만든거  (x) 이 의미는 아님.)
   
   //Cookie c;  x3 ?    		   =>  객체 배열의 생성 == 객체레퍼런스(객체 참조주소) 3개를 생성 (o)
   //Cookie c1; 
   //Cookie c2; 
   //Cookie c3;
   // 		c1 = new Cookie();
   //cookie[0] = new Cookie();
   
   //쿠키값 사용
   Cookie[] cookies = request.getCookies();	//서버로부터 add된 쿠키객체 배열 받음.
   
   String cName ="";
   String cValue ="";
   
   //쿠키값이 있을떄만 비교
   if(cookies !=null){   
   //생성된 쿠키값을 출력
	   	for(int i=0;i < cookies.length;i++){
	   		//쿠키값이름이 'name' 대상을 찾아 값을 사용
	   		if(cookies[i].getName().equals("name")){
	   			cName = cookies[i].getName();
	   			cValue = cookies[i].getValue();
	   		}
	   	}
   }
	%>
	<h1>WebContent/jsp3/cookieTest.jsp</h1>
	<h2>클라이언트</h2>
	<h3>쿠키이름: <%=cName %> </h3>
	<h3>쿠키값: <%=cValue %> </h3>
	
	  <input type="button" value="쿠키값 생성" onclick="location.href='cookieSet.jsp';">
	  <input type="button" value="쿠키값  삭제" onclick="location.href='cookieDel.jsp';">
</body>
</html>