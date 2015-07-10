<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<title>[checkCall]</title>
	<script type="text/javascript">
		function send(){
			document.checkCall.call.value=opener.join.call.value; //밑에 깔린창의 변수 가져옴 opener
		}
	</script>
</head>
<%
	String ok=request.getParameter("success");
	if(ok==null) {
		%>
		<script>document.checkID.submit()</script>
		<%
	}else{
		int success=Integer.parseInt(ok);
		if(success>0){
			%><script type="text/javascript">
				alert("중복된 전화번호 입니다.");
				self.close();
				opener.join.call.value="";
				opener.join.call.focus();
			</script><%	
		}else {
			%><script type="text/javascript">
				alert("사용 가능한 전화번호입니다");
				opener.join.call.readOnly = true;
				self.close();
			</script><%	
		}
	}
%>
<body onLoad="send()">
	<form name="checkCall" action="checkCall.do">
		<input type="text" name="call" readonly>
		<input type="submit" value="인증">
	</form>
</body>
</html>