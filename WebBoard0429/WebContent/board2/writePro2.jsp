<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="com.oreilly.servlet.*, java.io.*" %>   
    <%@ page import="com.oreilly.servlet.multipart.*"  %>   
<%	request.setCharacterEncoding("EUC-KR");%>    


<jsp:useBean id="data" class="my.board2.BoardDataBean" />
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/board2/files");
		try{
			mr = new MultipartRequest(request, upPath, 5*1024*1024, "EUC-KR", new DefaultFileRenamePolicy( ));
			out.println("���ε� ����!!");
		}catch(IOException e){
			e.printStackTrace();
			out.println("���ε� ����!!");
		}

	String ip = request.getRemoteAddr();
	int res = data.insertBoard(mr, ip);    
	String msg = null;
	String uri = null;
	
	if (res>0) {
		msg = "�Խñ۵�ϼ���!! �Խñۺ����������� �̵��մϴ�.";  
		uri = "list2.jsp";
	}else {
		msg = "�Խñ۵�Ͻ���!! �Խñۺ����������� �̵��մϴ�.";  
		uri = "list2.jsp";
	}
%>


<%-- <hr color="blue">
<li>�ø��� : <%=mr.getParameter("name")%></li>
<li>���ϸ� : <%=mr.getFilesystemName("filename")%></li> 
<li>����ƮŸ�� : <%=mr.getContentType("filename")%></li>
<li>����ũ�� : <%=mr.getContentType("filename")%> Bytes</li>   --%>


<script type="text/javascript">
	location.href="<%=uri%>";
</script>
	
