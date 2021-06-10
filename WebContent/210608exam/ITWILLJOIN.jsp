<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	
	function fun1(){
		var idLen = document.fr.id.value.length;
		if (document.fr.id.value == ""){
			alert("id가 입력되지 않았습니다");
			document.fr.id.focus();
			return false;
		} 		
		if(idLen < 5 || idLen > 10) {
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
	
	function fun2(){
		var ju2 = document.fr.ju2.value.charAt(0);
			alert(ju2);
			
		if (ju2 == 1 || ju2 ==3) {

// 			document.fr.gender.value = "남";
// 			document.fr.gender[0].click();
			document.fr.gender[0].checked = true; 
		}
		
		if (ju2 == 2 || ju2 ==4) {

// 			document.fr.gender[1].click();
			document.fr.gender[1].checked = true; 

		}
	}
	
	
	</script>
</head>
<body>
	<h2>회원가입 -정수영</h2>
	
	<!--
	 정보입력 - text, 
        비밀번호 - password
        성별 - radio / 취미 - checkbox
        버튼 - submit,reset
	  -->
	
	<fieldset>
	<legend>ITWILL 회원가입</legend>
		<form action="ITWILLJOINPRO.jsp" method="post" name="fr"  onsubmit="return fun1();">
		아이디: <input type="text" name="id"><br>
		비밀번호: <input type="password" name="pw1"><br>
		비밀번호확인: <input type="password" name="pw2"><br>
		이름: <input type="text" name="name"><br>
		주민번호: <input type="text" name="ju1"> - <input type="text" name="ju2" onblur="fun2();"> <br>
		성별: 
			 <input type="radio" name="gender" value="남">남 
			 <input type="radio" name="gender" value="여">여 <br>
		취미: <input type="checkbox" name="hobby" value="여행">여행
			 <input type="checkbox" name="hobby" value="독서">독서 
			 <input type="checkbox" name="hobby" value="게임">게임 <br>
		좋아하는과목: <select name="subject" ><br>
					<option value="">선택하세요</option>
					<option>수학</option>
					<option>영어</option>
					<option>음악</option>
				</select>
				<br>	
		한마디: <textarea rows="10" cols="50" name="message"></textarea>
			<hr>
			<input type="submit" value="회원가입">
			<input type="reset" value="처음으로">
			
		</form>	
	</fieldset>
</body>
</html>