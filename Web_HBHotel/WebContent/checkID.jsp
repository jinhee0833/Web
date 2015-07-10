<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head><title>[checkID]</title>
	<script>
		function send(){
			document.checkID.id.value=opener.join.id.value; //밑에 깔린창의 변수 가져옴 opener
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
				alert("중복 아이디 입니다.");
				self.close();
				opener.join.id.focus();
			</script><%		
		}else if(success==0){
			%><script type="text/javascript">
				alert("사용 가능한 아이디입니다");
				opener.join.id.readOnly = true;
				self.close();
			</script><%
		}
	}
%>
<body onLoad="send()">
	<form name="checkID" action="checkID.do">
		<input type="text" name="id" readonly>
		<input type="submit" value="중복체크">
	</form>
</body>
</html>