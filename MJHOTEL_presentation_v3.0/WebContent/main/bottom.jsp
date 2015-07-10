<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>bottom</title>
<style type="text/css">
    #link>ul>li>a.facebook {
  		display:block; 
		width:25px;
		height:25px;
		background:url(main/images/facebook_off.png) no-repeat;
		/* 사이즈 조절 대체 background-size
		filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/facebook_off.png', sizingMethod='scale');
 		-ms-filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/facebook_off.png', sizingMethod='scale')";
 		*/
    }
    #link>ul>li>a:hover.facebook {
  		background:url(main/images/facebook_on.png) no-repeat;
    }
    #link>ul>li>a.twitter {
 		display:block; 
		width:25px;
		height:25px;
		background:url(main/images/twitter_off.png) no-repeat;
    }
    #link>ul>li>a:hover.twitter {
   		background:url(main/images/twitter_on.png) no-repeat;
    }
    #link>ul>li>a.map {
 		display:block; 
		width:25px;
		height:25px;
		background:url(main/images/map_off.png) no-repeat;
    }
    #link>ul>li>a:hover.map {
   		background:url(main/images/map_on.png) no-repeat;
    }
    #link>ul>li>a span {
   		display:none;
    } 
</style>   
</head>
<body>
<div id="bottom">
<div class="center">
		<div id="adress">
		    <ul>
		        <li>MJ HOTEL</li>
		        <li>TEL 02-1234-1234</li>
		        <li style="padding-left:100px;">Copyright ⓒ 2014 MJHOTLE All Rights Reserved.</li>
		    </ul>
		</div>
		<div id="link">
		    <ul>
		        <li><a href="https://ko-kr.facebook.com/" class="facebook"><span>페이스북</span></a></li>
		        <li><a href="https://twitter.com/" class="twitter"><span>트위터</span></a></li>
		        <li><a href="index.jsp?page=mjhotel/m_mjhotel&list=findhotel" class="map"><span>지도</span></a></li>
		    </ul>
		</div>
	</div>
</div>	
</body>
</html>