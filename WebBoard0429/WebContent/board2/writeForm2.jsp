<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="com.oreilly.servlet.*, java.io.*" %>   

 
<script type="text/javascript">
	function writeSave(){
		if (f.writer.value==""){
			alert("�̸��� �Է��ϼ���!!");
			f.writer.focus();
			return false;
		}
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

<%
		int num = 0;
		int ref = 0;
		int re_step = 0;
		int re_level = 0;
		String filename = "";
		String snum = request.getParameter("num");
		if (snum != null){ 		//���
			num = Integer.parseInt(snum);
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
			filename = request.getParameter("filename");
		}
%>
<div align="center">
	<form name="f" action="writePro2.jsp" method="post" onsubmit="return writeSave()" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re_step" value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	<table width="600" height="500" border="1">
		<tr>
			<th align="center" colspan="2" bgcolor="yellow" height=50>
				<font size=5><b> �Խ��� �۾��� ȭ��</b></font>
			</th>
		</tr>
		<tr>
			<th  bgcolor="yellow" align="center">�� ��</th>
			<td><input type="text" name="writer" size="40"></td>
		</tr>
		<tr>
			<th  bgcolor="yellow" align="center">�� ��</th>
			<td><input type="text" name="subject" size="40"></td>
		</tr>
		<tr>
			<th  bgcolor="yellow" align="center" >�̸���</th>
			<td><input type="text" name="email" value="aaa@sk.com" size="40"></td>
		</tr>
		<tr>
			<th  bgcolor="yellow" align="center">���ϼ���</th>
			<td><input type="file" name="filename" size="40"></td>	
		</tr>
		<tr>
		<th  bgcolor="yellow" align="center">�� ��</th>
			<td><textarea name="content" rows="10" cols="40"></textarea></td>
		</tr>
		<tr>
			<th  bgcolor="yellow"  align="center">��й�ȣ</th>
			<td><input type="password" value="1234"  name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="yellow" align="center">
				<input type="submit" value="�۾���">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="��Ϻ���" onClick="window.location='list2.jsp'">
		</tr>
	</table>
	</form>
</div>





