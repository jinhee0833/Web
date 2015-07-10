<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
		String num = request.getParameter("num");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list2.jsp");
			return;
		}
%>
<script type="text/javascript">
	function deleteCheck(){
		if (!f.passwd.value){
			alert("비밀번호를 입력하세요!!");
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script>
<div>
	<b>글 삭 제</b>
	<form name="f" action="dc.do" method="post" onsubmit="return deleteCheck()">
		<input type="hidden" name="num" value="<%=num%>" >
		<table border=0 width="400">
			<tr>
				<th bgcolor="#81725F"><font color=#1E0000>비밀번호를 입력하세요</font></th>
			</tr>
			<tr>
				<td align="center"><font color=black>비밀번호 : </font><input type="password" name="passwd"></td>
			</tr>
			<tr>	
				<td align="center" bgcolor="#81725F">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onClick="window.location='list2.jsp'">
				</td>
			</tr>	
		</table>
	</form>
</div>
