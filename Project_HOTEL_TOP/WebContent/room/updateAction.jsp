<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="room.vo.RoomVO"%>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Montserrat:400,700);


form { max-width:420px; margin:50px auto; }

.feedback-input {
  font-family: Helvetica, Arial, sans-serif;
  font-weight:500;
  font-size: 18px;
  border-radius: 5px;
  line-height: 22px;
  background-color: transparent;
  border:2px solid #69300E;
  transition: all 0.3s;
  padding: 13px;
  margin-bottom: 15px;
  width:100%;
  box-sizing: border-box;
  outline:0;
}

.feedback-input:focus { border:2px solid #CC4949; }

textarea {
  height: 150px;
  line-height: 150%;
  resize:vertical;
}

[type="submit"] {
  font-family: 'Montserrat', Arial, Helvetica, sans-serif;
  width: 100%;
  background:#69300E;
  border-radius:5px;
  border:0;
  cursor:pointer;
  color:white;
  font-size:24px;
  padding-top:10px;
  padding-bottom:10px;
  transition: all 0.3s;
  margin-top:-4px;
  font-weight:700;
}
[type="submit"]:hover { background:#CC4949; }
</style>


</head>
<body >
	<%
		RoomVO rvo = (RoomVO)request.getAttribute("rvo");	
		System.out.println(rvo.getRoomID());
	%>
	<div id="ipop_close"><a href="#top" id="ipop"></a>x</div>
	<form  method="post"  action="UpdateController.do" name="myform" enctype="multipart/form-data">
		<input type="hidden" name ="dt" value=2>
		
		<div class="row">
			<div class="col-xs-12">update form </div>
		</div>

		<b>roomID:</b>
		<input type="text" class="feedback-input" name="roomCap" value="<%=rvo.getRoomID()%>">
		<b>roomType:</b>
		<input type="text" class="feedback-input" name="roomCap" value="<%=rvo.getRoomType()%>">
		<b>RoomCost:</b>
		<input type="text" class="feedback-input" name="roomCap" value="<%=rvo.getRoomCost()%>">
		<b>Capacity:</b>
		<input type="text" class="feedback-input" name="roomCap" value="<%=rvo.getRoomCap()%>">
		<b>room picture 1</b>
  		<input type="file" name="room1" class="feedback-input">
  		<b>room picture 2</b>
  		<input type="file" name="room2" class="feedback-input">
  		<b>room picture 3</b>
  		<input type="file" name="room3" class="feedback-input">
  		<b>room picture 4</b>
  		<input type="file" name="room4" class="feedback-input">
  		<b>room info 1:</b>
  		<textarea name="text" class="feedback-input" rows="8" cols="50" name="roomInfo1" ><%=rvo.getRoomInfo1()%></textarea>
  		<b>room info 2:</b>
  		<textarea name="text" class="feedback-input" rows="8" cols="50" name="roomInfo2" ><%=rvo.getRoomInfo2()%></textarea>
  		<b>room info 3:</b>
  		<textarea name="text" class="feedback-input" rows="8" cols="50" name="roomInfo3" ><%=rvo.getRoomInfo3()%></textarea>
  		<input type="submit" value="UPDATE"/>
		</form>
</body>
</html>