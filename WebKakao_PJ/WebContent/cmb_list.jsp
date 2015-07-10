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
<title>���� list������ cmb_list</title>
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
				<td bgcolor="#D4F4FA">&nbsp;&nbsp;�Ѹ��� : &nbsp; 
				<input type="text" name="cmt" size="65">&nbsp;&nbsp;
					<input type="submit" value="����">
				</td>
			</tr>
			<tr>
				<td bgcolor="#F3F3F3">&nbsp;�������� : &nbsp;yes&nbsp; 
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
		//��ü�۸�� ������ �ͼ� �����ϱ�.
		//������ ��û���� ������� �ֽű� �����ֱ�

		String pageNum = request.getParameter("num");
		if (pageNum == null) {
			pageNum = "1";
		}

		//���� ���� �ִ� ������ ����
		int currentPage = Integer.parseInt(pageNum);

		//Ŭ���̾�Ʈ�� ��û�� �������� �ش��ϴ� row�� ������ �;���
		//������ ��ȣ�� �������� Cmb_sql�� getList(int startRow, int endRow)�� ȣ���ؾ� ��

		int startRow = (currentPage - 1) * PAGE_SIZE + 1;

		int endRow = currentPage * PAGE_SIZE;
		int count = 0; //DB��ü�� �� ��

		//beanlist��Ƶ� �÷���
		List<Cmb_bean> beanlist = null;
		Cmb_sql cmbsql = new Cmb_sql(); 

		//���� ��ü ����� ���� ���� DB���� �ҷ���
		count = cmbsql.getCount();
		if (count > 0) {
			userId = (String)session.getAttribute("user_id"); //����α����� ���̵�
			//(��)20�� ������ �� ��ġ�� �ű�. 
			beanlist = cmbsql.getList(startRow, endRow, userId); //!!
			System.out.println("beanlist.size()="+ beanlist.size());
			
		}
	%>
	 

	<!-- ���� ����Ʈ.. -->
	<%
		if (count == 0) {
	%>
	<table border="0" width="760" cellpadding=10 cellspacing=10 align="center">
		<tr>
			<td bgcolor="#FAF4C0">����� ���� �����ϴ�.</td>
		</tr>
	
	</table>
	<%
		}//End of �ۼ��� �� ���� �޼��� if
		else {//����� ���� �ִٸ� beanlist�� ����� Cmb_bean�� ������ ���鼭 ���
	%>
	<table title="show" width="750" style="table-layout:fixed;border:1px solid lightblack"
			cellpadding=3 cellspacing=5 align="center">
		<%
			for (int i = 0; i < beanlist.size(); i++) {
					Cmb_bean bean = beanlist.get(i);
					System.out.println("userId="+userId+ "  bean.getG_userID : "+bean.getG_userId());
					//System.out.print(beanlist.get(2)+"\t");
					
		%>
		<!-- ���� �ۼ��ڿ� ���� ���� ������ -->

		<tr>
			<td align="center" width="22%" bgcolor="#FAF4C0" ><%=bean.getG_name()%></td>
			<td align="right"  width="78%" bgcolor="#FAF4C0">
	 <%
	 	//����α����� userId�� ������ �ۼ����� �����̸�(������ �� ���̸�)
	 	//���� �� ���� �� �� �ְ� ǥ����
	 	//�񱳴���� �Ǵ� ��ü�� �ٲ�� �ִ�.
 	
	 	if(userId.equals(bean.getG_userId())) { //(20�� ������ ����)
	 %> 	
	 		
	 		<a href="Cmb_modify.do?m_idx=<%=bean.getG_idx()%>&m_current=<%=currentPage%>">[����]</a> 
	 		<a href="Cmb_delete.do?g_idx=<%=bean.getG_idx()%>">[����]</a>
	 <%
	 	}//(modify , delete) if end
	 %>
	 	<%=sdf.format(bean.getG_date())%>&nbsp;&nbsp;&nbsp;&nbsp; 
	 	</td>
		</tr>
		<!-- ���� �ۼ��ڿ� ���� ���� ������ ��-->

		<!-- �۳��� ������ ���� // public ���� ���⼭(����/�����)-->
		<%
			 System.out.println("bean.getG_public() : "+bean.getG_public() +"\t\n");
			if(bean.getG_public().equals("1")){ //yes(����)���ý� ���ϰ� 1
		%>
		<tr bordercolor="black">
			<td width="100%" height="auto" style="word-wrap:break-word" colspan="2">
			<p>&nbsp;&nbsp; <%=bean.getG_content()%></p></td>
		</tr>
		<%
			}else{
				//����� ó�� �ߴ� �ϴ��� ������ �� �� �־�� ��.
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
					<td width="100%" colspan=2><p>&nbsp;&nbsp;����� ó���� �� �Դϴ�.</p></td>
				</tr>
		<%	
				}//else���� if~else end
			}//(public)if~else end
			
			}//Cmb_bean��� for end

			}//�Խù� ��� ���� else end
		%>
		<tr><td width="100%" align="center" colspan=2>
		<%
			if (count > 0) {
				// ����¡ ó�� �� ������ DB�� �ִٸ� ���� ���� ��ü ������ ���� �����մϴ�.
				int pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
				// ���� ������ 0, 10, 20 ������ �� ��ü ������ ���� 0���� ������ ������ �˻縦 �մϴ�.
				// �̷��߸� �� 10���������� ǥ�ð� �˴ϴ�.

				int startPage = currentPage / PAGE_SIZE + 1;

				if (currentPage % 10 != 0) {
					startPage = (int) (currentPage / 10) * 10 + 1;
				} else {
					startPage = (int) ((currentPage / 10) - 1) * 10 + 1;
				}

				// ��ü ������ ��� ���� (�� ����� 10�������� ������)
				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;

				if (endPage > pageCount)
					endPage = pageCount;
				if (startPage > 10) {
		%>
	
		<a href="cmb_list.jsp?num=<%=startPage - 10%>">[����]</a>
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
		<a href="cmb_list.jsp?num=<%=startPage + 10%>">[����]</a>
		<%
			}
			}
		%>
		</td></tr>
	</table>
</body>
</html>
