<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head><title>openID</title>
	<script type="text/javascript">
		function send( ){
			var zip = opener.myform.zipcode1.value+"-"+opener.myform.zipcode2.value;
		   subform.code.value = zip;
		}
	</script>
	
	<style type="text/css">
		input{font-weight:bold;}
	</style>
</head>

<!-- zipcheck.jsp�ܵ������� �ʿ䰡 ����� -->
<body bgcolor="yellow"  onLoad="send( )">

	<div align="center">
		<img src="images/bar.gif" width=300><br>
		<form name="subform"  action="zipcheckSave.jsp">
			<b>&nbsp;zipcode: </b>
			<input  name="code" type=text>
			<input type="submit" value="Ȯ��">
		</form>
	</div>
</body>
</html>






