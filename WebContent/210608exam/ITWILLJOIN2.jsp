<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	// *submit이벤트 발생시 처리.
	// 1)값입력, check/select 선택여부 판단
	// 2)아이디의 길이가 5~10자리인지 판단 
	// 3) 비닐번호/비닐번호확인 이  같은 데이터
	// 4) 주민번호 앞자리 6 / 뒷자리 7자리인지 판단
	// 모든 이벤트 처리는 동작을 만족하지 않는경우, 메세지와 함꼐 다음동작이 실행되지 않도록.

	
	function fun1(){
		var idLen = document.fr.id.value.length;
		if (document.fr.id.value == ""){
			alert("id가 입력되지 않았습니다");
			document.fr.id.focus();
			return false;
		} 		
		if(idLen <5 || idLen >10) {
			alert('아이디가 '+idLen+'자리입니다!    5~10자로 넣어주세용');
			document.fr.id.focus();
			return false;
		}		

		var PW1 = document.fr.pw1.value;
		var PW2 = document.fr.pw2.value;
		if (PW1 == ""){
			alert("비밀번호가 입력되지얺았습니다");
			document.fr.pw1.focus();
			return false;
		} 
		if(PW1 != PW2) {
			alert("비밀번호가 일치하지 않네요");
			document.fr.pw2.focus();			
			return false;
		}
		
		if (document.fr.name.value == "") {
			alert("이름이 입력되지얺았습니다");	
			document.fr.name.focus();
			return false;
		}
						
		 var JU1 = document.fr.ju1.value.length;
		 var JU2 = document.fr.ju2.value.length;
		 
		 if (JU1 !=6) {
			alert("주민번호 앞자리 6자리로 넣어주세요");
			document.fr.ju1.focus();
			return false;
		}
		 if (JU2 !=7) {
			alert("주민번호뒷자리 7자리로 넣어주세요");
			document.fr.ju2.focus();
			return false;
		}
		 if (document.fr.gender[0].checked == false && 
			 document.fr.gender[1].checked == false) {
			alert("성별을 선택해 주세요");
			return false;
		}
		 if (document.fr.hobby[0].checked == false && 
			 document.fr.hobby[1].checked == false &&
			 document.fr.hobby[2].checked == false) {
			alert("취미를 체크해 주세요");
			return false;
		}
		 
// 			alert(document.fr.subject.options[0].text);
// 		 if (document.fr.subject.options[1].selected == false && 
// 			 document.fr.subject.options[2].selected == false &&
// 			 document.fr.subject.options[3].selected == false) {
		if (document.fr.subject.options[0].selected) {
			alert("좋하는과목을 선택해 주세요");
			document.fr.subject.focus();
			return false;
		}
		 
		 if (document.fr.message.value =="") {
			 alert("메시지를 입력해 주세요");	
			 return false;
		}
	}
	
	
	</script>
</head>
<body>
	<h1>WebContent/js3/test6.html</h1>
	<h2>회원가입 -정수영</h2>
	
	<!--
	 정보입력 - text, 
        비밀번호 - password
        성별 - radio / 취미 - checkbox
        버튼 - submit,reset
	  -->
	
	<fieldset>
		<form action="a.jsp" method="post" name="fr"  onsubmit="return fun1();">
		아이디: <input type="text" name="id"><br>
		비밀번호: <input type="password" name="pw1"><br>
		비닐번호확인: <input type="password" name="pw2"><br>
		이름: <input type="text" name="name"><br>
		주민번호: <input type="text" name="ju1"> - <input type="text" name="ju2"> <br>
		성별: <input type="radio" name="gender">남 
			 <input type="radio" name="gender">여 <br>
		취미: <input type="checkbox" name="hobby">여행
			 <input type="checkbox" name="hobby">독서 
			 <input type="checkbox" name="hobby">게임 <br>
		좋아하는과목: <select name="subject" ><br>
					<option value="">선택하세요</option>
					<option>수학</option>
					<option>영어</option>
					<option>음악</option>
				</select>
				<br>	
		메시지: <textarea rows="10" cols="50" name="message"></textarea>
			<hr>
			<input type="submit">회원가입
			<input type="reset">처음으로
			
		</form>	
	</fieldset>
	
	
</body>
</html>