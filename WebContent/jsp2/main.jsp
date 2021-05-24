<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="myColor.jspf" %>		<%-- 특정값을 가져올떄 --%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main.jsp</title>
</head>
<%
// 	String page_color ="lime";

%>

<%-- <body bgcolor='<%=page_color%>'> --%>
<body bgcolor= "<%=myCol3 %>">		
  <h1>WebContent/jsp2/main.jsp</h1>	
  <h2>웹페이지 템플릿</h2>
  <table border="1" width="600" height="600">
  	<tr>
  		<td colspan="2" height="100">
  			<jsp:include page="top.jsp">		
  				<jsp:param value="itwill" name="id"/> 		
   			</jsp:include>	
  		</td>
  	</tr>
  	<tr>
  		<td width="100">
  			<jsp:include page="left.jsp"></jsp:include>  			
  		</td>
  		<td>center</td>  		
  	</tr>
  	<tr>
  		<td colspan="2" height="100">
  			<jsp:include page="bottom.jsp"></jsp:include>
  		</td>
  	</tr>
  </table>
</body>
</html>