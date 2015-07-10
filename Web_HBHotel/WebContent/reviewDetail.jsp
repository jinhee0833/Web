<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.hb.common.DBListBean" %>
<%@ page import="net.hb.common.DBReplybean" %>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head><title>[guestDetail.jsp]</title>
<link rel="Stylesheet" type="text/css" href="css/review.css" media="screen">
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
 <%
 request.setCharacterEncoding("UTF-8");
 DBListBean bean = (DBListBean)request.getAttribute("detail");
 List bean2 = (List)request.getAttribute("comment");
try{
%>
function check(){	
	if(review.sname.value==review.name.value){
		alert("수정창으로 이동합니다.");
	}else{alert("자신의 글만 수정할 수 있습니다.");}
}
function del(){	
	if(review.sname.value==review.name.value){		
		var num =<%=bean.getNum()%>;
		alert("글을 삭제하시겠습니까?");
		location.href = "delete.do?num="+num;
	}else{alert("자신의 글만 삭제할 수 있습니다.");}
}
function replyOk(aa){
	var num =<%=bean.getNum()%>;
	var name = aa; 
	var r_content = document.review.r_content.value;
	if(r_content.length > 40){
		alert("40자 이하로 남겨주세요!");
	}
	else{
		var dd = "reinsert.do?num="+num+"&name="+name+"&r_content="+encodeURI(encodeURIComponent(r_content));
		location.href = dd;
	}
}
</script>

<style type="text/css">
	td{font-size:15pt}
	a{text-decoration:none;}
	a:hover{text-decoration:none; color:brown;font-weight:bold;}
	.review{	
		position: absolute;
		top: 225px;
		width: 1759px;
		text-decoration:none; 
		font-family: 'Nanum Myeongjo';
		height:900px;
		background-color: #ffffff; 
 	  }
 	  #m{
			position: absolute;
			margin-left: 500px; 
			top: 50px;
			width: 1100px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
		}
		#f{
			position: absolute;
			margin-left: 230px; 
			top: 50px;
			width: 10px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
		}

@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

</style>
</head>
<%!
	private int total;
	private int totalPage;
	private int start;
	private int startPage;
	private int pageSize;
	private int pageNum;
	private int limit;
	private String num;
%>
<body>
<%
	num = String.valueOf(request.getAttribute("num"));
	total = Integer.parseInt(String.valueOf(request.getAttribute("total")));
	totalPage = Integer.parseInt(String.valueOf(request.getAttribute("totalPage")));
	start = Integer.parseInt(String.valueOf(request.getAttribute("start")));
	startPage = Integer.parseInt(String.valueOf(request.getAttribute("startPage")));
	limit = Integer.parseInt(String.valueOf(request.getAttribute("limit")));
	pageSize = Integer.parseInt(String.valueOf(request.getAttribute("pageSize")));
%>
<div class="review">
	<%@ include file="sidebar.jsp"%>
		<div id = "f" >
			Review
		</div>		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="notice.jsp">Review</a> 
		<h1>Review</h1><br>
	</div>
	<form name=review method="post" action=reviewEdit.jsp> 
		<table width="700" height="500" style="margin-left:500px;margin-top:60px;">
			<tr>
				<th align=left colspan="2" height=30 style="padding-top:60px;" >
					<font color ="#D45050" size=2px> HANBIT호텔 방문 후기를 남겨주시면,매월 첫째주 월요일 추천을 통하여</font> 레스토랑 식사권
					<font color="#D45050">을 드립니다.</font>
					<input type=hidden value=<%=bean.getNum()%> name="num">
				</th>
			</tr>				
			<tr>
				<th bgcolor=#F4EEE3 align="center" width=80 height=40><font style="font-size:15px;">작성자</font></th>
				<td><input type="text" name="name" id="name" size="40" value =<%=bean.getName()%> readOnly>
				<input type=hidden value=<%=loginId%> id="sname" name="sname">
				</td>
			</tr>	
			<tr>
				<th bgcolor=#F4EEE3 align="center" height=40><font style="font-size:15px;">제 목</font></th>
				<td><input type="text" name="title" size="40"  value ="<% out.println(bean.getTitle()); %>" readOnly></td>
			</tr>		
			<tr>
			<th bgcolor=#F4EEE3 align="center" ><font style="font-size:15px;">내 용</font></th>
				<td><textarea name="content" rows="20" cols="60" readOnly> <%=bean.getContent()%> </textarea></td>
			</tr>
			</table>
			<table width="700"  bgcolor=#EFEFEF style="margin-left:500px;">
			<% 
			for (int i = start; i < start+limit; i++) {
				if(i == bean2.size()){
					break;
				}
				DBReplybean bean3 = (DBReplybean)bean2.get(i);
	 			%>	 					
	 		<tr>	 		
				<td width = 200>				
	 			<font color="blue" style="font-size:17px;">
	 			<%=bean3.getR_name()%>
	 			</font>
	 			</td>
	 			<td><font color="black" style="font-size:13px;"><%=bean.getNalja()%></font>
	 			</td>
	 		</tr>
	 		<tr height=5></tr>	
	 		<tr>	 						
	 			<td >
	 			<font color="black" style="font-size:15px;"><%= bean3.getR_content() %></font>             				
                 </td>
                <td>
             	<%if(loginId.equals(bean3.getR_name())){ %>
	 			<a href = "redel.do?recontent=<%= bean3.getR_content() %>&title=<%=bean.getTitle()%>&content=<%=bean.getContent()%>&num=<%=bean.getNum()%>">
	 			<font color="orange" style="font-size:13px;">삭제</font></a>  	 							
	 			<% }%>          
              	</td>
          	 </tr>
          	 <tr>
          		 <td>
					<img src ="images/new.gif">									
  				</td>
          	 </tr>
          	 <%}%>  
          	 <tr>
				<td colspan=6 align='center'>
					<%
						if (startPage > pageSize) {
							out.println("<a href = detail.do?pageNum="
									+ (startPage - pageSize) + "&num=" + num + ">[이전]" + "</a>");
						}
						for (int i = startPage; i < (startPage + pageSize); i++) {
							if (i > totalPage) {
								break;
							}
							if (i == pageNum) {
								out.println("<font color =red> [" + i + "]</font> ");
							} else {
								out.println("<a href = detail.do?pageNum=" + i + "&num=" + num + ">" + i+ "</a>");
							}
						}
						if (pageSize <= totalPage - startPage) {
							out.println("<a href = detail.do?pageNum="
									+ (startPage + pageSize) + "&num=" + num + ">[다음]" + "</a>");
						}
					%>
				</td>
			</tr>	
          	</table>
          	<table width="700" style="margin-left:500px;">	 		
			<tr>
			<td colspan="2" bgcolor="#F4EEE3" >	
					<%=loginId %>
					<input type=text size = 70 value="댓글을 입력하세요." name = "r_content">	 		
					<input type="button" value=댓글완료 onClick = "replyOk('<%=loginId%>')">					
			</tr>
			<%
				}catch(Exception ex){ }
			%>
			<tr >
				<td colspan="2" bgcolor="#F4EEE3" align="center" bgcolor="#F4EEE3" height=50 >				
					<input type="button" value="목록보기" onClick="window.location='list.do'" style="margin-bottom:10px;">
					<input type=submit value=수정하기 onClick="check()" style="margin-bottom:10px;">
					<input type="button" value="삭제하기" onClick="del()" style="margin-bottom:10px;">										
			</tr>
		</table>
	</form>
</div>

<%@ include file="bottom.jsp"%>
</body>
</html>