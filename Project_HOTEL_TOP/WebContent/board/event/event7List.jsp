<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="event.vo.EventVO"%>
<%@ page import="java.util.*, java.text.*"%>
<style>
.event_list_box .event_ongoing_state {
	display: inline-block;
	width: 47px;
	margin: -3px 6px 0 0;
	border: 1px solid white;
	background: #ff3b21;
	text-align: center;
	letter-spacing: -1px;
	font-size: 11px;
	line-height: 1.5;
	color: white;
	vertical-align: middle;
}

.event_list_box .event_end_state {
	display: inline-block;
	width: 47px;
	margin: -3px 6px 0 0;
	border: 1px solid #afb5c1;
	background: #fff;
	text-align: center;
	letter-spacing: -1px;
	font-size: 11px;
	line-height: 1.5;
	color: #677791;
	vertical-align: middle;
}

td a {
	color: #000;
}

.paging a {
	color: #000;
	font-size: 17px;
}
</style>
<script src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#select_type").change(function() {
			document.form.submit();
		});
	});
</script>
<style>
hr {margin: 0px;}
@media 
/* .event7_list_box{
	min-width: 880px;
	max-width: 880px;
	margin: 0 auto;
	padding: 20px 0;
} */
.event7_list_box table, th, td {
	border-collapse: collapse;
	padding: 5px 5px;
}
th {text-align:center;}
td a {color:#000;}
</style>
<script src="js/jquery-1.11.3.js"></script>

<div class="event7_list_box">
	<font size="5" style="font-weight: bold;">Event</font>
	<hr color="white">

<%!private String user;
	private String e_start;
	private String e_end;
	private int e_START;
	private int e_END;
	private String today;
	private int toDAY;
	private java.util.Date sdate;
	private int total = 0, pagecount = 1;
	private String dnum;
	private int dNUM = 0;
	private String pnum; // <a href=guestList.jsp?pageNUM
	private int pageNUM;
	private int limit = 5, pagesize = 5;
	private int startpage = 1, temp = 1;
%>
<%
		user = (String) session.getAttribute("user");
		if (user == "" || user == null) {
			user = "guest";
		}
		List<EventVO> list = (List<EventVO>) request.getAttribute("naver");
		String st = (String) request.getAttribute("count");
		total = Integer.parseInt(st);
		pnum = request.getParameter("pageNUM");
		if (pnum == null || pnum == "") {
			pnum = "1";
		}
		pageNUM = Integer.parseInt(pnum);
		dnum = request.getParameter("dnum");
		if (dnum == null || dnum == "") {
			dnum = "0";
		}
		dNUM = Integer.parseInt(dnum);
		if (total % limit == 0) {
			pagecount = total / limit;
		} else {
			pagecount = total / limit + 1;
		}
		temp = (pageNUM - 1) % limit; //81, 82, [83],,,89, 90 => 83-81=2 
		startpage = pageNUM - temp; //[81]~90
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
		today = simpleDate.format(date);
		toDAY = Integer.parseInt(today);
		if (dNUM > 0) {
			for (int i = 0; i < list.size(); i++) {
				EventVO bean = (EventVO) list.get(i);
				if (bean.getNum() == dNUM) {
%>
	<!-- ------------------------------------------------------------- Detail -->
	<table border="0" cellspacing="0" class="table table-striped">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 20%" />
			<col style="width: 63%" />
			<col style="width: 7%" />
		</colgroup>
		<tr bgcolor="#dddddd">
			<th>NO.</th>
			<th>Date</th>
			<th>Title</th>
			<th>Hit</th>
		</tr>
		<tr align=center>
			<td><%=bean.getNum()%></td>
			<td><%=bean.getE_start()%> ~ <%=bean.getE_end()%></td>
			<td><%=bean.getTitle()%></td>
			<td><%=bean.getHit()%></td>
		</tr>
		<tr align=center>
			<td colspan=4><br> <img
				src="<%=request.getContextPath()%>/board/event/images/<%=bean.getFilename()%>"><br></td>
		</tr>
		<tr>
			<td colspan=4><br><%=bean.getContent()%><br></td>
		</tr>
<!-- ------------------------------------------------------------------ reply insert/list -->
		<tr>
			<td colspan="4"><jsp:include page="eventReply.jsp" flush="false">
					<jsp:param value="<%=dNUM%>" name="dnum" />
					<jsp:param value="<%=user%>" name="user" />
				</jsp:include></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:right">
				<a class="btn btn-default" href="e_list.do?pageNUM=<%=pageNUM%>&dnum=0" role="button">List</a>
<%
 	if (user.equals("admin")) {
%>
				<a class="btn btn-default" href="e_detail.do?dnum=<%=dNUM%>" role="button">Edit</a>
				<a class="btn btn-default" href="e_delete.do?idx=<%=dNUM%>" role="button">Delete</a>
<%}%>
			</td>
		</tr>
	</table>
	<%
		} //if
			} //for
		} //if
	%>
	<br>
		<%if (user.equals("admin")) {%>
		<div style="float:right;">
		<a class="btn btn-default" href="e_insertform.do" role="button">Write</a>
		</div>	
		<%}%>
<!-- ------------------------------------------------------------------ event list -->
<div class="event_list_box">
	<table border="0" cellspacing="0" class="table table-striped" style="margin-bottom: '0'">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 20%" />
			<col style="width: 40" />
			<col />
			<col style="width: 7%" />
		</colgroup>
		<tr>
			<td colspan=6 style="text-align:right"><font size=2>총 <%=total%>개 글</font></td>
		</tr>
		<tr>
			<th></th>
			<th>Date</th>
			<th colspan=2>Title</th>
			<th>Hit</th>
		</tr>
		<%
			try {
				for (int i = 0; i <= list.size(); i++) {
					EventVO bean = (EventVO) list.get(i);
					e_start = simpleDate.format(bean.getE_start());
					e_START = Integer.parseInt(e_start);
					e_end = simpleDate.format(bean.getE_end());
					e_END = Integer.parseInt(e_end);
		%>
		<tr onmouseOver="style.backgroundColor='#eeeeee' "
			onmouseOut="style.backgroundColor='' ">
			<%
				if (e_END > toDAY && e_START < toDAY) {
			%>
			<td align="center" style="vertical-align:middle;"><span class="event_ongoing_state">진행중</span>
			<%
				} else {
			%>
			<td align="center"  style="vertical-align:middle;">
			<span class="event_end_state">종료</span>
			<%
				}
			%>
			<td align="center" style="vertical-align:middle;"><%=bean.getE_start()%> ~<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=bean.getE_end()%>
			</td>
			<td style="vertical-align:middle;">
			<img
				src="<%=request.getContextPath()%>/board/event/images/<%=bean.getFilename()%>"
				height=40 width=70></td>
			<td style="vertical-align:middle;"><a
				href='e_list.do?dnum=<%=bean.getNum()%>&pageNUM=<%=pageNUM%>'><%=bean.getTitle()%></a></td>
			<td align="center" style="vertical-align:middle;"><%=bean.getHit()%></td>
		</tr>
		<%
			} //for end
			} catch (Exception ex) {
			}
		%>
		<tr align="center" height="45">
			<td colspan=6 style="padding: 0">
			</td>
		</tr>
	</table>
</div>
<!-- ------------------------------------------------------------- Paging -->
		<nav style="text-align: center;">
			<ul class="pagination">
					<%
					if (startpage > limit) {
						out.println("<li><a href='e_list.do?pageNUM=" + (startpage - limit) + "&dnum=" + (dNUM) + "' aria-label='Previous'>"
								+"<span aria-hidden='true'>&laquo;</span></a></li>");
					}
					for (int i = startpage; i < (startpage + limit); i++) {
						out.println("<li><a href='e_list.do?pageNUM=" + (i) + "&dnum=" + (dNUM) + "'>" + i + " </a></li>");
						if (i >= pagecount) {
							break;
						}
					} //for end
					if ((startpage + limit - 1) < pagecount) {
						out.println("<li><a href='e_list.do?pageNUM=" + (startpage + limit) + "&dnum=" + (dNUM) + "' aria-label='Previous'>"
						+"<span aria-label='Next'>&raquo;</a></li>");
					}
				%>
			</ul>
		</nav>
</div>
