<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head><title>openID</title>
	<script type="text/javascript">
		function send( ){
		   subform.userid.value = opener.myform.sabun.value;
		}
	</script>
	
	<style type="text/css">
		input{font-weight:bold;}
	</style>
</head>

<!-- openID.jsp단독실행할 필요가 없어요 -->
<body bgcolor="yellow"  onLoad="send( )">

	<div align="center">
		<img src="images/bar.gif" width=300><br>
		<form name="subform"  action="openIDSave.jsp">
			<b>&nbsp;id: </b>
			<input  name="userid" type=text>
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>






