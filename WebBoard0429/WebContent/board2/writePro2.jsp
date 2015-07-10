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
			out.println("업로드 성공!!");
		}catch(IOException e){
			e.printStackTrace();
			out.println("업로드 실패!!");
		}

	String ip = request.getRemoteAddr();
	int res = data.insertBoard(mr, ip);    
	String msg = null;
	String uri = null;
	
	if (res>0) {
		msg = "게시글등록성공!! 게시글보기페이지로 이동합니다.";  
		uri = "list2.jsp";
	}else {
		msg = "게시글등록실패!! 게시글보기페이지로 이동합니다.";  
		uri = "list2.jsp";
	}
%>


<%-- <hr color="blue">
<li>올린이 : <%=mr.getParameter("name")%></li>
<li>파일명 : <%=mr.getFilesystemName("filename")%></li> 
<li>컨텐트타입 : <%=mr.getContentType("filename")%></li>
<li>파일크기 : <%=mr.getContentType("filename")%> Bytes</li>   --%>


<script type="text/javascript">
	location.href="<%=uri%>";
</script>
	
