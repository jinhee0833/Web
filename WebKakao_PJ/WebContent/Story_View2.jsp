<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="WebKakao_PJ.db.*" %>
<html>
<head>
<title>[ Story_View2 ]</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="Jquery/jquery.js"></script>
<script language="javascript">

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

</script>
</head>
<body>
<%@ include file="kakao_header.jsp" %>
<%
	try{
		Board_bean bean = (Board_bean) request.getAttribute("list");
		int pageNUM = (Integer) request.getAttribute("pageNUM");
		int minIdx = (Integer) request.getAttribute("minIdx");
		int maxIdx = (Integer) request.getAttribute("maxIdx");
		
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
								<td width=500>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>날짜</td>
								<td><%= bean.getBrd_date() %></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>추천수</td>
								<td align="right"><div id="recom_su"><%= bean.getBrd_rcmd() %></div></td>
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
					<%	if(bean.getBrd_idx()-1 >= minIdx && bean.getBrd_idx()+1 <= maxIdx){%>
					<td align="center">
					<a href="detail.do?idx=<%= bean.getBrd_idx() -1 %>&pageNUM=<%= pageNUM %>&flag=false&action=pre"> <img src="./images/btn_prev.jpg" border="0" width="60" height="25"></a>&nbsp; 
					<a href="detail.do?idx=<%= bean.getBrd_idx() +1 %>&pageNUM=<%= pageNUM %>&flag=false&action=next"> <img src="./images/btn_next.jpg" border="0" width="60" height="25"></a> &nbsp;
					<img src="./images/btn_recom.jpg" border="0" width="60" height="25" onclick="recom('<%=bean.getBrd_idx()%>');" style="cursor: pointer">  &nbsp;
					<a href="frList.do?pageNUM=<%= pageNUM %>"> <img src="./images/btn_list.jpg" border="0" width="60" height="25"> </a>&nbsp;
					</td>
					<%}else{ %>
						<%if(bean.getBrd_idx()-1 < minIdx){ %><td align="center"><a href="detail.do?idx=<%= bean.getBrd_idx() +1 %>&pageNUM=<%= pageNUM %>&flag=false&action=next"> <img src="./images/btn_next.jpg" border="0"></a>&nbsp; 
						<img src="./images/btn_recom.jpg" border="0"onclick="recom('<%=bean.getBrd_idx()%>');" style="cursor: pointer">  &nbsp;
						<a href="frList.do?pageNUM=<%= pageNUM %>"> <img src="./images/btn_list.jpg" border="0" width="60" height="25"> </a></td>&nbsp;
						<%}else if(bean.getBrd_idx()+1 > maxIdx){ %><td align="center"> <a href="detail.do?idx=<%= bean.getBrd_idx() -1 %>&pageNUM=<%= pageNUM %>&flag=false&action=pre">  <img src="./images/btn_prev.jpg" border="0" width="60" height="25"></a>&nbsp; 
						<img src="./images/btn_recom.jpg" border="0" width="60" height="25"onclick="recom('<%=bean.getBrd_idx()%>');" style="cursor: pointer">  &nbsp;
						<a href="frList.do?pageNUM=<%= pageNUM %>"> <img src="./images/btn_list.jpg" border="0" width="60" height="25"> </a></td>&nbsp;
					<%}
					}%> 
				</tr>

				
				<tr>
					<td height=20>&nbsp; </td>
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