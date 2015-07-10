<%@ page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ page import="net.hb.common.DBNoticeBean"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
   response.setCharacterEncoding("UTF-8");
   response.setContentType("text/html;charset=UTF-8");
   request.setCharacterEncoding("UTF-8");
%>

<html>
<link rel="Stylesheet" type="text/css" href="css/facility.css"
   media="screen">

<style>
A:link {
   font: 9pt;
   text-decoration: none;
   color: #000000
}

A:active {
   text-decoration: none;
   color: #990099
}

A:visited {
   text-decoration: none;
   color: #3A3A3A
}

A:hover {
   text-decoration: none;
}

td {
   font-family: Segoe UI Symbol;
   color: black;
}

.facility {
   position: absolute;
   top: 230px;
   margin-left: 0px;
   padding: 0px;
   height: 900px;
   width: 1759px;
   background-color: #ffffff;
}

#f {
   position: absolute;
   margin-left: 200px;
   top: 50px;
   width: 10px;
   text-decoration: none;
   font-family: 'Nanum Myeongjo';
   color: #81725F;
   font-size: 45px;
}

#m {
   position: absolute;
   margin-left: 500px;
   top: 50px;
   width: 1100px;
   text-decoration: none;
   font-family: 'Nanum Myeongjo';
   color: #81725F;
}
</style>
</head>
<body>
   <div class="facility">

      <%@ include file="sidebar.jsp"%>
      <div id="f">NOTICE</div>

      <div id="m">
         <a href="layout.jsp">Home</a> > <a href="notice.jsp">ABOUT HOTEL</a>
         > NOTICE
         <h1>NOTICE</h1>



         <table width="600" height="300">

            <%
               try {
                  DBNoticeBean bean = (DBNoticeBean) request.getAttribute("cont");
            %>


            <tr>
               <td bgcolor="#F4EEE3" height="10%" width="25%">제목</td>
               <td colspan="3"><%=bean.getTitle()%></td>
            </tr>

            <tr>
               <td bgcolor="#F4EEE3" height="10%" width="25%">작성자</td>
               <td><%=bean.getWriter()%></td>
               <td bgcolor="#F4EEE3" width="25%" width="25%">작성일</td>
               <td width="25%"><%=bean.getNalja()%></td>
            </tr>

            <tr>
               <td bgcolor="#F4EEE3" >내용</td>
               <td style="size: 300px;" colspan="3"><%=bean.getContent()%><br>
                  <img
                  src="<%=request.getContextPath()%>\rain\<%=bean.getFilename()%>"></td>
            </tr>

         </table>
         <p>

            <a
               href="noticeEdit.jsp?edt0=<%=bean.getNum()%>&edt1=<%=bean.getWriter()%>&edt2=<%=bean.getTitle()%>&edt3=<%=bean.getContent()%>">수정하기</a>&nbsp;
            <a href="noticeDelete.do?del=<%=bean.getNum()%>">삭제</a>&nbsp; <a
               href="noticeList.do">목록보기</a>

            <%
               } catch (Exception ex) {
               }
            %>
         </p>
      </div>
   </div>
   <%@ include file="bottom.jsp"%>
</body>
</html>