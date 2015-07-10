<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Accordion Menu Using jQuery</title>
<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function()
{
	//slides the element with class "menu_body" when paragraph with class "menu_head" is clicked 
	$("#firstpane p.menu_head").click(function()
    {
		$(this).css({backgroundImage:"url(down.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
       	$(this).siblings().css({backgroundImage:"url(left.png)"});
	});
	//slides the element with class "menu_body" when mouse is over the paragraph
	$("#secondpane p.menu_head").mouseover(function()
    {
	     $(this).css({backgroundImage:"url(down.png)"}).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
         $(this).siblings().css({backgroundImage:"url(left.png)"});
	});
});
</script>
<style type="text/css">
	  @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      
body {
	font-family: 'Nanum Myeongjo';
	font-size:11pt;
	font-align:center;
}
.menu_list {	

	width: 230px;
	height:100px;
	font-align:center;
}
.menu_head {
	padding: 5px 10px;
	cursor: pointer;
	
	margin:1px;
    font-weight:bold;
   	background-color:#81725F;
   	color:white;
}
.menu_body {
	display:none;
}
.menu_body a{
  display:block;
  color:#81725F;
  background-color:#EFEFEF;
  padding-left:10px;
  font-weight:bold;
  text-decoration:none;
}
.menu_body a:hover{
  color: #000000;

  }
</style>
</head>
<body>
<div style="position:absolute; float:left; padding-left:200px; margin-top:100px;">
  <div class="menu_list" id="secondpane"> 
	<p class="menu_head"><a href="notice.jsp"><font color="white">ABOUT HOTEL</font></a></p>
		<div class="menu_body">
			<a href="noticeList.do">NOTICE</a>
			<a href="notice.jsp">PROFILE</a>
			<a href="ceogreeting.jsp">CEO Greeting</a>
         	<a href="history.jsp">HISTORY</a>
         	<a href="visionphilosophy.jsp">Vision & Philosophy</a>
         	<a href="safety.jsp">SAFETY</a>
         	<a href="find.jsp">FIND A HOTEL</a>	
		</div>
	<p class="menu_head"><a href="facility.jsp"><font color="white">FACILITIES</font></a></p>
		<div class="menu_body">
			<a href="facility.jsp">MEETING ROOM</a>
         	<a href="dining.jsp">DINING ROOM</a>
         	<a href="shop.jsp">WEDDING HOLE</a>	
		</div>
	<p class="menu_head"><a href = "step1.jsp"><font color="white">RESERVATION</font></a></p>
		<div class="menu_body">
			<a href = "step1.jsp">RESERVATION</a>
			<a href = "reservationSearch.jsp">SEARCH</a>
		</div>
		
    <p class="menu_head"><a href = "standard.jsp"><font color="white">ACCOMADATION</font></a></p>
		<div class="menu_body">
            <a href = "standard.jsp">Standard Room</a>
         	<a href="sweet.jsp">Sweet Room</a>
         	<a href="royal.jsp">Royal Room</a>			
       </div> 
    <p class="menu_head"><a href="list.do"><font color="white">MEMBERS</font></a></p>
		<div class="menu_body">
      	<a href="list.do">Review</a>
         <a href="qnalist.do">Q&A</a>	

       </div>
   
  </div>  
</div>



</body>
</html>
