<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 
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
<div align="center">
	<b>글 삭 제</b>
	<form name="f" action="deletePro2.jsp" method="post" onsubmit="return deleteCheck()">
		<input type="hidden" name="num" value="<%=num%>" >
		<table border="1" width="400">
			<tr>
				<th bgcolor="yellow">비밀번호를 입력하세요</th>
			</tr>
			<tr>	
				<td align="center">비밀번호 : <input type="password" name="passwd"></td>
			</tr>
			<tr>	
				<td align="center" bgcolor="yellow">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onClick="window.location='list2.jsp'">
				</td>
			</tr>	
		</table>
	</form>
</div>
