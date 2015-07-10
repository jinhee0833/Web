<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.hb.common.DBListBean" %>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head><title>main_notice.jsp</title>
<link rel="stylesheet" href="css/nivo-slider.css" media="screen">
<link rel="stylesheet" href="css/futurico-theme.css" media="screen">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
	td{font-size:15pt;font-color:white;}
	a{text-decoration:none;}
	.content{margin:5px; padding:100px;height:700px;background-color:#252220;font-family:'Nanum Myeongjo';}
	.slider-wrapper { left:40px; top:10px;}
	#slider img{width:1300px; height:430px; }
	#notice{
	margin-top:350px; position:absolute;
	left:250px;font-family:'Nanum Myeongjo';
	}	
	#tabs{
			display:block;	
			border:0;
			width:800px;
			}		
			#tabs ul li{
			width:150px;
			display:inline-block;
		    font-variant:small-caps;
		    font-size:.9em;
		    text-align:center;
		    line-height:1.8em;
		    font-weight:700;
		    border-radius:3px 3px 0 0;
		    color:#777;
		    border:1px solid #ccc;
		    border-width:1px 1px 0;
			 }
			#tabs ul li a {font-family: 'Nanum Myeongjo'; }
</style>
<script type="text/javascript">
$(function() {
    $( "#tabs" ).tabs();
  });
  
</script>
</head>

<body>
	
<div class="content">	
<div class="slider-wrapper futurico-theme">
  <div id="slider" class="nivoSlider">
   <img src="images/main.jpg" alt="" title="#caption1">
   <img src="images/main2.jpg" alt="" title="#caption2">
   <img src="images/main3.jpg" alt="" title="#caption5">
   <img src="images/main4.jpg" alt="" title="#caption1">
   <img src="images/main5.jpg" alt="" title="#caption5">
  </div>
  <div id="caption1" class="nivo-html-caption">
   <strong>Unforgettable Comfort</strong> <span></span> <em>집에서만 느낄수 있었던 최상의 평온함을 직접 만나보세요.</em>.
  </div>
    <div id="caption2" class="nivo-html-caption">
   <strong>Touching your Heart</strong> <span></span> <em>세계적인 도시들의 중심에 있는 HANBIT 호텔에서 비교할 수 없는 명성과 세심한 서비스를 만나보시기 바랍니다.</em>.
  </div>
  <div id="caption5" class="nivo-html-caption">
   <strong>Ultimate Luxury and Comfort</strong> <span></span> <em>성공과 여유의 진정한 가치를 아는 당신은 우리의 고객입니다.</em>.
  </div>
 </div>	
 <div id = "notice">
		<div id="tabs">
			<ul>
    			<li><a href="#tabs-1">
   				 <font color = white style="font-family:'Nanum Myeongjo';font-size:18px;">Notice</font></a>
				</li>
				<li><a href="#tabs-2">tap2</a></li>
    			<li><a href="#tabs-1">Step3</a></li>
   				<li><a href="#tabs-2">Step4</a></li>
			</ul>
		<div id="tabs-1" >
		<%
		 try{	
			List data = (List)request.getAttribute("list");
		%>
		
		<%	
			for(int i=0 ; i<5; i++) {		
			DBListBean bean = (DBListBean)data.get(i) ;
		%>	
				 <a href = "detail.do?dt1=<%=bean.getTitle()%>&num=<%=bean.getNum()%>&content=<%=bean.getContent()%>&num=<%=bean.getNum()%>" >
				 <font color = white style="font-family:'Nanum Myeongjo'; font-size:17px;">
				 ·<%=bean.getTitle() %>
				 </font>
				 </a>		 
				<font color = white style="font-family:'Nanum Myeongjo';font-size:12px;">
				 <%=bean.getNalja() %>
				 </font>
		<% 
			}// for	
		}catch(Exception ex){System.out.println(ex.toString());}
		 %></div>
  		<div id="tabs-2">
  		<table border=1px>
  		<tr>
  		<td>
  		잘되나
  		</td>
  		</tr>
  		</table>
  		</div>
		</div>
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
<jsp:include page="bottom.jsp" flush="false"/>
</html>