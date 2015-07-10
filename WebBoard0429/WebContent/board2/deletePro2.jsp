<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="data" class="my.board2.BoardDataBean" />    
<%
		String num = request.getParameter("num");
		String passwd = request.getParameter("passwd");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list2.jsp");
			return;
		}
		
		boolean isCheck = data.checkBoard(num, passwd);
		String msg = null;
		if (isCheck){
			int res = data.deleteBoard(num); 
			if (res>0){
				msg = "글삭제 성공!! 글목록보기페이지로 이동합니다.";
			}else {
				msg ="글삭제 실패!! 글목록보기 페이지로 이동합니다.";
			}
		}else{
			msg = "비밀번호가 틀렸습니다.";
		}
%>
<script type="text/javascript">
	location.href="list2.jsp";
</script>





