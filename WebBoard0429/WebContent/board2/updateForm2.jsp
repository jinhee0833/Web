<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board2.*"%>
 
 
<jsp:useBean id="data" class="my.board2.BoardDataBean" />    
<%
		String num = request.getParameter("num");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list2.jsp");
			return;
		}
		BoardDBBean db = data.getBoard(num, "update"); 
%>
<script type="text/javascript">
	function updateSave(){
		if (f.subject.value==""){
			alert("������ �Է��ϼ���!!");
			f.subject.focus();
			return false;
		}
		if (f.content.value==""){
			alert("������ �Է��ϼ���!!");
			f.content.focus();
			return false;
		}
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��ϼ���!!");
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script> 

<div align="center">
	<form name="f" action="updatePro2.jsp" method="post" onsubmit="return updateSave()" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>" >
	<table width="600" height="500" border="1">
		<tr>
			<td align="center" colspan="2" bgcolor="yellow"><font size=6 color=red><b> �ۼ��� </b></font></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">�� ��</td>
			<td><input type="text" name="writer" value="<%=db.getWriter()%>" readOnly></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">�� ��</td>
			<td><input type="text" name="subject" size="50" value="<%=db.getSubject()%>"></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">�̸���</td>
			<td><input type="text" name="email" size="50" value="<%=db.getEmail()%>"></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">�� ��</td>
			<td><textarea name="content" rows="10" cols="50"><%=db.getContent()%></textarea></td>
		</tr>
		
		<tr>
			<td width="20%" bgcolor="yellow" align="center">���� �̸�</td>
			<td><input type="file" name="filename">
				<input type="hidden" name="filename2" value="<%=db.getFilename()%>"></td>
			</tr>
			<tr>
			<td bgcolor="yellow" align="center">��ϵ� ����:</td>
			<td> <a href="<%=request.getContextPath()%>/board2/files/<%=db.getFilename()%>"><%=db.getFilename() %></a>
			</td>
		</tr>
		
		<tr>
			<td width="20%" bgcolor="yellow" align="center">��й�ȣ</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="yellow" align="center">
				<input type="submit" value="�ۼ���">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="��Ϻ���" onClick="window.location='list2.jsp'">
		</tr>
		
	</table> 
	</form>
</div>
