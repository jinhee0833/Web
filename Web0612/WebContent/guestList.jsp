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
	Connection CN; //db��������,id,password/ ��ɾ����
	Statement  ST; //ST=CN.createStatement( )
	PreparedStatement PST; //PST=CN.prepareStatement(sql)
	ResultSet RS; //RS=ST.executeQuery(select~); 
	              //��ȸ�Ѱ���� RS���, ù��°���ڵ��̵� next( )
	              
	private  String sql;
	private  int Gsabun; //���
	private  String Gname; //�̸�
	private  String Gtitle; //����
	private  int start=11; // [2]Ŭ��  11���ڵ��ȣ
	private  int end=20; //   [2]Ŭ��  20���ڵ��ȣ
	
	private  int total=0, pagecount=1,Gtotal=0;  
	///////////////����¡���п� �ʿ��� �ʵ�///////////////////
	private  String pnum; // <a href=guestList.jsp?pageNUM
	private  int pageNUM;
	private  int limit=10, pagesize=10 ;
	private  int startpage=1, temp=1;
	private  int num=0;  // num = ��������  - ( ) * limit ; 
	
	///////////////�˻� �ʿ��� �ʵ�///////////////////
	private  String skey; //select���� ������ �׸�
	private  String sval; //�˻�Ű����
	private  String  sqry; //�˻����ʿ��� ������
	private  String  returnpage ; //�̸��˻� g => [1][2][3][4][5]
%>

<%
  try{
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	   CN=DriverManager.getConnection(url, "system", "oracle");
	   //out.println("<h1>���Ἲ������ 2:34 2:37 3:20 </h1>"); 
  }catch(Exception ex){  }
%>

<%
	skey=request.getParameter("keyfield"); //�޺��ڽ����� ����
	sval=request.getParameter("keyword");//�˻����Է�
	sqry= " " ;
	if(skey==null || sval==null){ //�ʵ嵵���þ��ϰ�,�˻�Ű�����Է¾��ϰ�
		skey="title";   sval=""; 
	}
	sqry="  where "	 + skey.trim( ) + " like '%" + sval.trim( ) + "%'";
	returnpage = "&keyfield=" + skey +"&keyword="+ sval ; //�Ǹ������߰�
	
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
					�˻�:
					<select name="keyfield">
						<option value="name" selected>�� �� </option>         
						<option value="title" >�� �� </option>
						<option value="content">�� ��  </option>
					</select>	
					<input type="text" name="keyword" value="">
					<input type="submit" value="�� ��">			
					
			</form>
		</td>
	 </tr>

	<tr align="right"  height="45" bgcolor=yellow>
		<td colspan=6>	
			<font size=6> ���ڵ尹��: <%=  total %> &nbsp;&nbsp;</font>
		</td> 
	</tr>
	

	<tr bgcolor="pink" align="center" height="45">
		<td>�۹�ȣ</td> <td>�� ��</td> <td>�� ��</td>
		<td>�� ��</td>  <td>�� ¥</td> <td>�� ��</td> 
	</tr>
<%
  try{
	  pnum = request.getParameter("pageNUM");//[1][2]~[9][10]
	  if(pnum==null) {  pageNUM=1; }
	  else { pageNUM = Integer.parseInt(pnum); }
	  
	  //��ü���ڵ� 780��  780%10���ڵ�� �����ϰڽ��ϴ�
	  //total=780  �ѹ�ȣ�� 10������� [1][2][3][4][5]
	  if(total%limit==0){ pagecount= total/limit; }
	  else{ pagecount = total/limit + 1 ; } 
	  
	  start = (pageNUM-1)*pagesize + 1 ; //[3] pagecount  ��������
	  end = pageNUM*pagesize ; //[3]  pagecount ��������
	  
	 //sql="select  rownum  as rn, sabun,name,title, nalja, pay from  guest";
	 sql =  "select  *  from  (";
	 sql += "select  rownum as rn, sabun,name,title, nalja, pay from  " ;
	 sql += " (select * from  guest " + sqry + " order by sabun )" ; 
	 sql += ") where rn between " + start + " and " + end ;
	 System.out.println(sql) ;
	 
	 ST = CN.createStatement();
	 RS = ST.executeQuery(sql); //��ȸ�Ѱ����ü���� RS���
	 
	 //������������ �˾ƾ� ����  [1]~10 [11]~20  [21]~30
	 //[31][32][33] ~~~[38Ŭ��][39][40]
	 temp= (pageNUM-1)%limit;   
	 startpage=pageNUM-temp;  
	 System.out.println("temp="+temp+"\tstartpage=" + startpage);
	 ///////////////num���� ��� �̾Ƴ����� 
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
			 //����      
			 if( (startpage-limit)>0){ // [����] [11]~[20] 
			   out.println("<a href='guestList.jsp?pageNUM=" + (startpage-limit) + returnpage + "'>[����]</a>");
			 }
			
			 for(int i=startpage; i<(startpage+limit); i++){
				 if(i==pageNUM){
					out.println("<font size=7 color=red>[" + i +  "]</font>");      
				 }else{
			  		out.println("<a href='guestList.jsp?pageNUM=" + i + returnpage +"'>["+i+"]</a>");
				 }
				 
				 if(i>=pagecount)break;
			 } //for end
			 
			//����  [71][72][73][74][75][76][77][78]        pagecount=78                        
			 if( (startpage+limit) <= pagecount){ // [����] [11]~[20] [����]
			   out.println("<a href='guestList.jsp?pageNUM=" + (startpage+limit) + returnpage +  "'>[����]</a>");     
			 }
			%>
		</td> 
	</tr>
</table>

</body>
</html>






