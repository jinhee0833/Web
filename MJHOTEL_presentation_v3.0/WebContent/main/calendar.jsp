<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>calendar</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
/* 날짜선택 J Query SCRIPT */
$(function() {
  $('#from').datepicker({
    numberOfMonths: 2, 
    firstDay: 1,
        dateFormat: 'yy/mm/dd', 
        minDate: '0', 
        maxDate: '+2Y',
              onSelect: function(dateStr) {
                    var min = $(this).datepicker('getDate');
                    $('#to').datepicker('option', 'minDate', min || '0');
                    datepicked();
        }});
  $('#to').datepicker({
    numberOfMonths: 2, 
    firstDay: 1,
        dateFormat: 'yy/mm/dd', 
        minDate: '0', 
        maxDate: '+2Y',
              onSelect: function(dateStr) {
                    var max = $(this).datepicker('getDate');
                    $('#from').datepicker('option', 'maxDate', max || '+2Y');
                    datepicked();                                                
        }});
});

var datepicked = function() {
var from = $('#from');
var to = $('#to');
var nights = $('#nights');

 var fromDate = from.datepicker('getDate')

    var toDate = to.datepicker('getDate')

    if (toDate && fromDate) {
    var difference = 0;
        var oneDay = 1000*60*60*24; 
        var difference = Math.ceil((toDate.getTime() - fromDate.getTime()) / oneDay); 
        nights.val(difference);
        } 
}

/* 날짜선택 J Query SCRIPT 종료 */
</script>
<style>
	#calendar{
		color:#FFF;
		margin-left:20px;
		margin-bottom:10px; 
	}
	.from{
		margin:5px;
		font-size:0.8em;
	}
	
	.check{
		background:#FFF;
		color:black;
	}
	.check:hover{
		background:#084c7b;
		color:#FFF;
	}
</style>
</head>
<body>
<form name=R_Select method=get action=revStep1.do>
<div id="calendar">
	<div class="center">
		<label style="border-right:1px solid #FFF; padding-right:10px;">Reservation</label>
		<label class="from">Select Hotel</label>
		<select name="Select H">
			<option value="SEOUL MJ HOTEL" >SEOUL MJ HOTEL</option>
			<option value="JEJU MJ HOTEL">JEJU MJ HOTEL</option>
		</select>
		<label class="from">Check In</label>
		<input type="text" id="from" name="from" style="width:70px; " >
		<label class="from">Check Out</label>
		<input type="text" id="to" name="to"  style="width:70px; "  >
		<label class="from">No Of Nights</label>
		<input type="text" id="nights" name="nights" style="width:20px;" readonly="readonly">
		<label class="from">Number Of Guest</label>
		<select name="Guests">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="15">15</option>
			<option value="20">20</option>
			<option value="25">25</option>
			<option value="30">30</option>
		</select>
		<input type="submit" class="check" name="check" style="width:50px;" value="check">
	</div>
</div>
</form>	
</body>
</html>