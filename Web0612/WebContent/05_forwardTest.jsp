<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>[05_forwardTest.jsp]</title>
</head>
<%
		int age = Integer.parseInt(request.getParameter("age"));
		if(age<=19){
			%>
			<script type="text/javascript">
				alert("19�� �̸��̹Ƿ� ���� �Ұ���")
				history.go(-1)
			</script>
			<%
		}else{
			request.setAttribute("name", "������");
			RequestDispatcher dispatcher = request.getRequestDispatcher("05_forwardResult.jsp");
			dispatcher.forward(request,response);
			
		}
	%>

<body>
	
</body>
</html>