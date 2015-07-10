<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
  color:white;
  background-color:#EFEFEF;
  padding-left:10px;
  font-weight:bold;
  text-decoration:none;
}
.menu_body a:hover{
  color: #000000;
  text-decoration:underline;
  }
</style>
</head>
<body>
<div style="position:absolute;float:left; padding-left:200px; margin-top:100px;">
  <div class="menu_list" id="secondpane"> 
	<p class="menu_head">ABOUT HOTEL</p>
		<div class="menu_body">
			<a href="#">Link-1</a>
         	<a href="#">Link-2</a>
         	<a href="#">Link-3</a>	
		</div>
	<p class="menu_head">FACILITIES</p>
		<div class="menu_body">
			<a href="#">Link-1</a>
         	<a href="#">Link-2</a>
         	<a href="#">Link-3</a>	
		</div>
	<p class="menu_head">RESERVATION</p>
		<div class="menu_body">
          	<a href="#">Link-1</a>
         	<a href="#">Link-2</a>
         	<a href="#">Link-3</a>			
       </div>
    <p class="menu_head">ACCOMADATION</p>
		<div class="menu_body">
          	<a href="#">Link-1</a>
         	<a href="#">Link-2</a>
         	<a href="#">Link-3</a>			
       </div> 
    <p class="menu_head">MEMBERS</p>
		<div class="menu_body">
          	<a href="#">Link-1</a>
         	<a href="#">Link-2</a>
         	<a href="#">Link-3</a>			
       </div>
   
  </div>  
</div>



</body>
</html>
