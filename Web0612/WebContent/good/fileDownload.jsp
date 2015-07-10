<%@page import="javafx.application.Application"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<html>
<head><title>[fileSelectSave]</title>
	<style type="text/css">
		a{font-size:22pt; text-decoration:none; }
		a:hover{ 
		 	font-size:24pt; color:blue; 
			font-family:Comic Sans MS;
		}
		input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
<body>
	<%
		String data1 = request.getParameter("file_name") ;
	%>

	<font size=6><b> [filedownload.jsp=단독실행X] </b></font><p>
	넘어온파일: <%= data1 %><br>

	<img src="<%=request.getContextPath()%>/good/<%=data1%>">
	
	<font size=7>
		<a href="fileSelect.jsp">[파일업로드등록화면fileSelect.jsp]</a>
	</font>
	
	<%
    String fileName = request.getParameter( "file_name" );

     String savePath = "good";
     ServletContext context = config.getServletContext();//    \Web0612
     String sDownloadPath = context.getRealPath(savePath);//   \Web0612\good
     //new File( sDownloadPath).mkdir(); 
     String sFilePath = sDownloadPath + "\\" + fileName;		//   \Web0612\good\fileName
     
     
	//자바의 io처리가 기본이 byte라서 바이트 배열로 받아서 
   byte b[] = new byte[4096];
   //File oFile = new File(sFilePath);
  
   FileInputStream in = new FileInputStream(sFilePath); //원본
   //String sMimeType = getServletContext().getMimeType(sFilePath);
   //System.out.println("sMimeType>>>"+sMimeType );
   // octet-stream은  8비트로 된 일련의 데이터를 뜻합니다. 지정되지 않은 파일 형식을 의미합니다.
   //if(sMimeType == null) sMimeType = "application/octet-stream";

   //response.setContentType(sMimeType);
   //한글 업로드 (이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다.)
   String sEncoding = new String(fileName.getBytes("euc-kr"),"8859_1");
   response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding); //fileName
   ServletOutputStream out2 = response.getOutputStream();
   int numRead;

   // 바이트 배열b의 0번 부터 numRead번 까지 브라우저로 출력
   while((numRead = in.read(b, 0, b.length)) != -1) {
    out2.write(b, 0, numRead);
   }
   out2.flush(); 
   out2.close();
   in.close();

 //  ServletUtils.returnFile( PdsMisc.UPLOAD_DIRECTORY + File.separator + StringMisc.uniToEuc( fileName ), response.getOutputStream() );
%>
</body>
</html>










