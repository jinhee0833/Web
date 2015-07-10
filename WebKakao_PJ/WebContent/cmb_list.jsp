<%@page import="java.text.SimpleDateFormat"%>
<%@page import="WebKakao_PJ.db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="session_check.jsp"/>
<link href="css/style.css" rel="stylesheet" type="text/css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 list페이지 cmb_list</title>
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
		<table border="0" width="760" align="center">
			<tr>
				<td bgcolor="#D4F4FA">&nbsp;&nbsp;한마디 : &nbsp; 
				<input type="text" name="cmt" size="65">&nbsp;&nbsp;
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
	
	<%!	
		int PAGE_SIZE = 5;
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd HH:mm");
		String userId="";
	%>
	<%
		//전체글목록 가지고 와서 연산하기.
		//페이지 요청없이 왔을경우 최신글 보여주기

		String pageNum = request.getParameter("num");
		if (pageNum == null) {
			pageNum = "1";
		}

		//현재 보고 있는 페이지 설정
		int currentPage = Integer.parseInt(pageNum);

		//클라이언트가 요청한 페이지에 해당하는 row를 가지고 와야함
		//페이지 번호를 기준으로 Cmb_sql의 getList(int startRow, int endRow)를 호출해야 함

		int startRow = (currentPage - 1) * PAGE_SIZE + 1;

		int endRow = currentPage * PAGE_SIZE;
		int count = 0; //DB전체에 글 수

		//beanlist담아둘 컬렉션
		List<Cmb_bean> beanlist = null;
		Cmb_sql cmbsql = new Cmb_sql(); 

		//먼저 전체 저장된 글의 수를 DB에서 불러옴
		count = cmbsql.getCount();
		if (count > 0) {
			userId = (String)session.getAttribute("user_id"); //현재로그인한 아이디
			//(위)20일 수요일 이 위치로 옮김. 
			beanlist = cmbsql.getList(startRow, endRow, userId); //!!
			System.out.println("beanlist.size()="+ beanlist.size());
			
		}
	%>
	 

	<!-- 방명록 리스트.. -->
	<%
		if (count == 0) {
	%>
	<table border="0" width="760" cellpadding=10 cellspacing=10 align="center">
		<tr>
			<td bgcolor="#FAF4C0">저장된 글이 없습니다.</td>
		</tr>
	
	</table>
	<%
		}//End of 작성된 글 없음 메세지 if
		else {//저장된 글이 있다면 beanlist에 담겨진 Cmb_bean을 루프를 돌면서 출력
	%>
	<table title="show" width="750" style="table-layout:fixed;border:1px solid lightblack"
			cellpadding=3 cellspacing=5 align="center">
		<%
			for (int i = 0; i < beanlist.size(); i++) {
					Cmb_bean bean = beanlist.get(i);
					System.out.println("userId="+userId+ "  bean.getG_userID : "+bean.getG_userId());
					//System.out.print(beanlist.get(2)+"\t");
					
		%>
		<!-- 방명록 작성자에 대한 정보 렌더링 -->

		<tr>
			<td align="center" width="22%" bgcolor="#FAF4C0" ><%=bean.getG_name()%></td>
			<td align="right"  width="78%" bgcolor="#FAF4C0">
	 <%
	 	//현재로그인한 userId의 정보가 작성자의 정보이면(본인이 쓴 글이면)
	 	//수정 및 삭제 할 수 있게 표시함
	 	//비교대상이 되는 빈객체는 바뀔수 있다.
 	
	 	if(userId.equals(bean.getG_userId())) { //(20일 수요일 수정)
	 %> 	
	 		
	 		<a href="Cmb_modify.do?m_idx=<%=bean.getG_idx()%>&m_current=<%=currentPage%>">[수정]</a> 
	 		<a href="Cmb_delete.do?g_idx=<%=bean.getG_idx()%>">[삭제]</a>
	 <%
	 	}//(modify , delete) if end
	 %>
	 	<%=sdf.format(bean.getG_date())%>&nbsp;&nbsp;&nbsp;&nbsp; 
	 	</td>
		</tr>
		<!-- 방명록 작성자에 대한 정보 렌더링 끝-->

		<!-- 글내용 렌더링 시작 // public 설정 여기서(공개/비공개)-->
		<%
			 System.out.println("bean.getG_public() : "+bean.getG_public() +"\t\n");
			if(bean.getG_public().equals("1")){ //yes(공개)선택시 리턴값 1
		%>
		<tr bordercolor="black">
			<td width="100%" height="auto" style="word-wrap:break-word" colspan="2">
			<p>&nbsp;&nbsp; <%=bean.getG_content()%></p></td>
		</tr>
		<%
			}else{
				//비공개 처리 했다 하더라도 본인은 볼 수 있어야 함.
				if(userId.equals(bean.getG_userId())){
		%>
				<tr>
					<td width="100%" height="auto" style="word-wrap:break-word" colspan=2>
					<p>&nbsp;&nbsp;<%=bean.getG_content()%></p></td>
				</tr>	
		<%	
				}else{
		%>		
				<tr>
					<td width="100%" colspan=2><p>&nbsp;&nbsp;비공개 처리된 글 입니다.</p></td>
				</tr>
		<%	
				}//else안의 if~else end
			}//(public)if~else end
			
			}//Cmb_bean출력 for end

			}//게시물 출력 로직 else end
		%>
		<tr><td width="100%" align="center" colspan=2>
		<%
			if (count > 0) {
				// 페이징 처리 할 내용이 DB에 있다면 제일 먼저 전체 페이지 수를 연산합니다.
				int pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
				// 위의 내용은 0, 10, 20 페이지 등 전체 페이지 수가 0으로 나누어 지는지 검사를 합니다.
				// 이래야만 각 10페이지마다 표시가 됩니다.

				int startPage = currentPage / PAGE_SIZE + 1;

				if (currentPage % 10 != 0) {
					startPage = (int) (currentPage / 10) * 10 + 1;
				} else {
					startPage = (int) ((currentPage / 10) - 1) * 10 + 1;
				}

				// 전체 페이지 블락 변수 (한 블락당 10페이지로 설정함)
				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;

				if (endPage > pageCount)
					endPage = pageCount;
				if (startPage > 10) {
		%>
	
		<a href="cmb_list.jsp?num=<%=startPage - 10%>">[이전]</a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="cmb_list.jsp?num=<%=i%>">&nbsp;[<%=i%>]&nbsp;
		</a>
		<%
			}
				if (endPage < pageCount) {
		%>
		<a href="cmb_list.jsp?num=<%=startPage + 10%>">[다음]</a>
		<%
			}
			}
		%>
		</td></tr>
	</table>
</body>
</html>
