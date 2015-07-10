<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="net.hb.common.DBNoticeBean" %>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>layout.jsp</title>
<style>
body {
	margin: 0px;
	padding: 0px;
}

.bottom{background-color:#252220;
		position: absolute;
		top: 1000px;
		padding:0px; 
		height:240px;
		width: 1759px;
		}
</style>

<script type="text/javascript">
	function info() {
		var pop = getCookie("pop");

		if (pop != "true") {
			open("popup.jsp", "title", "width=275, height=560,left=160,top=150");
		}
	} // end

	function getCookie(name) { //쿠키의 값을 가져오는 메소드 입니다.
		var Found = false;
		var start, end;
		var i = 0;
		while (i <= document.cookie.length) {
			start = i;
			end = start + name.length;

			if (document.cookie.substring(start, end) == name) { //substring 문자열을 인덱스 기준으로 잘라서반환
				Found = true;
				break;
			}
			i++;
		}

		if (Found == true) {
			start = end + 1;
			end = document.cookie.indexOf(";", start);

			if (end < start)
				;
			end = document.cookie.length;

			return document.cookie.substring(start, end);
		}
		return "";
	}
</script>

<style>
		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol; color:#ffffff}
#b4{ 	position: absolute;
		top: -280px;
		margin-left: 650px; 
		padding:0px; 
		height:200px;
		width: 500px;

		}
 @import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

</style>
</head>
<%!
	private  Connection CN; 
	private  Statement ST; 
	private  ResultSet  RS;  
	private  String sql ; 
%>
<body onLoad="info()"">
	<jsp:include page="header.jsp" flush="false" />
	<jsp:include page="menu.jsp" flush="false" />
	<jsp:include page="content.jsp" flush="false" />
	
	<div class="bottom">
	<div id = "b4">
	<table border = "0" width=300 >
	<tr height=10></tr>
	<tr>
	<td colspan=2><h1><font color=#ffffff style="font-family:'Nanum Myeongjo';font-size:17px;" >What's New</font></h1></td>
	</tr>
	</table>
	<table border = "0" width=300 >
	<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@203.236.209.125:1521:XE";
		CN = DriverManager.getConnection(url,"system","oracle");
		String sql = "select * from board5";
		ST = CN.createStatement();
		RS = ST.executeQuery(sql);
		int i = 0;
		while(RS.next() == true){
			if(i > 4){
				break;
			}
	%>
	
	<tr>
		<td width=230><a href='noticeDetail.do?dt1=<%=RS.getInt("num")%>'><font color=#ffffff style="font-family:'Nanum Myeongjo';font-size:13px;" ><%=RS.getString("title")%></font></a></td>
		<td width=100 align=right><font color=#ffffff style="font-family:'Nanum Myeongjo';font-size:13px;" ><%=RS.getDate("nalja") %></font></td>
	</tr>

	
	<%		i++;
		}
	}catch(Exception ex){}
	%>
	</table>
	</div>
 	<table width=100%>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
			<tr>
				<td rowspan="5" align="right">
					<table>
						<tr>
							<td>
								<FONT size="7" style="font-family: 'Nanum Myeongjo'; color: #91826E;">H A N B I T</FONT>
							</td>
						</tr>
						<tr>
							<td>
								<hr>
							</td>
						</tr>
						<tr>
							<td align="center" style='font-size: 11pt; font-family: Nanum Myeongjo; color: #91826E;'>
								H O T E L S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&&nbsp;&nbsp;&nbsp;&nbsp;R E S O R T
							</td>
						</tr>
						<tr>
							<td>
								<hr>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;' align="center">
					<a href="notice.jsp" style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;'>공지사항 / NOTICE</a> 
					· <a href="history.jsp" style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;'>연혁 / HISTORY</a> 
					· <a href="find.jsp" style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;'>오시는길 / FIND</a>
					· <a href="review.jsp" style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;'>후기 / REWIEW</a> 
					· <a href="qna.jsp" style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;'>질의응답 / Q&A</a>
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;' align="center">
					대표이사 : 이선경 &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; ㈜ HANBIT HOTEL & RESORT
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;' align="center">
					대표번호 : 02-707-1480  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 팩스 : 02-707-1481
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 고객센터 : 02-707-1482~5
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family:Nanum Myeongjo; color: #91826E; font-weight: bold;' align="center">
					주소 : 서울 마포구 신수동 63-14 구프라자 / Guplaza 63-14 Sinsu-dong Mapo-gu Seoul
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
		</table>
</div>
</html>