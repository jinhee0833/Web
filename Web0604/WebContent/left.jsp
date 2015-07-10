<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
		
		input,select,b,td { font-size:10pt; font-weight:bold;}
		a{
			font-size:12pt; 
			text-decoration: none;
			
		}
		a:hover{font-size: 14pt;
			font-family: comic San MS; color:blue;
		}
	</style>
</head>
<body>
	<p><br>
	
	
	<img src="images/home.gif" width=180 height=250 ><br>
	
	
	<p>
	<form>
		&nbsp;<b>아이디:</b><br>
		<input type=text size=14 ><br>
		&nbsp;<b>비밀번호:</b><br>
		<input type=password size=12 > <br>
		&nbsp;<input type="submit" value="로 그 인">
		
		
	</form>
	
	<img src="images/base.gif"><a href="template.jsp?page=guest">신규등록</a><br>
	<img src="images/base.gif"><a href="template.jsp?page=list">출력화면</a><br>
	<img src="images/base.gif"><a href="template.jsp?page=delete">삭제화면</a><br>
	<img src="images/base.gif"><a href="template.jsp?page=main">메인화면</a><br>
</body>
</html>