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

	<font size=6><b> [filedownload.jsp=�ܵ�����X] </b></font><p>
	�Ѿ������: <%= data1 %><br>

	<img src="<%=request.getContextPath()%>/good/<%=data1%>">
	
	<font size=7>
		<a href="fileSelect.jsp">[���Ͼ��ε���ȭ��fileSelect.jsp]</a>
	</font>
	
	<%
    String fileName = request.getParameter( "file_name" );

     String savePath = "good";
     ServletContext context = config.getServletContext();//    \Web0612
     String sDownloadPath = context.getRealPath(savePath);//   \Web0612\good
     //new File( sDownloadPath).mkdir(); 
     String sFilePath = sDownloadPath + "\\" + fileName;		//   \Web0612\good\fileName
     
     
	//�ڹ��� ioó���� �⺻�� byte�� ����Ʈ �迭�� �޾Ƽ� 
   byte b[] = new byte[4096];
   //File oFile = new File(sFilePath);
  
   FileInputStream in = new FileInputStream(sFilePath); //����
   //String sMimeType = getServletContext().getMimeType(sFilePath);
   //System.out.println("sMimeType>>>"+sMimeType );
   // octet-stream��  8��Ʈ�� �� �Ϸ��� �����͸� ���մϴ�. �������� ���� ���� ������ �ǹ��մϴ�.
   //if(sMimeType == null) sMimeType = "application/octet-stream";

   //response.setContentType(sMimeType);
   //�ѱ� ���ε� (�� �κ��� �ѱ� ���ϸ��� ������ ���� ������ �ݴϴ�.)
   String sEncoding = new String(fileName.getBytes("euc-kr"),"8859_1");
   response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding); //fileName
   ServletOutputStream out2 = response.getOutputStream();
   int numRead;

   // ����Ʈ �迭b�� 0�� ���� numRead�� ���� �������� ���
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










