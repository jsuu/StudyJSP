<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookiePro.jsp</title>
</head>
<body>
	<h1>WebContent/jsp4/cookiePro.jsp</h1>
	
	<%  //2. cookieForm에서 전달된 정보사용 쿠키값 생성
// 	String lang = request.getParameter("language");
// 	Cookie cookie = new("lang",lang);

	Cookie cookie = new Cookie("lang",request.getParameter("language"));   //아직은 메모리에만 올라가서 F12(HDD저장정보)에서는 안보임.
	
	// 3. 쿠키설정값 지정
	cookie.setMaxAge(60*60);	//3600s
	
	//4.쿠키정보를 사용자에게 전달 (HDD저장)
	response.addCookie(cookie);
	
	//5. cookieForm.jsp 페이지이동Js사용.(Js? 시각적으로 알수있게)
	%>
		<script type="text/javascript">
			alert("언어쿠키정보 생성!");
			location.href = "cookieForm.jsp";
		</script>
	
</body>
</html>