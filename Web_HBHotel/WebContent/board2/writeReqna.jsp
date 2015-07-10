<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*, java.io.*" %>   
 
<script type="text/javascript">
	function writeSave(){
		if (f.writer.value==""){
			alert("아 이 디을 입력하세요!!");
			f.writer.focus();
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

<%
		int num = 0;
		int ref = 0;
		int re_step = 0;//같은그룹의 스텝을 가져오는데, 가져온 스텝보다 더큰 수가있을경우 업데이트문을 일괄(같은 그룹)수행. 댓글의 순서를 정렬해주는 효과
		int re_level = 0;
		String filename = "";
		String snum = request.getParameter("num");
		System.out.println("snum=>>"+snum);
		if (snum != null){//답글
			num = Integer.parseInt(snum);
			System.out.println(num+"첫번째체크num//");
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
			filename = request.getParameter("filename");
		}
%>
<div align="center"><!-- ./board2/writePro2.jsp --><!-- Writer.do -->
	<form name="f" action="Writer.do" method="post" onsubmit="return writeSave()" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re_step" value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	<table border="1">
		<tr height="5">
			<td  bgcolor="yellow" align="center">이 름</th>
			<td><input type="text" name="writer" size="10"></td>
			<td  bgcolor="yellow"  align="center">비밀번호</th>
			<td><input type="password" value="1234"  name="passwd"></td>
		</tr>
		<tr height="100">
			<td colspan="3"><textarea name="content" rows="5" cols="50"></textarea> </td>
			<td> <input type="button" value="댓글" style="width: 100px; height: 100px">  </td>
		</tr>
	</table>
	</form>
</div>




