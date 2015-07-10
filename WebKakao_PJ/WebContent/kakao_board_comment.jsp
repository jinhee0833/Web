<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="WebKakao_PJ.db.*" %>
<%@ include file = "session_check.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#scrollbar1 { width: 750px; clear: both; margin: 20px 0 10px; }
	#scrollbar1 .viewport { width: 720px; height: 110px; overflow: hidden; position: relative; }
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
 <script type="text/javascript">
	$().ready(function(){
	  
		$('#scrollbar1').tinyscrollbar();

	});
</script>
<script language="javascript">
	
	function setContent() {
		var rtn = "";
		var params = { memo_content : $('#c_content').val(),
				brd_idx : <%=request.getParameter("idx")%> };
		    $.ajax({
		        type: "POST",
		        data: params,
		        url: "ajax_comment_save.jsp",
		        dataType: 'text',
		        success: function (data) {
		            rtn = data;
		            if ( data.trim() == "ok" ){
		            	location.reload();
		            	alert("댓글이 성공적으로 등록되었습니다.");
		            	
		            }else{
		            	alert("댓글등록실패");
		            }
		        }
		    });
		
		    return rtn;
		
		}
	
	function deleteComment(c_idx){
		var rtn = "";
		var params = { comment_idx : c_idx};
		    $.ajax({
		        type: "POST",
		        data: params,
		        url: "ajax_comment_delete.jsp",
		        dataType: 'text',
		        success: function (result) {
		            rtn = result;
		            //alert(result);
		           	if ( result.trim() == "ok" ){
		           		alert("댓글이 성공적으로 삭제 되었습니다");
		           		location.reload();
		           	}else if ( result.trim() == "no2"){
		           		alert("댓글 작성자만 삭제할수 있습니다.");
		           	}else{
		           		alert("댓글삭제실패");
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
	<form name="comment" method="post" action="comment_insert.do">
		
	<div id="scrollbar1">
    <div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>
    <div class="viewport">
    <div class="overview">
		<table border=0 width="100%" bgcolor="#eeeeee">
			<tr>
				<td height="1" bgcolor="#aaaaaa"></td>
			</tr>
			<tr>
				<td valign="middle">
					<input type="hidden" name="brd_idx"	value="<%=request.getParameter("idx")%>"> 
					<b>댓글남기기 : </b>&nbsp;
					<input type="text" name="content" id="c_content" size=70> &nbsp; 
					<img src="images/btn_save.jpg" onclick="javascript:setContent()" style="cursor:hand">
					<input type="hidden" name="name" value="<%=user_name %>" />
				</td>
				<tr>
					<td height="1" bgcolor="#aaaaaa"></td>
				</tr>
			</tr>
		</table>
		
		<table>
			<tr>
				<td width="30"></td>
				<td><table>
			<%
				try {
						List list = (List) request.getAttribute("comment_list");
						//out.print(list.size());
						for (int i = 0; i < list.size(); i++) {
							Comment_Bean combean = (Comment_Bean) list.get(i);
			%>
			<tr>
				<td width="50"><%=combean.getComment_name()%></td>
				<td width="450"><%=combean.getComment_content()%></td>
				<td width="100"><%=combean.getComment_date()%></td>
				<td width="50"><a onclick="deleteComment(<%=combean.getComment_idx() %>)" style="cursor:hand">[삭제]</a></td>
			</tr>
			
			<%
				} //for end
				} catch (Exception ex) {
				}
			%>
			
			</table>
			</td></tr>
			
		</table>
		</div>
		</div>
		</div>
	</form>
</body>
</html>