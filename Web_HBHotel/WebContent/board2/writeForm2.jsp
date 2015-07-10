<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>   
<%-- <%@ include file="../top.jsp"%> --%>
 
<script type="text/javascript">
	function writeSave(){
		if (f.writer.value==""){
			alert("아 이 디을 입력하세요!!");
			f.writer.focus();
			return false;
		}
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
<style>
#wf {
	position: absolute;
	
	top: 100px;
	width: 800px;
	text-decoration: none;
	font-family: 'Nanum Myeongjo';
	color: #81725F;
}
</style>

<%
		int num = 0;
		int ref = 0;
		int re_step = 0;
		int re_level = 0;
		String filename = "";
		String snum = request.getParameter("num");
		if (snum != null){
			num = Integer.parseInt(snum);
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
			filename = request.getParameter("filename");
		}
%>

<div id="wf"> 
	<form name="f" action="qnaWriter.do" method="post" onsubmit="return writeSave()" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re_step" value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	
	<table width="600" height="500" border="0">
		<tr>
			<th align="left"><font size=3><b>아 이 디</b></font></th>
			<td><input type="text" name="writer" size="68"></td>
		</tr>
		<tr>
			<th align="left"><font size=3><b>제 목</b></font></th>
			<td><input type="text" name="subject" size="68"></td>
		</tr>
		<tr>
			<th align="left" ><font size=3><b>이메일</b></font></th>
			<td><input type="text" name="email" value="aaa@sk.com" size="40"></td>
		</tr>
		<tr>
			<th align="left"><font size=3><b>파일선택</b></font></th>
			<td><input type="file" name="filename" size="40"></td>	
		</tr>
		
		<tr>
		<th align="left"><font size=3><b>내 용</b></font></th>
			<td><textarea name="content" rows="10" cols="70"></textarea></td>
		</tr>
		
		<tr>
			<th align="left"><font size=3><b>비밀번호</b></font></th>
			<td><input type="password" value="1234"  name="passwd"></td>
		</tr>
		
		<tr>
			<td colspan="2" bgcolor="#81725F"  align="right">
				<input type="submit" value="글쓰기"> 
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="window.location='qnalist.do'">
		</tr>
	</table>
	</form>
</div>





