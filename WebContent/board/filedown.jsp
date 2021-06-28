<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/fileUpload/filedown.jsp</h1>
   
	<%
	//전달된 파라미터값 저장	   file_name=re2.gif
	String fileName = request.getParameter("file_name");
	
	//*서버에 업로드된 폴더명
	String savePath = "upload";
	
	//"upload" 폴더의 실제 물리적인 경로
	//프로젝트(=context) 
	ServletContext ctx = getServletContext();
	String sDownloadPath =  ctx.getRealPath(savePath);
	
		System.out.println("sDownloadPath: "+sDownloadPath);
	
	//파일을 다운로드할 전체경로를생성
	String sFilePath = sDownloadPath + "\\" +fileName;
	
		System.out.println("sFilePath: "+sFilePath);
	
	////////////////////////////////
	//파일저장시 한번에 큰 크기로 저장하는 배열 (buffer)
	byte[] b = new byte[4096];
	
	//파일 입출력 객체
	FileInputStream fis = new FileInputStream(sFilePath);
	
	//다운로드할 파일의 MIME 타입을 체크
	//MIME 타입: 클라이언트에게 전송되는 문서의 다양성을 표현하는 방법
	// 문서들은 MIME 타입의 데이터를 사용해 데이터를 전달. 
	//client브라우져에서 데이터를 받아 사용할떄 기본형태를 어떻게 사용할지 결정가능하기 때문.
	
	String sMimeType = getServletContext().getMimeType(sFilePath);
		System.out.println("sMimeType: "+sMimeType);
		
		if(sMimeType == null){
			sMimeType = "application/octet-stream";
	    	 // application/octet-stream 잘 알려지지 않은 이진파일을 의미
	    	 // 브라우저에서 자동으로 실행할지, 말지를 물어보는 타입	    	 
		}
		
	     // 응답할 페이지의 데이터 마임타입을 설정
	     response.setContentType(sMimeType);
	     
	     ////////////////////////////
	     //사용자의 브라우져정보를 체크(id)
	     String agent = request.getHeader("User-Agent");
	     System.out.println("agent: "+agent);
	     
	     boolean ieBrowser = 
	    	  (agent.indexOf("MSIE")>-1) || (agent.indexOf("Trident") > -1); //인덱스 >-1 :데이터존재
	    	  
	    //파일이름 한글처리	  
	    if(ieBrowser){
	    	//IE경우. 다운로드시 한글꺠짐. 공백문자는 +로 표시되므로 공백문자 (%20)으로 변경.
	    	fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
	    }else{
	    	fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
	    }
	    	  
	    //다운로드 창의 형태로 실행
	    //브라우저에서 읽어지는 파일의 형태도 다운로드 형태로 처리되게 설정
	    response.setHeader("Content-Disposition", "attachment; fileName= "+fileName);
	    
	    ///////////////////////
	    //응답객체를 사용. 데이터 출력통로 설정
	    ServletOutputStream out2 = response.getOutputStream();
	    
	    int numRead;
	    	//배열 0번지에서 길이만큼.
	    while( (numRead = fis.read(b,0,b.length)) !=-1){ //데이터 있는경우
	    	out2.write(b, 0, numRead);
	    }
	    	out2.flush();
	    	out2.close();
	    	fis.close();
	%>
</body>
</html>