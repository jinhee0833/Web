<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="WebKakao_PJ.db.*" %>
<html>
<head>
<title>MyStory</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#scrollbar1 { width: 520px; clear: both; margin: 20px 0 10px; }
	#scrollbar1 .viewport { width: 500px; height: 200px; overflow: hidden; position: relative; }
	#scrollbar1 .overview { list-style: none; position: absolute; left: 0; top: 0; }
	#scrollbar1 .thumb .end,
	#scrollbar1 .thumb { background-color: #003D5D; }
	#scrollbar1 .scrollbar { position: relative; float: right; width: 15px; }
	#scrollbar1 .track { background-color: #D8EEFD; height: 100%; width:13px; position: relative; padding: 0 1px; }
	#scrollbar1 .thumb { height: 20px; width: 13px; cursor: pointer; overflow: hidden; position: absolute; top: 0; }
	#scrollbar1 .thumb .end { overflow: hidden; height: 5px; width: 13px; }
	#scrollbar1 .disable{ display: none; }
	.noSelect { user-select: none; -o-user-select: none; -moz-user-select: none; -khtml-user-select: none; -webkit-user-select: none; }
</style>
<script language="javascript" src="Jquery/jquery.js"></script>
<script language="javascript" src="Jquery/jquery_s.js"></script>

<script language="javascript">
  function comment_send(){
	  if(comment.content.value==""){
		  alert('댓글 내용을 입력해주세요');
		  comment.content.focus();
		  return;
	  }
	 if(confirm('댓글을 등록하시겠습니까?')){
		 comment.submit();
	 } 
  }
 </script>
 <script type="text/javascript">
	$().ready(function(){
	  
		$('#scrollbar1').tinyscrollbar();

	});
</script>
 <script type="text/javascript">
	function del_confirm(){
		var flag=confirm("삭제하시겠습니까?");
		if(flag==true){
			location.href="delete.do?idx="+<%= request.getParameter("idx") %> ; 
		}
	}

	function recom(idx_){
		var rtn = "";
		
	    $.ajax({
	        type: "POST",
	        data : { idx : idx_ },
	        url: "ajax_board_recom.jsp",
	        dataType: 'text',
	        success: function (data) {
	            rtn = data;
				if ( data.trim() == 'no1' ){
					alert('자신의 글에 추천할수 없습니다');
				}else{
					alert('추천하였습니다');
					$('#recom_su').text(data);
				}
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
<body>
<%@ include file="kakao_header.jsp" %>
<%
	try{
		Board_bean bean = (Board_bean) request.getAttribute("list");
		int minIdx = (Integer) request.getAttribute("minIdx");
		int maxIdx = (Integer) request.getAttribute("maxIdx");
		int pageNUM = (Integer) request.getAttribute("pageNUM");
%>
<table width="800" border="0" cellspacing=0 cellpadding=0>
	<tr>
		<td width=25>&nbsp;</td>
		<td style='font-size:1px; width:2px; border:1px solid #000;'>
			<table width="750" border="0" cellspacing=0 cellpadding=0>
				<tr>
					<td height=3>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<table border="0" cellspacing=0 cellpadding=3>
							<tr>
								<td>작성자</td>
								<td><%= bean.getBrd_name() %></td>
								<td width=450>&nbsp;</td>
								<td><a href="editpre.do?idx=<%= bean.getBrd_idx() %>">
									<img src="images/btn_edit.jpg" border=0></a>
								</td>
								<td></td>
								<td><a href="javascript:del_confirm()"><img src="images/btn_del.jpg" border=0></a>
								</td>
							</tr>
							<tr>
								<td>날짜</td>
								<td><%= bean.getBrd_date() %></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>추천수 </td>
								<td><%= bean.getBrd_rcmd() %></td>
							</tr>
						</table>
					</td>
				</tr> 
				<tr>
					<td style='font-size:1px; border:1px solid #000;'>
						<% if (bean.getBrd_file().equals("noimage.jpg")) { %>
							<img src="images/noimage.jpg" width=750 height=500 border="0"></img>
						<% }else{ %>
							<img src="./imgUpload/<%= bean.getBrd_file() %>" width=750 height=500 border="0"></img>
						<% } %>
					</td>
				</tr>
				<tr>
					<td height=20>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<%= bean.getBrd_content() %>
					</td>
				</tr>
				<tr>
					<td height=10>&nbsp;</td>
				</tr>
				
				<tr>
					<td>
					<!-- 댓글이 들어감 -->
						<%@ include file="kakao_board_comment.jsp" %>
					</td>
				</tr>
				<tr>
					<td height=0></td>
				<tr>
					<%	if(bean.getBrd_idx()-1 >= minIdx && bean.getBrd_idx()+1 <= maxIdx){%>
					<td align="center">
					<a href="detail.do?idx=<%= bean.getBrd_idx() -1 %>&pageNUM=<%= pageNUM %>&flag=true&action=pre"> <img src="./images/btn_prev.jpg" border="0" width="60" height="25"></a>&nbsp; 
					<a href="detail.do?idx=<%= bean.getBrd_idx() +1 %>&pageNUM=<%= pageNUM %>&flag=true&action=next"> <img src="./images/btn_next.jpg" border="0" width="60" height="25"></a> &nbsp;
					<img src="./images/btn_recom.jpg" border="0" width="60" height="25" onclick="recom('<%=bean.getBrd_idx()%>');" style="cursor: pointer">  &nbsp;
					<a href="myList.do?pageNUM=<%= pageNUM %>"> <img src="./images/btn_list.jpg" border="0" width="60" height="25"> </a>&nbsp;
					</td>
					<%}else{ %>
						<%if(bean.getBrd_idx()-1 < minIdx){ %><td align="center"><a href="detail.do?idx=<%= bean.getBrd_idx() +1 %>&pageNUM=<%= pageNUM %>&flag=true&action=next"> <img src="./images/btn_next.jpg" border="0"></a>&nbsp; 
						<img src="./images/btn_recom.jpg" border="0" onclick="recom('<%=bean.getBrd_idx()%>');" style="cursor: pointer">  &nbsp;
						<a href="myList.do?pageNUM=<%= pageNUM %>"> <img src="./images/btn_list.jpg" border="0" width="60" height="25"> </a></td>&nbsp;
						<%}else if(bean.getBrd_idx()+1 > maxIdx){ %><td align="center"> <a href="detail.do?idx=<%= bean.getBrd_idx() -1 %>&pageNUM=<%= pageNUM %>&flag=true&action=pre">  <img src="./images/btn_prev.jpg" border="0" width="60" height="25"></a>&nbsp; 
						<img src="./images/btn_recom.jpg" border="0" width="60" height="25"onclick="recom('<%=bean.getBrd_idx()%>');" style="cursor: pointer">  &nbsp;
						<a href="myList.do?pageNUM=<%= pageNUM %>"> <img src="./images/btn_list.jpg" border="0" width="60" height="25"> </a></td>&nbsp;
					<%}
					}%> 
				</tr>
				<tr>
					<td height=0>&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width=25>&nbsp;</td>
	</tr>
<%
	}catch(Exception ex){ }
%>
</table>

</body>
</html>