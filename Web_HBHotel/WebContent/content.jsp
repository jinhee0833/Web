<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="net.hb.common.DBNoticeBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/nivo-slider.css" media="screen">
<link rel="stylesheet" href="css/futurico-theme.css" media="screen">
<link rel="Stylesheet" type="text/css" href="css/content.css" media="screen">
</head>
<style>
.content{margin:5px; padding:100px;height:900px;background-color:#252220;}
.slider-wrapper { left:40px; top:10px;}
#slider img{width:1300px; height:430px; }
#b3{ 	position: absolute;
		top: 400px;
		margin-left: 650px; 
		padding:0px; 
		height:200px;
		width: 750px;

		}




</style>
<body>
<div class="content">
	<div class="slider-wrapper futurico-theme">
  		<div id="slider" class="nivoSlider">
   			<img src="images/mainimage.jpg" alt="" >
   			<img src="images/mainimage2.jpg" alt="">
   			<img src="images/mainimage3.jpg" alt="" >
 		 </div>  
	</div>	
	<div id = "b3">
		EVENT
		<p>
		<a href="#" class="rollover"><img src = "images/wedding2.jpg" style="width:230px; height:150px;">
		<img src = "images/wedding3.jpg" style="width:230px; height:150px;" class="over">
		</a>
		<a href="#" class="rollover"><img src = "images/hollowin2.jpg" style="width:230px; height:150px;">
		<img src = "images/hollowin3.jpg" style="width:230px; height:150px;" class="over">
		</a>
		<a href="#" class="rollover"><img src = "images/camping2.jpg" style="width:230px; height:150px;">
		<img src = "images/camping3.jpg" style="width:230px; height:150px;" class="over">
		</a>
		</div>
	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="js/jquery.nivo.slider.pack.js"></script>
<script>
 $(window).load(function() {
  $('#slider').nivoSlider({
   effect: 'random',
   directionNavHide: false,
   pauseOnHover: true,
   captionOpacity: 1,
   prevText: '<',
   nextText: '>'
  });
 });
</script>
</body>
</html>