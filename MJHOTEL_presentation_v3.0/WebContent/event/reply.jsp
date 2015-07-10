<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="event.common.DBbean2" %>
<%@ page import="event.common.DBSQL2" %> 
<%@ page import="event.common.DBbean" %>
<%@ page import="javax.servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>reply.jsp</title>
<%
response.setContentType("text/html; charset=utf-8");
request.setCharacterEncoding("utf-8");

DBbean2 bean2 = new DBbean2();
DBSQL2 dbsql = new DBSQL2();
%>
<script language = "javascript">
	function goDel(r_num,r_passwd){
		window.open("./event/replyDelete.jsp?r_num="+r_num+"&r_passwd="+r_passwd,"Delete","width=350, height=100");
	}
	
	function check(){				 
	    if(reply.r_name.value == null || reply.r_name.value == ""){		 
	        alert("이름을 입력하세요.");		 
	        reply.r_name.focus(); 	 
	        return false;		 
	    }//if end		
	    if(reply.r_passwd.value == null || reply.r_passwd.value == ""){		 
	        alert("비밀번호를 입력하세요.");		 
	        reply.r_passwd.focus(); 	 
	        return false;		 
	    }//if end
	    if(reply.r_content.value == null || reply.r_content.value == ""){		 
	        alert("내용을 입력하세요.");		 
	        reply.r_content.focus(); 	 
	        return false;		 
	    }//if end
	}//end
</script>
</head>
<body>
	<form name=reply method=post action=event/replyInsert.jsp onsubmit="return check()">
	<input type=hidden name=num value= <%= request.getParameter("num") %>>
		<table class="guest_commentF">
		<tr>
			<td width="25%">작성자<input type=text name=r_name size=10 class="ta"></td>
			<td width="25%">비밀번호<input type=password name=r_passwd size=10 class="ta"></td>
			<td width="50%" align="right"><input type='submit' value='덧글입력' class="bt2"></td>		
		</tr>
		<tr>
			<td colspan=3>
			<textarea name=r_content class="ta3"></textarea>
			</td>
		</tr>	
		</table>	
	</form>
	<p>
<!-- 코멘트 리스트  -->	
	<form method=post name=replylist>
<% 	
try{
	ArrayList<DBbean2> list = dbsql.select();
			
	List detail = (List) request.getAttribute("detail");
	
	if(list.size( ) > 0 && list != null){
		for(int i=0; i<detail.size(); i++){
			DBbean bean = (DBbean)detail.get(i);
			for(int j=0; j<list.size(); j++){
				bean2 = list.get(j);
				if(bean.getNum()==bean2.getNum()){					
%>	
		<table class="event_commentF">		
			<tr>
			<td class="comment1"><%= bean2.getR_name() %></td>
			<td class="comment2"><%= bean2.getR_sdate() %></td>
			<td class="comment3" rowspan="2">
			<input type=button onclick="goDel('<%= bean2.getR_num() %>','<%= bean2.getR_passwd() %>')" value="삭제" class="bt2">
			</td>
			</tr>
			<tr>
			<td class="comment4" colspan="2"><%= bean2.getR_content() %></td>
			</tr>
		</table>	
<%
				}//if end
			}//for end
		}//for end	
	}//if end
	
}catch(Exception ex){}
%>
	</form>
</body>
</html>