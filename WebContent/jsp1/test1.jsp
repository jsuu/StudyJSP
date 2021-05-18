<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp1/test1.jsp</h1>
	
	<h2>JSP는 java와 html코드를 한번에 사용</h2>
	
	<!--html 주석: 브라우져에 영향이 없다.    F12 개발자화면에서 보인다. -->
	<%-- JSP주석:  브라우져에 영향가능성 있음.(내부적으로 무시)   F12개발자화면에서는 안보인다 --%>

	<%
		// java 영역
		/* java 주석 */
	%>	
	
	<h2>Java 개념정리</h2>
	<%
		//java코드사용
		//배열생성  -> "JAVA"  "JSP" "HTML"  "JAVASCRIPT"  정보저장/출력 콘솔창
 		String[] arr = new String[4];		// ==  String arr[]
 		arr[0]= "JAVA";
 		arr[1]= "JSP";
 		arr[2]= "HTML";
 		arr[3]= "JAVASCRIPT"; 
		
		for(int i=0;i<arr.length;i++){
			System.out.println(arr[i]);			
		}
		
		String[] arr2 = {"JAVA","JSP","HTML","JAVASCRIPT"};
		String[] arr3 = new String[]{"JAVA","JSP","HTML","JAVASCRIPT"};
		
// 		String[] arr4[];			//사용하지 않는게 좋다

		for(int i=0;i<arr.length;i++){
			//java코드 사용, html 브라우져에 출력!
			//	out.println(html코드);			
			out.println("<h3>"+arr[i]+"<h3>");			
		}

		for(int i=0;i<arr.length;i++){
	%>
		HTML코드: <%=arr[i] %><br>			<!-- %태그안에 =변수 삽입가능  -->
	<% 
		}
		//  %태그로 만들어진 코드는 연결되어있음
	%>
	<hr>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<% for(int i=0;i<arr.length;i++){ 
			%>
				<tr>
					<td><%=i+1 %></td>
					<td><%=arr[i] %></td>
				</tr>
			<%
			}
			%>
			
			
		</tr>
	</table>
	
	
	
</body>
</html>