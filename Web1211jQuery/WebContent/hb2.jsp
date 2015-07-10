<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Effects - switchClass Demo</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
.toggler {
	width: 500px;
	height: 200px;
	position: relative;
}

#button {
	padding: .5em 1em;
	text-decoration: none;
}

#effect {
	position: relative;
}

.newClass {
	width: 240px;
	padding: 1em;
	letter-spacing: 0;
	font-size: 1.2em;
	margin: 0;
}

.anotherNewClass {
	text-indent: 40px;
	letter-spacing: .4em;
	width: 410px;
	height: 100px;
	padding: 30px;
	margin: 10px;
	font-size: 1.6em;
}
</style>
<script>
	jQuery(function() {
		jQuery("#button").click(
				function() {
					jQuery(".newClass").switchClass("newClass", "anotherNewClass",
							1000);
					jQuery(".anotherNewClass").switchClass("anotherNewClass",
							"newClass", 1000);
					return false;
				});
	});
</script>
</head>
<body>
	<div class="toggler">
		<div id="effect" class="newClass ui-corner-all"> Asynchronized javaScript XML Etiam libero
			neque, luctus a, eleifend nec, semper at, lorem. Sed pede.</div>
	</div>
	<a href="#" id="button" class="ui-state-default ui-corner-all">Run
		Effect</a>
</body>
</html>