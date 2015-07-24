<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<font size=7><b>[roomtest.jsp]</b></font>
	<form method="get"  action="../insert.do">
		<b>roomID:</b>
			<input type="text" name="roomID" ><br>
		<b>roomType:</b>
			<input type="text" name="roomType"><br>
		<b>roomCost:</b>
			<input type="text" name="roomCost" value=150000><br>
		<b>roomCap:</b>
			<input type="text" name="roomCap" value=1><br>
			<input type="text" name="room1" value="1.jsp"><br>
			<input type="text" name="room2" value="2.jsp"><br>
			<input type="text" name="room3" value="3.jsp"><br>
			<input type="text" name="room4" value="4.jsp"><br>
			<input type="text" name="roomInfo1" value="info1"><br>
			<input type="text" name="roomInfo2" value="info2"><br>
			<input type="text" name="roomInfo3" value="info3"><br>
			
		<input type="submit" value="등록" > &nbsp;
		<input type="reset" value="취소">
	</form>
</body>
</html>