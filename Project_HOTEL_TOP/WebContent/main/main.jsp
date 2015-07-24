	
<%@ page import="java.util.*"%>
<%@ page import="event.vo.EventVO"%>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<!--  <link rel="stylesheet" href="css/main/jquery-ui.css" />-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript">

	
$(function() {
	$('#from').datepicker({
		numberOfMonths : 2,
		firstDay : 1,
		dateFormat : 'yy/mm/dd',
		minDate : '0',
		maxDate : '+2Y',
		onSelect : function(dateStr) {
			var min = $(this).datepicker('getDate');
			$('#to').datepicker('option', 'minDate', min || '0');
			datepicked();
		}
	});
	$('#to').datepicker({
		numberOfMonths : 2,
		firstDay : 1,
		dateFormat : 'yy/mm/dd',
		minDate : '0',
		maxDate : '+2Y',
		onSelect : function(dateStr) {
			var max = $(this).datepicker('getDate');
			$('#from').datepicker('option', 'maxDate', max || '+2Y');
			datepicked();
		}
	});
});



function datepicked(){

	
	var from = $('#from');
	var to = $('#to');
	var nights = $('#nights');

	var fromDate = from.datepicker('getDate')

	var toDate = to.datepicker('getDate')

	if (toDate && fromDate) {
	
		var difference = 0;
		var oneDay = 1000 * 60 * 60 * 24;
		var difference = Math.ceil((toDate.getTime() - fromDate.getTime()) / oneDay);
		nights.val(difference);
	}
}
	

