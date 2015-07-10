<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="session_check.jsp" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="WebKakao_PJ.db.*" %>
<link href="css/style.css" rel="stylesheet" type="text/css">
<html>
<head>
<title> [ Story_Edit ]</title>
</head>
<script type="text/javascript">
function send(){
	if(writeform.content.value=="" || writeform.content.value==null){
		alert("내용을 입력해주세요");
		return;
	}
	
	var str = writeform.filename.value;
	var index = str.lastIndexOf('.');
	var exten = str.substring(index+1, str.length).toUpperCase();
	//alert(exten);
	if(str != ""){
		if( !( exten=="JPG" || exten =="JPEG" || exten=="PNG" || exten=="BMP" || exten=="GIF" )){
			alert("사진 파일을 올려주세요. ");
			return;
		} 
	}
	
	writeform.submit();
}

function cancel(){
	var flag = confirm("취소하시겠습니까?");
	if(flag==true){
		history.go(-1);
	}
}
</script>
<body>
<%
try{
	Board_bean bean = (Board_bean) request.getAttribute("list");

%>
<center>
<form action="edit.do" name="writeform" method="post" enctype="multipart/form-data">
<table width="600" height="300">
<tr>
<td style='font-size:1px; width:2px; border:1px solid #000;'>
<table border="0" cellspacing=1 cellpadding=1>
	<tr>
		<td bgcolor="#bb1f3e" height="1"></td>
	</tr>
	<tr >
		<td align ="center"  width="600" bgcolor="#bb1f3e"><font color="white"><b> 스토리 편집  </b></font></td>
	</tr>
	<tr>
		<td bgcolor="#bb1f3e" height="1"></td>
	</tr>
	<tr>
		<td height="200"><textarea name="content" rows="20" cols="110" ><%= bean.getBrd_content() %></textarea></td>
	</tr>
	<tr>
		<td bgcolor="#aaaaaa" height="1"></td>
	</tr>
	<tr>
		<td align="right"> &nbsp; 사진 파일첨부 ex) jpg, jpeg, gif만 가능합니다. &nbsp;&nbsp;
		<input type="file" name="filename" ></td>
	</tr>
	<tr>
		<td bgcolor="#aaaaaa" height="1"></td>
	</tr>
	<tr>
		<td align="right"> 
			공개 <input type="radio" name="public" value="true" <% if(bean.getBrd_public().equals("true")){ %>checked <%} %>>
			비공개 <input type="radio" name="public" value="false" <% if(bean.getBrd_public().equals("false")){ %>checked <%} %>>
		</td>	
	</tr>
	<tr>
		<td bgcolor="#aaaaaa" height="1"></td>
	</tr>
	<tr>
		<td align="right"> 
			<a href="javascript:send()"><img src="images/btn_edit.jpg" border=0></a>
			<a href="javascript:cancel()"><img src="images/btn_reset.jpg" border=0></a>
		</td>
	</tr>
</table>
</td>
</tr>
</table>
<input type="hidden" name="idx" value="<%= bean.getBrd_idx() %>">
<input type="hidden" name="file" value="<%= bean.getBrd_file() %>"> <!-- 작성자 받아오기  -->
</form>
</center>
<%
}catch(Exception ex){ }
%>
</body>
</html>