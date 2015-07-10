<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>

<head>
<title> center.jsp </title>
<style>
div{ background-size:auto;}
p {font-family:Arial; font-size:20px; font-weight:bold;}
</style>

<link href="css/skitter.styles.css" type="text/css" media="all" rel="stylesheet" />
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery.skitter.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>


</head>
<body>
<div class="box_skitter box_skitter_large" style="position:absolute;left:150px; top:130px;width:1300px; height:410px;">
	
    <ul>
        <li>
           <a href="#"><img src="images/main.jpg"/></a>

            <div class="label_text">
              <p>
              The ultimate in luxurious relaxation.</p>
            </div>
        </li>
        <li>
           <a href="#"><img src="images/main2.jpg"/></a>

            <div class="label_text">
                <p>The grass is always greener on the other side of the fence.</p>
            </div>
        </li>
        <li>
           <a href="#"><img src="images/main3.jpg"/></a>

            <div class="label_text">
                <p>Beauty is in the eyes of the beholder.</p>
            </div>
        </li>
    </ul>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('.box_skitter_large').skitter({
			theme: 'default',
			dots: true, 
			preview: true,
			numbers_align: 'center'
		});
	});
</script>
</body>
</html>
