<%@page import="event.vo.EventVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="event/css/event.css">
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"> -->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#content").click(function(){
			document.form.content.value="";
		});
		$("#from").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy/mm/dd',
			numberOfMonths : 2,
			onClose : function(selectedDate) {
				$("#to").datepicker("option", "minDate", selectedDate);
				datepicked();
			}
		});
		$("#to").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy/mm/dd',
			numberOfMonths : 2,
			onClose : function(selectedDate) {
				$("#from").datepicker("option", "maxDate", selectedDate);
				datepicked();
			}
		});
	});

	var datepicked = function() {
		var from = new Date($("#from").datepicker("getDate"));
		var to = new Date($("#to").datepicker("getDate"));
		var during = $("#during");
		if (to && from) {
			var count = Math.ceil((to - from) / 86400000) + 1;
			during.val(count);
		}
	}
</script>

<script type="text/javascript">
	function check() {
		var length = document.forms[0].length - 1;
		for (var i = 0; i < length; i++) { // 루프를 돌면서		 
			if (document.forms[0][i].value == null
					|| document.forms[0][i].value == "") {
				alert(document.forms[0][i].name + "을 를 입력하세요.");
				document.forms[0][i].focus();
				return false;
			}//end if		
		}//end for
	}//end
</script>
<style>
th,span {font-size: 10pt; }
hr {margin: 0;}
</style>
<div class="event_form_box">
	<font size="5" style="font-weight: bold;">Event</font>
	<hr color="black">
	<br>
	<form name="form" method='post' action='e_insert.do' onsubmit="return check()" enctype="multipart/form-data">
		<table width=700 border="0" cellspacing=0 class="table table-striped">
			<div id="adminF">
			<colgroup>
				<col style="width: 30%" />
				<col />
			</colgroup>
			<tr>
				<td colspan="2" style="text-align:left"><font size="3" style="font-weight: bold;">> Event	Write</font></td></tr>
			<tr>
				<th>Title</th>
				<td style="text-align:left"><input type='text' name='title' size=55% class="eventS"><span>(Less than 50 characters)</span><br></td></tr>
			<tr>
				<th>Event Start Date</th>
				<td style="text-align:left"><input type="text" name="e_start" id="from" class="eventS"><br></td>
			</tr>
			<tr>
				<th>Event End Date</th>
				<td style="text-align:left"><input type="text" name="e_end" id="to" class="eventS"><br></td>
			</tr>
			<tr>
				<th>Event Period</th>
				<td style="text-align:left"><input type="text" name="during" id="during" class="eventS">일<br></td>
			</tr>
			<tr>
				<th>Image</th>
				<td style="text-align:left"><input type="file" name="filename" class="eventS"><span>Optimization
						: 600 * 854 px</span><br></td>
			</tr>
			<tr>
				<th>Thumb nail</th>
				<td style="text-align:left"><input type="file" name="th_filename" class="eventS"><span>Optimization
						: 225 * 90 px</span><br></td>
			</tr>
			<tr>
				<th>Content</th>
				<td style="text-align:left"><textarea name='content' rows=5 cols=82 class="eventS" id="content">Less than 3000 characters</textarea><br></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right">
					<input class="btn btn-default" type="submit" value="write">
					<a class="btn btn-default" href="e_list.do" role="button">Cancel</a>
				</td>
			</tr>
		</table>
	</form>
</div>