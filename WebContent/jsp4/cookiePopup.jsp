<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookiePopup.jsp</title>
<script type="text/javascript">
	//setPopupStart(this);  this: 이벤트발생한객체. 여기서는 (클릭시 호출코드)checkbox태그
	function setPopupStart(obj) {
	// 		alert("check버튼클릭");
		//쿠키정보생성(시간정보 저장)
		if(obj.checked == true){
			var expireDate = new Date();	//현재시간 정보저장 객체
			expireDate.setMonth(expireDate.getMonth()+1); //+1달
			
			// 쿠키이름=쿠키값; path=경로; expires = 기간;
			document.cookie = "notShowPop="+"true"+";path=/; expires="+
           													 expireDate.toGMTString();
			
  		 alert( document.cookie );
		  
		  window.close();
		}
	}

</script>

</head>
<body bgcolor="lime">
   <h1>cookiePopup.jsp</h1>
   <h2> ITWILL 광고 이벤트 입니다. </h2>
   <br><br><br><br><br><br><br><br><br><br><br><br><br>
 
   <input type="checkbox" onclick="setPopupStart(this);">오늘은 더이상 팝업창 안보기
</body>
</html>