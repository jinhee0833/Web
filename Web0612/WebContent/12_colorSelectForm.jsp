<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head><title> [12_colorSelectForm.jsp=357페이지] </title>
	<style type="text/css">
		input,b,select{ font-size:24pt; font-weight:bold;}
	</style>
</head>
<body>
	<form  action="12_colorSelect.jsp">
		<b>색상을 선택 하세요 </b>&nbsp;&nbsp; <br>
		<select  name="color">
			<option value="1">빨강색&nbsp;&nbsp;&nbsp;</option>
			<option value="2">초록색</option>
			<option value="3">파랑색</option>
			<option value="4">노란색</option>
		</select>
		&nbsp;&nbsp;
		<input type="submit"  value="데이타선택">
	</form>
</body>
</html>








