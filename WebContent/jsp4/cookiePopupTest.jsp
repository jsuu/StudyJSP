<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	
		// 페이지온로드 이벤트(window.onload) 발생시  pageLoad();호출
		window.onload = pageLoad();

		function pageLoad(){
			var notShowPop = getCookieValue();
			
			if(notShowPop != "true"){
			// 새창(팝업)열기
		window.open("cookiePopup.jsp","","width=450,height=500, left=200, top=300");
			}
			
		}
		
		function getCookieValue(){
			var result = "false";
			//쿠키정보 확인해서 해당쿠키를 체크
			if(document.cookie !=""){	// cookie정보가 있다면
				var cookie = document.cookie.split(";");	// ;단위로 나눠 배열로 반환
				
				for(var i=0;i<cookie.length;i++){
				//	위에서 반환된 배열을꺼내 다시  =단위로  나눠 배열로 반환 (여기서는 속성 과 값 구분)
					var element = cookie[i].split("=");
					var nameValue = element[0]; 	//notShowPop
					//  \ s(문자열 공백) 을 제거의미
					 nameValue = nameValue.replace(/^\s*/, '');
					
					//쿠키name이 notShowPop 쿠키를 찾아,
					if (nameValue =="notShowPop"){		// notShowPop: 쿠키이름
						//쿠키값을  result변수에 저장
						result = element[1];	// 이름=값 중에 값이다
					  }
				  }
			   }	   
			   return result;
		   }
		
		   function popUpReStart(){
			   document.cookie = "notShowPop="+"false"+";path=/; expires=-1";
			   alert( document.cookie );
		   }
	</script>
</head>
<body>
<h1>WebContent/jsp4/cookiePopupTest.jsp</h1>
	
	<h2>쿠키사용한 팝업예제 (Js사용 ) </h2>
	  <input type="button" value="팝업 허용하기"  onclick="popUpReStart();">
</body>
</html>