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
				msg = "�ۻ��� ����!! �۸�Ϻ����������� �̵��մϴ�.";
			}else {
				msg ="�ۻ��� ����!! �۸�Ϻ��� �������� �̵��մϴ�.";
			}
		}else{
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		}
%>
<script type="text/javascript">
	location.href="list2.jsp";
</script>





