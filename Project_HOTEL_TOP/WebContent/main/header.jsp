<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<style>

</style>
<!--start-header-->
<div class="header" id="home">
	<div class="container">
	
		<div class="head">

			<div class="logo">
				
				<a href="index.jsp"><img src="images/main/logo.png" alt="" /></a>
			</div> <!-- logo -->
			<div class="navigation">
				 <span class="menu"></span> 
					<ul class="navig">
						<li><a href="index.jsp"  class="hvr-bounce-to-bottom">Home</a></li>
						<li><a href="about" class="hvr-bounce-to-bottom">About</a></li>
						<li><a href="select.do?type=S" class="hvr-bounce-to-bottom">Room</a></li>
						<li><a href="e_list.do" class="hvr-bounce-to-bottom">Events</a></li>
						<li><a href="step1controller.do" class="hvr-bounce-to-bottom">Reservation</a></li>
						<li><a href="qnalist" class="hvr-bounce-to-bottom">Q&A</a></li>
						
					</ul>
			</div> <!-- <div class="navigation"> -->
			<div class="clearfix"></div>
		</div><!-- <div class="head"> -->
			<div id="login">
			<jsp:include page="../member/login.jsp" />
		</div>	
	</div><!-- <div class="container">  -->
</div>	<!-- <div class="header" id="home"> -->
<!-- script-for-menu -->
<!-- script-for-menu -->
	<script>
		$("span.menu").click(function(){
			$(" ul.navig").slideToggle("slow" , function(){
			});
		});
	</script>
<!-- script-for-menu -->