<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>TOP hotel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> 
	addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<link href="css/main/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/main/style.css" rel='stylesheet' type='text/css' />

<script src="js/main/jquery.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/main/move-top.js"></script>
<script type="text/javascript" src="js/main/easing.js"></script>

<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!--start-smoth-scrolling-->

<!--FlexSlider-->
<link rel="stylesheet" href="css/main/flexslider.css" type="text/css" media="screen" />
<script defer src="js/main/jquery.flexslider.js"></script>
<script type="text/javascript">
    /*
    $(function(){
      SyntaxHighlighter.all();
    });
    */
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
		});
</script>


<!-- popup -->
	<script type="text/javascript">
		function pop( ){
			var data = document.cookie;
			if(data != "info_pop=false"){
				window.open("PopUpController.do", "pppp", "width=500,height=650,left=200,top=100")

			}
		}//end
		
		
	</script>


</head>

<body >


<!-- header.jsp -->
	<div >
		<jsp:include page="main/header.jsp" flush="false" />
	</div>
	
<!-- contents -->
	
	<div class="content_wrap">				<!-- 세로만 조정 -->
		<div class="center">						<!-- header, content, bottom 가로 똑같이 -->
			<c:if test="${pageFile==null}">
				<c:set var="pageFile" value="main/main.jsp" />
			</c:if>
			<jsp:include page="${pageFile}" />
			
			
		</div>
	</div>
	
<!-- bottom.jsp -->
	<div>
		<jsp:include page="main/bottom.jsp" flush="false" />
	</div>
</body>
</html>