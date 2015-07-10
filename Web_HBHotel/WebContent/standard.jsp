<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ include file="roomsidebar.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<style>


		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol;}
		
.standard{margin-top: 90px;  padding:0px;height:1300px;background-color:#ffffff;  padding-top:30px; width: 1759px;}
.text{left:500px;  margin-top:170px;position:absolute; width:800px;height:250px; background:#D8D5D2; font:10pt;  }
.box_skitter{left:500px; top:130px;}
.bottom{background-color:#010101;
		position: absolute;
		top: 1500px;
		padding:0px; 
		height:200px;
		width: 1759px;
		}
		
			#af{
			position: absolute;
			margin-left: 500px; 
			top: 280px;
			width: 500px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			
		}
</style>

<link href="css/skitter.styles.css" type="text/css" media="all" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/jquery.skitter.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.animate-colors-min.js"></script>


<script>
$(function(){
 $('.box_skitter_large').skitter({thumbs: true,label: true});
});
</script>

</head>
<body>



<div class="standard">


		<div id = "af" >
			<a href="layout.jsp">Home</a> > <a href="facility.jsp">ROOM</a> > STANDARD
		<h1>STANDARD</h1>
		</div>
	<div class="box_skitter box_skitter_large" >

    <ul>
        <li>
           <a href="#"><img src="images/sp1.jpg" class="random" /></a>
            <div class="label_text">
            </div>
        </li>
        <li>
           <a href="#"><img src="images/sp2.jpg" class="random" /></a>
            <div class="label_text">
            </div>
        </li>

        
        <li>
           <a href="#"><img src="images/sp3.jpg" class="random" /></a>
            <div class="label_text">
            </div>
      </li>
       <li>
           <a href="#"><img src="images/sp4.jpg" class="random" /></a>
            <div class="label_text">
            </div>
      </li>
      <li>
           <a href="#"><img src="images/sp5.jpg" class="random" /></a>
            <div class="label_text">
            </div>
      </li>
      <li>
           <a href="#"><img src="images/sp6.jpg" class="random" /></a>
            <div class="label_text">
            </div>
      </li>
      <li>
           <a href="#"><img src="images/sp6.jpg" class="random" /></a>
            <div class="label_text">
            </div>
      </li>
    </ul>
    <font size="6pt"><b> STANDARD ROOM </b></font>
</div>
<p><br>
<div class="text">

<font style="font-size: 25pt"  > <b>information</b></font><br><br>
한빛 호텔의 스텐다드 룸은 품위와 실용성을 동시에 추구하는 고객님들께 기대 이상의 만족을 드리는 맞춤형 공간입니다.<br> 
효율적인 비즈니스 업무에 필요한 최신 시설과 더불어, 
현대적이고 감각적인 객실 디자인은 머무시는 동안 편안함과 아늑함을 선사해 드립니다. 
<br><p>

<font style="font-size: 15pt" > 
<b>객실기본정보</b></font><br><br>
＊ 스텐다드(더블베드룸 / 트윈베드룸) <br> 
＊ 스텐다드(트리플룸)<br>
＊ 10% 부가세 별도<br>
＊ 체크인 오후3시, 체크아웃 오전11시

<br><br><br>

<font style="font-size: 15pt" > 
<b>객실예약 및 문의</b></font><br>
☏ ℡ : 010-5447-3269
<br><br><br>

 <font style="font-size: 15pt" > <b>제공서비스</b></font><br>
<img src="images/s7.jpg"><br><br>
</div>
</div>
<div class="bottom">

<table width=100%>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
			<tr>
				<td rowspan="5" align="right">
					<table>
						<tr>
							<td>
								<FONT size="7" style="font-family:AR BERKLEY; color: #91826E;">HANBIT</FONT>
							</td>
						</tr>
						<tr>
							<td>
								<hr>
							</td>
						</tr>
						<tr>
							<td align="center" style='font-size: 11pt; font-family: "휴먼옛체"; color: #91826E;'>
								H O T E L S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&&nbsp;&nbsp;&nbsp;&nbsp;R E S O R T
							</td>
						</tr>
						<tr>
							<td>
								<hr>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;' align="center">
					<a href="notice.jsp" style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;'>공지사항 / NOTICE</a> 
					· <a href="history.jsp" style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;'>연혁 / HISTORY</a> 
					· <a href="find.jsp" style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;'>오시는길 / FIND</a>
					· <a href="list.do" style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;'>후기 / REWIEW</a> 
					· <a href="qnalist.do" style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;'>질의응답 / Q&A</a>
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;' align="center">
					대표이사 : 이선경 &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; ㈜ HANBIT HOTEL & RESORT
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;' align="center">
					대표번호 : 02-707-1480  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 팩스 : 02-707-1481
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 고객센터 : 02-707-1482~5
				</td>
			</tr>
			<tr>
				<td style='font-size: 11pt; font-family: "새굴림"; color: #91826E; font-weight: bold;' align="center">
					주소 : 서울 마포구 신수동 63-14 구프라자 / Guplaza 63-14 Sinsu-dong Mapo-gu Seoul
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr>
				</td>
			</tr>
		</table>

</div>
</body>

</html>