<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>[requestInfo.jsp]</title>
</head>
<body>
	���ؽ�Ʈ �н� : <%= request.getContextPath() %><br>
	��û��� : <%= request.getMethod() %> <br>
	��û�� URL :	<%= request.getRequestURL() %><br>
	��û�� URI :	<%= request.getRequestURI() %><br>
	������ �̸� : <%= request.getServerName() %><br>
	�������� : <%= request.getProtocol() %><br>
</body>
</html>