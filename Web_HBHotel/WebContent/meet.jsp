<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<title> meet  </title>
<style type="text/css">

body {
	margin: 20px auto;
	padding: 0;	
	width: 620px;
	background:#FFFFFF;
}
.thumbs {  
   float:top;
   margin-left:110px;
}
.thumbs img {
	
	padding:5px;
	margin-bottom:3px;
}
.thumbs img:hover {
	border-color: #FF0000 ;
	border: solid 3px #FF0000;
}

#largeImg {
	border: solid 1px #ccc;
	width: 767px;
	height: 447px;
	padding: 5px;
    margin-left:110px;
}
</style>

	<script  src="js/jquery-1.7.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="data/js/jquery-2.0.3.min.js"> </script>
	<script src="data/js/jquery-2.0.3.js"> </script>
	<script src="data/js/jquery-1.7.2.min.js"></script>
	<script src="data/js/jquery-ui-1.8.23.custom.min.js"></script>

</head>

<body>
    <div class="thumbs">
        <a href="images/chall_photo1.jpg" title="image1"><img src="images/photo1.jpg" /></a>
        <a href="images/chall_photo2.jpg" title="image2"><img src="images/photo2.jpg" /></a>
        <a href="images/pic3.jpg" title="image3"><img src="images/th_pic3.jpg" /></a>
    </div>
    <div id="largeImg"><img src="images/chall_photo1.jpg" alt="image1" /></div>

<!---------- jQuery code Start ---------->
<script>
	$(".thumbs a").click(function(){	
		var path = $(this).attr("href");
		$("#largeImg > img").attr({ src: path });
		//effecr
		$("#largeImg > img").css("opacity","0.5").stop().animate({opacity:1},2000);
		
		//console.log( path );
		return false;
	});
</script>

</body>
</html>

