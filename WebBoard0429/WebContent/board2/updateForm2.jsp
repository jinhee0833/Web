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
			alert("제목을 입력하세요!!");
			f.subject.focus();
			return false;
		}
		if (f.content.value==""){
			alert("내용을 입력하세요!!");
			f.content.focus();
			return false;
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력하세요!!");
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
			<td align="center" colspan="2" bgcolor="yellow"><font size=6 color=red><b> 글수정 </b></font></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">이 름</td>
			<td><input type="text" name="writer" value="<%=db.getWriter()%>" readOnly></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">제 목</td>
			<td><input type="text" name="subject" size="50" value="<%=db.getSubject()%>"></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">이메일</td>
			<td><input type="text" name="email" size="50" value="<%=db.getEmail()%>"></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="yellow" align="center">내 용</td>
			<td><textarea name="content" rows="10" cols="50"><%=db.getContent()%></textarea></td>
		</tr>
		
		<tr>
			<td width="20%" bgcolor="yellow" align="center">파일 이름</td>
			<td><input type="file" name="filename">
				<input type="hidden" name="filename2" value="<%=db.getFilename()%>"></td>
			</tr>
			<tr>
			<td bgcolor="yellow" align="center">등록된 파일:</td>
			<td> <a href="<%=request.getContextPath()%>/board2/files/<%=db.getFilename()%>"><%=db.getFilename() %></a>
			</td>
		</tr>
		
		<tr>
			<td width="20%" bgcolor="yellow" align="center">비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="yellow" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="window.location='list2.jsp'">
		</tr>
		
	</table> 
	</form>
</div>