</script>
	<body onload="pop()">
	
	<!--start-banner-->
	<div class="banner">
		<div class="container">
			<form method="get" action="step1controller.do">
				<div class="banner-top">
					<h1>For Booking</h1>
					<div class="banner-bottom">
						<div class="bnr-one">
							<div class="bnr-left">
								<p>Ckeck In</p>
							</div>
							<div class="bnr-right">
								<input class="date" id="from" name="from"  type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required=>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="bnr-one">
							<div class="bnr-left">
								<p>Ckeck Out</p>
							</div>
							<div class="bnr-right">
								<input class="date" id="to" name="to" type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required=>
							</div>
							<div class="clearfix"></div>
						</div>
						
						<div class="bnr-one">
							<div class="bnr-left">
								<p>members</p>
							</div>
							<div class="bnr-right">
								<input type="text"  class="rm" name="numberOfMember"  placeholder="member of guest" required=>
								<!--  
								<select>
									<option  class="rm" value="volvo">0</option>
									<option  class="rm" value="saab">1</option>
									<option  class="rm" value="opel">2</option>
									<option  class="rm" value="audi">3</option>
								</select>
								-->
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="bnr-one">
							<div class="bnr-left">
								<p>Room type</p>
							</div>
							<div class="bnr-right">
								<select name="roomtype">
									<option value="ALL">All</option>
									<option value="S">S</option>
									<option value="A">A</option>
									<option value="B">B</option>
								</select>
							</div>
							<div class="clearfix"></div>
						</div>
						<input type="hidden" id="nights" name="nights">
						<div class="bnr-btn">
							
							<input type="submit" value="Booking Now" >
						</div> <!-- end bnr-btn -->
					</div> <!-- <div class="banner-bottom"> -->
				</div> <!-- <div class="banner-top"> -->
				
			</form> <!-- end form -->
		</div> <!-- <div class="container"> -->

	</div><!-- <div class="banner"> -->
	<!--end-banner-->
	<!---start-date-piker---->

	<!---/End-date-piker---->
	<!---start-why-->
	<div class="why" id="about">
		<div class="container">
			<div class="why-top heading">
				<h3>WHY TOPHOTEL ?</h3>
				<p></p>
			</div>
			<div class="why-bottom">
				<div class="col-md-4 why-left">
					<span class="w-one"></span>
					<p>Top Hotel is .... </p>
				</div>
				<div class="col-md-4 why-left">
					<span class="w-two"></span>
					<p>Preminum Lifestyle ....</p>
				</div>
				<div class="col-md-4 why-left">
					<span class="w-tre"></span>
					<p>Our best service.....</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--end-why-->

	<!--FlexSlider-->

	</div>
			<!--End-slider-script-->
	<!--start-blog-->
	<!--
	<div class="news" id="news">
		<div class="container">
			<div class="news-top heading">
				<h3>LATEST NEWS</h3>
			</div>
			<div class="news-bottom">
				<div class="news-one">
				<div class="col-md-6 news-left">
					<div class="n-left">
						<img src="images/main/blog-1.png" alt="" />
					</div>
					<div class="n-right">
						<h4>Sed Condimentum Enim Sem</h4>
						<p class="admin">commodo malesuada.</p>
						<p>Phasellus nec tellus tortor. Vivamus sagittis orci sit amet finibus dapibus. Suspendisse sit amet tempus nunc, id euismod nunc.Maecenas sit amet interdum massa, ut bibendum arcu.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-6 news-left">
					<div class="n-left">
						<img src="images/main/blog-2.png" alt="" />
					</div>
					<div class="n-right">
						<h4>Sed Condimentum Enim Sem</h4>
						<p class="admin">commodo malesuada.</p>
						<p>Phasellus nec tellus tortor. Vivamus sagittis orci sit amet finibus dapibus. Suspendisse sit amet tempus nunc, id euismod nunc.Maecenas sit amet interdum massa, ut bibendum arcu.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
				</div>
				<div class="news-one">
				<div class="col-md-6 news-left">
					<div class="n-left">
						<img src="images/main/blog-3.png" alt="" />
					</div>
					<div class="n-right">
						<h4>Sed Condimentum Enim Sem</h4>
						<p class="admin">commodo malesuada.</p>
						<p>Phasellus nec tellus tortor. Vivamus sagittis orci sit amet finibus dapibus. Suspendisse sit amet tempus nunc, id euismod nunc.Maecenas sit amet interdum massa, ut bibendum arcu.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-6 news-left">
					<div class="n-left">
						<img src="images/main/blog-4.png" alt="" />
					</div>
					<div class="n-right">
						<h4>Sed Condimentum Enim Sem</h4>
						<p class="admin">commodo malesuada.</p>
						<p>Phasellus nec tellus tortor. Vivamus sagittis orci sit amet finibus dapibus. Suspendisse sit amet tempus nunc, id euismod nunc.Maecenas sit amet interdum massa, ut bibendum arcu.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!--end-blog-->
	<!--start-events-->
	
	<%
		//List eventlist = (List) request.getAttribute("eventMain");

			//EventVO evo = (EventVO) eventlist.get(0);
	%>
	<div class="events" id="events">
		<div class="container">
			<div class="events-top heading">
				<h3>UPCOMING EVENTS</h3>
			</div>
			<div class="events-bottom">
				<div class="col-md-4 events-main">
					<div class="events-left">
						<img src="images/main/e-1.jpg" alt="" />
						<div class="event-btm">
							<h4>March 14, 2015</h4>
						</div>
						<p>Duis accumsan risus id tellus viverra tincidunt. Quisque vel velit orci. Integer ante tellus, congue at convallis at, rhoncus ut massa.</p>
					</div>
				</div>
				<div class="col-md-4 events-main">
					<div class="events-left">
						<img src="images/main/e-2.jpg" alt="" />
						<div class="event-btm">
							<h4>August 14, 2015</h4>
						</div>
						<p>Duis accumsan risus id tellus viverra tincidunt. Quisque vel velit orci. Integer ante tellus, congue at convallis at, rhoncus ut massa.</p>
					</div>
				</div>
				<div class="col-md-4 events-main">
					<div class="events-left">
						<img src="images/main/e-3.jpg" alt="" />
						<div class="event-btm">
							<h4>May 14, 2015</h4>
						</div>
						<p>Duis accumsan risus id tellus viverra tincidunt. Quisque vel velit orci. Integer ante tellus, congue at convallis at, rhoncus ut massa.</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--end-events-->
	</body>