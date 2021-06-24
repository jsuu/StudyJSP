<%@page import="java.io.ObjectInputStream.GetField"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/fileUpload/fileUploadPro.jsp</h1>
	<%
	//1. 파일업로드
	// 라이브러리 설치 cos.jar
	//  WebContent/upload폴더 생성  (가상경로)
	//업로드 파일크기 제한.(10MB)
	
	int maxSize = 10*1024*1024;  //10MB
	String realPath = request.getRealPath("/upload");	//실제업로드 경로
// 	String realPath = "D:/fileup";	//	진짜경로는 보안 취약
	System.out.println("realPath: "+ realPath);	
	
	//파일업로드
	MultipartRequest multi = new MultipartRequest(
								request,
								realPath,
								maxSize,
								"UTF-8",
								new DefaultFileRenamePolicy()
								);
	//파일업로드 완료
	System.out.println("파일업로드 완료 !----------------");
	
	//2. 나머지 데이터처리
// 	String name = request.getParameter("name");			//null
// 	String subject = request.getParameter("subject");
// 	String file = request.getParameter("file");

	//MultipartRequest 객체에 request정보가 들어있다.
	String name = multi.getParameter("name");
	String subject = multi.getParameter("subject");
// 	String file = multi.getParameter("file");		// 안된다 ㅠ
	String file = multi.getFilesystemName("file");	//DefaultFileRenamePolicy()에 의해 파일명 재정의
	String O_file = multi.getOriginalFileName("file");
	
	%>
	
	이름: <%=name %><br>
	글 제목: <%=subject %><br>
	파일명(서버에 저장되는 파일명):<%=file %><br>
	파일명(실제 파일명):<%=O_file %><br>
	
	<hr>
	
<!-- 			 해당브라우져에 parser가 포함된경우.바로 실행되는 형태로처리.
				        parser가 없는경우 다운로드 형태로 처리.
	 -->
	<h2>		
	파일명(서버에 저장되는 파일명):
		  <a href="../upload/<%=file%>"><%=file %></a>
	</h2>
	<h2>		
	다운로드:
       <a href="filedown.jsp?file_name=<%=file%>"><%=file %></a>
	</h2>
	
	
	
</body>
</html>