<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html lang="en">
<head>
<meta charset="utf-8">
<title> [hb1.jsp]</title>
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script> 
jQuery(function() {  
	jQuery( "#datepicker" ).datepicker( 
			{ showOn: "button",    buttonImage: "./data/images/cat.gif",    buttonImageOnly: true 
			
			});
	});  
</script>
</head>
<body>
	<p>
		<font size=6> 
		<b>
	    	Date: <input type="text" id="datepicker" style="font-size:20pt; font-wieght:bold;" size=20>
		</b>
		</font>
	</p>
</body>
</html>


