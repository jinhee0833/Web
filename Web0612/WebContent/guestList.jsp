<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>


<html>
<head> <title> [guestList.jsp]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
<body>

<%!
	Connection CN; //db서버정보,id,password/ 명령어생성
	Statement  ST; //ST=CN.createStatement( )
	PreparedStatement PST; //PST=CN.prepareStatement(sql)
	ResultSet RS; //RS=ST.executeQuery(select~); 
	              //조회한결과를 RS기억, 첫번째레코드이동 next( )
	              
	private  String sql;
	private  int Gsabun; //사번
	private  String Gname; //이름
	private  String Gtitle; //제목
	private  int start=11; // [2]클릭  11레코드번호
	private  int end=20; //   [2]클릭  20레코드번호
	
	private  int total=0, pagecount=1,Gtotal=0;  
	///////////////페이징구분에 필요한 필드///////////////////
	private  String pnum; // <a href=guestList.jsp?pageNUM
	private  int pageNUM;
	private  int limit=10, pagesize=10 ;
	private  int startpage=1, temp=1;
	private  int num=0;  // num = 총페이지  - ( ) * limit ; 
	
	///////////////검색 필요한 필드///////////////////
	private  String skey; //select에서 선택한 항목
	private  String sval; //검색키워드
	private  String  sqry; //검색에필요한 쿼리문
	private  String  returnpage ; //이름검색 g => [1][2][3][4][5]
%>

<%
  try{
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	   CN=DriverManager.getConnection(url, "system", "oracle");
	   //out.println("<h1>연결성공성공 2:34 2:37 3:20 </h1>"); 
  }catch(Exception ex){  }
%>

<%
	skey=request.getParameter("keyfield"); //콤보박스에서 선택
	sval=request.getParameter("keyword");//검색어입력
	sqry= " " ;
	if(skey==null || sval==null){ //필드도선택안하고,검색키워드입력안하고
		skey="title";   sval=""; 
	}
	sqry="  where "	 + skey.trim( ) + " like '%" + sval.trim( ) + "%'";
	returnpage = "&keyfield=" + skey +"&keyword="+ sval ; //맨마지막추가
	
 Statement ST2 = CN.createStatement();
 ResultSet RS2 = ST2.executeQuery("select count(*) as cnt from guest "  + sqry);
 if(RS2.next()==true){
	 total = RS2.getInt("cnt");
 }
%>	
<table  width=800  border="1"  cellspacing="0">	
	<tr	 align="center" height="45">
		<td colspan=6>
			<form  action="guestList.jsp" method="get">		
					검색:
					<select name="keyfield">
						<option value="name" selected>이 름 </option>         
						<option value="title" >제 목 </option>
						<option value="content">내 용  </option>
					</select>	
					<input type="text" name="keyword" value="">
					<input type="submit" value="검 색">			
					
			</form>
		</td>
	 </tr>

	<tr align="right"  height="45" bgcolor=yellow>
		<td colspan=6>	
			<font size=6> 레코드갯수: <%=  total %> &nbsp;&nbsp;</font>
		</td> 
	</tr>
	

	<tr bgcolor="pink" align="center" height="45">
		<td>글번호</td> <td>사 번</td> <td>이 름</td>
		<td>제 목</td>  <td>날 짜</td> <td>급 여</td> 
	</tr>
<%
  try{
	  pnum = request.getParameter("pageNUM");//[1][2]~[9][10]
	  if(pnum==null) {  pageNUM=1; }
	  else { pageNUM = Integer.parseInt(pnum); }
	  
	  //전체레코드 780개  780%10레코드로 가정하겠습니다
	  //total=780  한번호당 10개식출력 [1][2][3][4][5]
	  if(total%limit==0){ pagecount= total/limit; }
	  else{ pagecount = total/limit + 1 ; } 
	  
	  start = (pageNUM-1)*pagesize + 1 ; //[3] pagecount  상관없어요
	  end = pageNUM*pagesize ; //[3]  pagecount 상관없어요
	  
	 //sql="select  rownum  as rn, sabun,name,title, nalja, pay from  guest";
	 sql =  "select  *  from  (";
	 sql += "select  rownum as rn, sabun,name,title, nalja, pay from  " ;
	 sql += " (select * from  guest " + sqry + " order by sabun )" ; 
	 sql += ") where rn between " + start + " and " + end ;
	 System.out.println(sql) ;
	 
	 ST = CN.createStatement();
	 RS = ST.executeQuery(sql); //조회한결과전체값을 RS기억
	 
	 //시작페이지를 알아야 이유  [1]~10 [11]~20  [21]~30
	 //[31][32][33] ~~~[38클릭][39][40]
	 temp= (pageNUM-1)%limit;   
	 startpage=pageNUM-temp;  
	 System.out.println("temp="+temp+"\tstartpage=" + startpage);
	 ///////////////num변수 계산 뽑아내세요 
	 num = total-(pageNUM-1)*limit ; //303
	 
	 while(RS.next()==true){
		 Gsabun=RS.getInt("sabun");
		 Gname=RS.getString("name");
		 Gtitle=RS.getString("title");
		 
		 String sql3 = "select count(*) as rcnt from guestreply where sabun =  "+ Gsabun;
		 System.out.println(sql3+"\n");
		 Statement ST3 = CN.createStatement();
		 ResultSet RS3 = ST3.executeQuery(sql3);
		 if(RS3.next()==true){
			 Gtotal = RS3.getInt("rcnt");
		 }
%>
	<tr
		onmouseOver="style.backgroundColor='#eeeeee' "
		onmouseOut="style.backgroundColor='' "
	>
		<td> <%= num-- %> </td>
		<td> <%= Gsabun %> </td>
		<td> <%= Gname %> </td>
		<td><a href="guestDetail.jsp?idx=<%= Gsabun%>"><%=Gtitle%></a><% 
			 if(Gtotal>0){%><font color=red>[<%=Gtotal %>]</font><% 
			 }
			%></td>
		<td> <%= RS.getDate("nalja") %> </td>
		<td> <%= RS.getInt("pay") %> </td>
	</tr>	
		 
<%		 
	 }//while 
  }catch(Exception ex) {  }	
%>



	<tr align="center" height="45">
		<td colspan=6>	
			<%
			 //이전      
			 if( (startpage-limit)>0){ // [이전] [11]~[20] 
			   out.println("<a href='guestList.jsp?pageNUM=" + (startpage-limit) + returnpage + "'>[이전]</a>");
			 }
			
			 for(int i=startpage; i<(startpage+limit); i++){
				 if(i==pageNUM){
					out.println("<font size=7 color=red>[" + i +  "]</font>");      
				 }else{
			  		out.println("<a href='guestList.jsp?pageNUM=" + i + returnpage +"'>["+i+"]</a>");
				 }
				 
				 if(i>=pagecount)break;
			 } //for end
			 
			//다음  [71][72][73][74][75][76][77][78]        pagecount=78                        
			 if( (startpage+limit) <= pagecount){ // [이전] [11]~[20] [다음]
			   out.println("<a href='guestList.jsp?pageNUM=" + (startpage+limit) + returnpage +  "'>[다음]</a>");     
			 }
			%>
		</td> 
	</tr>
</table>

</body>
</html>






