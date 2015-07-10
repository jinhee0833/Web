<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<title>kakao_header</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="css/style.css" rel="stylesheet" type="text/css">
<style>
	#btn_close	{ cursor:pointer; }
	#button	{ cursor:pointer; }
</style>
<script language="javascript">

//alert(filename+"_"+extname);

window.onload = function(){
	
	window.resizeTo(850,1000);
	
	var fname = document.URL;
	var s=fname.lastIndexOf("/");
	var m=fname.lastIndexOf(".");
	var e=fname.length;
	var filename=fname.substring(s+1,m);
	var extname=fname.substring(m+1,e);
	

	var s2 = "";
	
	if ( filename == "detail"){
		var s2 = fname.split("flag=")[1].split("&action")[0];	
	}
	
	
	if ( filename == "myList" || s2 == "true" ){
		m1.src="images/kakao_header_03s.jpg";
	}else if ( filename == "frList" || s2 == "false" ){
		m2.src="images/kakao_header_05s.jpg";
	}else if ( filename == "cmb_list" ){
		m3.src="images/kakao_header_07s.jpg";
	}else{
		//m1.src="images/kakao_header_03.jpg";
		//m2.src="images/kakao_header_05.jpg";
		//m3.src="images/kakao_header_07.jpg";
	}
	
	var Msg_YN = <%=request.getAttribute("Msg_YN")%>;
	
	if ( Msg_YN > 0 ){
		btn_m.src = "images/kakao_header_11n.jpg";
		sss.innerHTML += "<embed src='images/memo_on.mp3' width=0 height=0></embed>";
	}else{
		btn_m.src = "images/kakao_header_11.jpg";
	}
	

}

</script>
<script language="javascript" src="Jquery/jquery.js"></script>
<script language="javascript">
	$().ready(function(){
		$('#memoLayer').hide();
		$('#memoLayer_back').hide();

		$('#button').click(function(){
			$('#memoLayer').toggle('normal');
			$('#memoLayer_back').toggle('normal');
		});
		
		$('#btn_close').click(function(){
			$('#memoLayer').toggle('normal');
			$('#memoLayer_back').toggle('normal');
		});
		getContent();
		
		$('#btn_m').click(function(){
			window.open("Msg_list.do", "", "width=530, height=400");
		});
	});
	
	function getContent() {
		var rtn = "";
		    $.ajax({
		        type: "POST",
		        async: true,
		        url: "ajax_memo_view.jsp",
		        dataType: 'text',
		        //data: JSON.stringify({ name: 'aaaa' }),
		        success: function (data) {
		            rtn = data;
		            //alert(data);
		            if ( data.trim() == "null" || data.trim() == null  ){
		            	data = "";
		            }
		            $('#m_content').val(data.trim());
		        }
		    });
		
		    return rtn;
		
	}
	
	function ajax_error(e){
		alert('error'+e.responseText);
		
	}
	
	String.prototype.trim = function()
	{
	    return this.replace(/(^[ \f\n\r\t]*)|([ \f\n\r\t]*$)/g, "");
	}

	
</script>

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- Save for Web Slices (kakao_header.psd) -->
<table id="Table_01" width="801" height="80" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="10">
			<img src="images/kakao_header_01.jpg" width="750" height="37" alt=""></td>
		<td rowspan="2">
			<a href="Story_Write.jsp"><img src="images/kakao_header_02.jpg" width="50" height="51" alt="내 스토리 쓰기"  border=0></td>
		<td>
			<img src="images/spacer.gif" width="1" height="37" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<a href="myList.do"><img id="m1" src="images/kakao_header_03.jpg" width="96" height="40" alt="내 스토리 보기" border=0></a></td>
		<td rowspan="5">
			<img src="images/kakao_header_04.jpg" width="17" height="43" alt=""></td>
		<td rowspan="3">
			<a href="frList.do"><img id="m2" src="images/kakao_header_05.jpg" width="96" height="41" alt="친구 스토리 보기"  border=0></a></td>
		<td rowspan="5">
			<img src="images/kakao_header_06.jpg" width="19" height="43" alt=""></td>
		<td rowspan="3">
			<a href="cmb_list.jsp"><img id="m3" src="images/kakao_header_07.jpg" width="101" height="41" alt="방명록 보기"  border=0></a></td>
		<td rowspan="5">
			<img src="images/kakao_header_08.jpg" width="272" height="43" alt=""></td>
		<td rowspan="4">
			<img id="button" src="images/kakao_header_09.jpg" width="39" height="42" alt="메모남기기"  border=0></td>
		<td rowspan="5">
			<img src="images/kakao_header_10.jpg" width="47" height="43" alt=""></td>
		<td rowspan="4">
			<img id="btn_m" src="images/kakao_header_11.jpg" width="37" height="42" alt="쪽지보내기"  border=0 style="cursor:hand"></a></td>
		<td rowspan="5">
			<img src="images/kakao_header_12.jpg" width="26" height="43" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td rowspan="4">
			<img src="images/kakao_header_13.jpg" width="50" height="29" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="26" alt=""></td>
	</tr>
	<tr>
		<td rowspan="3">
			<img src="images/kakao_header_14.jpg" width="96" height="3" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="1" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="images/kakao_header_15.jpg" width="96" height="2" alt=""></td>
		<td rowspan="2">
			<img src="images/kakao_header_16.jpg" width="101" height="2" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="1" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/kakao_header_17.jpg" width="39" height="1" alt=""></td>
		<td>
			<img src="images/kakao_header_18.jpg" width="37" height="1" alt=""></td>
		<td>
			<img src="images/spacer.gif" width="1" height="1" alt=""></td>
	</tr>
</table>
<table width=800>
<tr>
	<td align="right">
		<font color="blue"><b><%=session.getAttribute("user_name") %>(<%=session.getAttribute("user_id") %>)</b></font> 님 환영합니다!
		<a href="logout.jsp">[ 로그아웃 ]</a>	
	</td>
	
</tr>
</table>
<!-- End Save for Web Slices -->
	
	<div id="memoLayer" class="clsLayer" style=
     'position : absolute;
     left:300px;
     top:200px;
     width:300px;
     height:400px;
     background-color: #FFFFDD;
     font-size: 11px;
     color: white;
     overflow:no;
     padding:20 20 20 20;
     filter:Alpha(opacity=100);
     border-radius: 10px;
     display:none;
     z-index:3'>
     	<%@ include file="memo_view.jsp" %>
     </div>
     
     <div id="memoLayer_back" class="clsLayer" style=
     'position : absolute;
     left:0px;
     top:0px;
     width:1000px;
     height:1000px;
     background-color: #000000;
     font-size: 11px;
     color: gray;
     overflow:no;
     padding:20 10 5 5;
     filter:Alpha(opacity=50);
     border-radius: 10px;
     display:none;
     z-index:2'>
     <table width=1000 height=1000>
     	<tr><td>&nbsp;</td></tr>
     </table>
     </div>
<iframe id="hidden_frame" src="" width=0 height=0></iframe> 	
<div id="sss"></span>
</body>
</html>