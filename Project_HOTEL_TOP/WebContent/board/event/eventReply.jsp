<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="event.vo.EventReplyVO"%>
<%@ page import="event.dao.EventReplyDAO"%>
<%!private int dNUM;
	private String user;
	private String dnum;%>

<script type="text/javascript">
	function check() {
		var length = document.forms[0].length - 1;
		for (var i = 0; i < length; i++) { // 루프를 돌면서		 
			if (document.forms[0][i].value == null
					|| document.forms[0][i].value == "") {
				alert(document.forms[0][i].name + "을 를 입력하세요."); // 경고창을 띄우고		 
				document.forms[0][i].focus(); // null인 태그에 포커스를 줌		 
				return false;
			}//end if		
		}//end for
	}//end
</script>
<%
	user = request.getParameter("user");
	if (user == "" || user == null) {
		user = "guest";
	}

	dnum = request.getParameter("dnum");
	if (dnum == "" || dnum == null) {
		dnum = "0";
	}
	dNUM = Integer.parseInt(dnum);
%>
<div class="event_reply_box">
<form method='post' action='er_insert.do' onsubmit="return check()">
	<input type="hidden" name="dnum" value="<%=dnum%>">
	<table class="table table-striped">
		<colgroup>
			<col style="width: 20%" />
			<col style="width: 20%" />
			<col style="width: 50%" />
			<col style="width: 10%" />
		</colgroup>
		<tr>
			<th><font size="2">ID</font></th>
			<th><font size="2">PW</font></th>
			<th colspan="2"><font size="2">CONTENT</font></th>
		</tr>
		<tr align="center">
			<td><input type="text" name="id" value="<%=user%>" size="8" readonly="readonly"></td>
			<td><input type="password" name="pwd" size="8"></td>
			<td><input type="text" name="cont" size="60"></td>
			<td style="vertical-align:middle;"><input class="btn btn-default btn-xs" type="submit" value="write"></td>
		</tr>
	</table>
</form>

<%
	if (dNUM > 0) {
		List<EventReplyVO> list = new ArrayList<EventReplyVO>();
		EventReplyDAO erdao = new EventReplyDAO();
		list = erdao.dbSelect(dNUM);

		if (list.size() > 0) {
%>
<table width=80% bgcolor="#dddddd" border="0" cellspacing="0" class="table table-striped">
	<colgroup>
		<col style="width: 20%" />
		<col style="width: 70%" />
		<col style="width: 10%" />
	</colgroup>
	<tr>
		<td><font size=2>ID</font></td>
		<td><font size=2>CONTENT</font></td>
		<td></td>
	</tr>
	<%
		for (int i = 0; i < list.size(); i++) {
					EventReplyVO vo = (EventReplyVO) list.get(i);
	%>
	<tr onmouseOver="style.backgroundColor='#eeeeee' "
		onmouseOut="style.backgroundColor='' ">
		<td><font size=2>&nbsp;&nbsp;&nbsp;&nbsp;<%=vo.getR_name()%></font></td>
		<td style="text-align:left;"><font size=2>&nbsp;&nbsp;&nbsp;<%=vo.getR_content()%></font></td>
		<td style="text-align:right; vertical-align:middle;">
			<%
				if (user.equals("admin") || user.equals(vo.getR_name())) {
			%> 
			<a class="btn btn-default btn-xs" href="er_delete.do?idx=<%=vo.getR_num()%>&dnum=<%=dNUM%>" role="button">Del</a>
			<%
			 	} //if end admin delete button
			%>
		</td>
	</tr>
	<%
		} //for end
	%>
</table>
<%
	} //if end
	} //if end
%>
</div>
</body>
</html>