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
			alert("��й�ȣ�� �Է��ϼ���!!");
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script>    
<div align="center">
	<b>�� �� ��</b>
	<form name="f" action="deletePro2.jsp" method="post" onsubmit="return deleteCheck()">
		<input type="hidden" name="num" value="<%=num%>" >
		<table border="1" width="400">
			<tr>
				<th bgcolor="yellow">��й�ȣ�� �Է��ϼ���</th>
			</tr>
			<tr>	
				<td align="center">��й�ȣ : <input type="password" name="passwd"></td>
			</tr>
			<tr>	
				<td align="center" bgcolor="yellow">
					<input type="submit" value="�ۻ���">
					<input type="button" value="�۸��" onClick="window.location='list2.jsp'">
				</td>
			</tr>	
		</table>
	</form>
</div>
