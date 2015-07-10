<%@page import="java.net.URLDecoder"%>
<%@page import="javax.xml.crypto.URIDereferencer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ page import="net.hb.common.DBNoticeBean"%>

<html>
<link rel="Stylesheet" type="text/css" href="css/facility.css"
	media="screen">

<style>
A:link {
	font: 9pt;
	text-decoration: none;
	color: #000000
}

A:active {
	text-decoration: none;
	color: #990099
}

A:visited {
	text-decoration: none;
	color: #3A3A3A
}

A:hover {
	text-decoration: none;
}

td {
	font-family: Segoe UI Symbol;
	color: black;
}

.facility {
	position: absolute;
	top: 230px;
	margin-left: 0px;
	padding: 0px;
	height: 900px;
	width: 1759px;
	background-color: #ffffff;
}

#f {
	position: absolute;
	margin-left: 200px;
	top: 50px;
	width: 10px;
	text-decoration: none;
	font-family: 'Nanum Myeongjo';
	color: #81725F;
	font-size: 45px;
}

#m {
	position: absolute;
	margin-left: 500px;
	top: 50px;
	width: 1100px;
	text-decoration: none;
	font-family: 'Nanum Myeongjo';
	color: #81725F;
}

input {
	height: 30px;
}
</style>
</head>
<body>
	<div class="facility">

		<%@ include file="sidebar.jsp"%>
		<div id="f">NOTICE</div>

		<div id="m">
			<a href="layout.jsp">Home</a> > <a href="notice.jsp">ABOUT HOTEL</a>
			> NOTICE
			<h1>NOTICE</h1>
			<form action="noticeEdit.do" method="post" enctype="multipart/form-data">
				<table border="0" width="700" height="300">

					<input type="hidden" value="<%=request.getParameter("edt0")%>" name="edt">
					<tr>
						<td align="center">작성자</td>
						<td><input type="text" name="writer" value="<%=request.getParameter("edt1")%>" readonly></td>

					</tr>
					<tr>
						<td colspan=2><hr></td>
					</tr>
					<tr>
						<td colspan="1" align="center">글제목</td>
						<td><input type="text" name="title" value="<%=request.getParameter("edt2")%>">
						</td>
					</tr>
					<tr>
						<td colspan=2><hr></td>
					</tr>
					<tr>
						<td colspan="1" align="center">글내용<br>&<br>이미지
						</td>
						<td><textarea rows="30" cols="70" name="content"><%=request.getParameter("edt3")%></textarea>
						</td>
					</tr>

					<tr>
						<td colspan="2" align="right"><input type="file"
							name="filename"></td>
					</tr>
					<tr>
						<td colspan=2><hr></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="수정">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="button" value="목록보기" onclick="window.location='noticeList.do'">
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>

</body>
</html>