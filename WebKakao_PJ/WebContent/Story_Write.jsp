<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="session_check.jsp" %>

<link href="css/style.css" rel="stylesheet" type="text/css">
<html>
<head>
<title> [Story_Write ]</title>
</head>
<script type="text/javascript">
function send(){
	if(writeform.content.value=="" || writeform.content.value==null){
		alert("������ �Է����ּ���");
		return;
	}
	
	var str = writeform.filename.value;
	var index = str.lastIndexOf('.');
	var exten = str.substring(index+1, str.length).toUpperCase();

	if(str != ""){
		if( !( exten=="JPG" || exten =="JPEG" || exten=="PNG" || exten=="BMP" || exten=="GIF" )){
			alert("���� ������ �÷��ּ���. ");
			return;
		} 
	}
	
	writeform.submit();
}

</script>
<body>
<%@ include file="kakao_header.jsp" %>
<center>
<form action="insert.do" name="writeform" method="post" enctype="multipart/form-data">
<table width="600" height="300">
<tr>
<td style='font-size:1px; width:2px; border:1px solid #000;'>
<table border="0" cellspacing=1 cellpadding=1>
	<tr>
		<td bgcolor="#bb1f3e" height="1"></td>
	</tr>
	<tr >
		<td align ="center"  width="600" bgcolor="#bb1f3e"><font color="white"><b> ���丮 �ۼ�  </b></font></td>
	</tr>
	<tr>
		<td bgcolor="#bb1f3e" height="1"></td>
	</tr>
	<tr>
		<td height="200"><textarea name="content" rows="20" cols="110"></textarea></td>
	</tr>
	<tr>
		<td bgcolor="#aaaaaa" height="1"></td>
	</tr>
	<tr>
		<td align="right"> &nbsp; ���� ����÷�� ex) jpg, jpeg, gif�� �����մϴ�. &nbsp;&nbsp;
		<input type="file" name="filename"></td>
	</tr>
	<tr>
		<td bgcolor="#aaaaaa" height="1"></td>
	</tr>
	<tr>
		<td align="right"> 
			���� <input type="radio" name="public" value="true" checked>
			����� <input type="radio" name="public" value="false">
			<input type="button" value="�ڷ�" onClick="history.go(-1)">
			<input type="button" value="�ø���" onClick="send()">
		</td>
	</tr>
</table>
</td>
</tr>
</table>
<input type="hidden" name="writer" value="<%= user_name %>"> <!-- �ۼ��� �޾ƿ���  -->
<input type="hidden" name="id" value="<%= user_id %>"> <!-- ���̵� �޾ƿ��� -->
</form>
</center>
</body>
</html>