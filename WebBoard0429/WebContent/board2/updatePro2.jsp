<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.*" %>

<jsp:useBean id="db" class="my.board2.BoardDBBean" />
<jsp:setProperty property="*" name="db"/>
<jsp:useBean id="data" class="my.board2.BoardDataBean" />

<%	request.setCharacterEncoding("EUC-KR");%>

<%
	String upPath = application.getRealPath("/board2/files");
	String filename2 , filename;		
	MultipartRequest mr = null;		
	try{
		mr =  new MultipartRequest(request,upPath,10*1024*1024,"EUC-KR",new DefaultFileRenamePolicy());		
	}catch(IOException e){ 	e.printStackTrace(); }
	
	filename = mr.getFilesystemName("filename");
	filename2 = mr.getParameter("filename2");
	File file = new File(upPath,filename2);
	boolean isCheck = data.checkBoard(mr.getParameter("num"), mr.getParameter("passwd")); 
	String msg = null;
	if (isCheck==true){ 
		int res = data.updateBoard(mr);   
		if (res>0){
			msg = "�ۼ��� ����!! �۸�Ϻ����������� �̵��մϴ�.";
			if(filename!=null)file.delete();
		}else {
			msg ="�ۼ��� ����!! �۸�Ϻ��� �������� �̵��մϴ�.";
		}
	}else{
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="list2.jsp";
</script>