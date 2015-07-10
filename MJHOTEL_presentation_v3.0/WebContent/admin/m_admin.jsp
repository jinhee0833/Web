<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>m_mjhotel.jsp</title>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">

</head>
<body id="admin_center">
	<div id="admin_title"> 
		<div class="admin_titleB">
			<span style="font-size:1.5em; padding-right:10px;">관리자</span>
			<span>관리자 페이지입니다.</span>
		</div>
	</div>
	<div id="wrap">
		<div id="admin_left">
			<ul>
				<li><a href="member.do">Member</a></li>
				<li><a href="notice.do">Notice</a></li>
				<li><a href="event.do?&pageType=now">Event</a></li>
				<li><a href="guest.do">Guest</a></li>
				<li><a href="request.do">Q&A</a></li>
				<li><a href="revCal.do">Reservation</a></li>
			</ul>
		</div>
		<div id="admin_section">
			<% 
			String pageFile=request.getParameter("page") ;
			String listFile=request.getParameter("list") ;
			/*회원정보*/
			if(listFile.equals("member")){
				pageFile="/member/member";
			/*공지사항*/
			}else if(listFile.equals("notice")){
				pageFile="/mjhotel/notice";
			}else if(listFile.equals("noticeInsert")){
				pageFile="/mjhotel/noticeInsert";
			}else if(listFile.equals("noticeDetail")){
				pageFile="/mjhotel/noticeDetail";
			}else if(listFile.equals("noticeDelete")){
				pageFile="/mjhotel/noticeDelete";
			}else if(listFile.equals("noticeEdit")){
				pageFile="/mjhotel/noticeEdit";
			/*이벤트*/	
			}else if(listFile.equals("event")){
				pageFile="/event/event";
			}else if(listFile.equals("eventInsert")){
					pageFile="/event/eventInsert";	
			}else if(listFile.equals("reply")){
				pageFile="/event/reply";	
			}else if(listFile.equals("replyDelete")){
				pageFile="/event/replyDelete";
			}else if(listFile.equals("replyInsert")){
				pageFile="/event/replyInsert";	
				
			/*이용후기*/	
			}else if(listFile.equals("guest")){
				pageFile="/guest/guest";
			}else if(listFile.equals("guestDetail")){
				pageFile="/guest/guestDetail";
			}else if(listFile.equals("guestDelete")){
				pageFile="/guest/guestDelete";
			/*문의사항*/	
			}else if(listFile.equals("request")){
				pageFile="/qna/request";
			}else if(listFile.equals("requestDetail")){
				pageFile="/qna/requestDetail";	
			}else if(listFile.equals("requestDelete")){
				pageFile="/qna/requestDelete";		
			/*예약현황*/	
			}else if(listFile.equals("reservation_Cal")){
				pageFile="/reservation/reservation_Cal";
			}else if(listFile.equals("reservation_Board")){
				pageFile="/reservation/reservation_Board";
			}
			

			if(listFile.equals("member")){ %>			
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("notice")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeInsert")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeDelete")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeEdit")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("event")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("eventInsert")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("replyDelete")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("replyInsert")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("guest")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("guestDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("guestDelete")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("request")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("requestDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("requestDelete")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("reservation_Cal")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("reservation_Board")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% } %>
		</div>
	</div>
</body>
</html>