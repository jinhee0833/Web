<%@page import="java.text.SimpleDateFormat"%>
<%@page import="WebKakao_PJ.db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<jsp:include page="session_check.jsp"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 list페이지 cmb_list</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">
	function chk(){
		if ( document.writeForm.pub[0].checked ){
			document.writeForm.public.value=1;
		}else{
			document.writeForm.public.value=0;
		}
	}
</script>
<%@ include file="kakao_header.jsp" %>
	<form name="writeForm" action="cmb_insert.do" method="post" >
		<table border="0" width="600">
			<tr>
				<td bgcolor="#D4F4FA">&nbsp;&nbsp;한마디 : &nbsp; 
				<input type="text" name="cmt" value="HELLO" size="65">&nbsp;&nbsp;
					<input type="submit" value="쓰기">
				</td>
			</tr>
			<tr>
				<td bgcolor="#F3F3F3">&nbsp;공개여부 : &nbsp;yes&nbsp; 
					<input type="radio" name="pub" value="true" onclick="chk();" checked >&nbsp;no&nbsp;
					<input type="radio" name="pub" value="false" onclick="chk();">
				</td>
				<input type="hidden" name="user_id" value=<%=(String)session.getAttribute("user_id")%>>
				<input type="hidden" name="user_name" value=<%=(String)session.getAttribute("user_name")%>>
				<input type="hidden" name="public" value="1">
			</tr>
			
		</table>
	</form>
	
	<%	
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd HH:mm");
		String userId="";
	%>
	<%
		//Cmb_bean담아둘 컬렉션
		Cmb_bean bean = (Cmb_bean)request.getAttribute("bean");
		int m_current = Integer.parseInt(request.getParameter("m_current"));
		Cmb_sql cmbsql = new Cmb_sql(); 
	%>
	 

	<!-- 수정 디테일 -->
	<form action="Cmb_update.do" name="updateForm">
	<table title="show" width="600">
		<!-- 방명록 작성자에 대한 정보 렌더링 -->

		<tr>
			<td bgcolor="#FAF4C0">&nbsp;<%=bean.getG_name()%>
				&nbsp;&nbsp; <%=sdf.format(bean.getG_date())%> &nbsp;&nbsp;&nbsp;&nbsp;
				 
	 <%
	 	//현재로그인한 userId의 정보가 작성자의 정보이면(본인이 쓴 글이면)
	 	//수정 및 삭제 할 수 있게 표시함
	 	//비교대상이 되는 빈객체는 바뀔수 있다.
 	
	 
	 %> 
	 	<input type="submit" value="수정" />
	 	<a href="Cmb_delete.do?g_idx=<%=bean.getG_idx()%>">[삭제]</a> 
			</td>
	 
		</tr>
		<!-- 방명록 작성자에 대한 정보 렌더링 끝-->

		<!-- 글내용 렌더링 시작 // public 설정 여기서(공개/비공개)-->
		
		
		<tr>
			<td><br>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="m_content" size="75" value="<%=bean.getG_content()%>"><p></td>
			<input type="hidden" name="m_idx" value="<%=bean.getG_idx()%>">
			<input type="hidden" name="m_curPage" value="<%=bean.getG_idx()%>">
			<input type="hidden" name="num" value="<%=m_current%>">
		</tr>
		
	</table>
	</form>
</body>
</html>
