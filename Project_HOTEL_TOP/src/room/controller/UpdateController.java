package room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import room.dao.RoomDAO;
import room.vo.RoomVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpdateController.do")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)");
	}// end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)");
	}// end doPost

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RoomDAO rdao = new RoomDAO();
		RoomVO rvo = new RoomVO();
		System.out.println("in update contoller");
		String data1 = request.getParameter("roomId");
		
		String dt = request.getParameter("dt");
		if (dt==null) {
			dt = "2";
			System.out.println(" dt = 2");
		}
		
		System.out.println("dt: " + dt);
		if(dt.equals("1")){ // view update form
			System.out.print("if�� in");
			rvo = rdao.detailRoom(data1);	
			System.out.println("rvo" + rvo.toString());
			request.setAttribute("rvo", rvo);
			
			RequestDispatcher dis = request.getRequestDispatcher("room/updateAction.jsp");
			dis.forward(request, response);
		}
		else if(dt.equals("2")){// update
			System.out.println("in if dt equals = 2");
			try{
				System.out.println("in if 3");
				int uploadFileSizeLimit = 5*1024*1024;
				System.out.println("in if 4");
				String encType = "UTF-8";
				System.out.println("in if 5");
				ServletContext context = this.getServletContext();
				System.out.println("in if 6");
				String uploadFilePath = context.getRealPath("images/room");
				System.out.println("in if 7");
				MultipartRequest multi = new MultipartRequest(request,
						uploadFilePath,
						uploadFileSizeLimit,
						encType,
						new DefaultFileRenamePolicy());
				System.out.println("in if 8");
				Enumeration files = multi.getFileNames();
//				while(files.hasMoreElements()){
//					String file = (String) files.nextElement();
//					String file_name = multi.getFilesystemName(file);
//					String ori_file_name = multi.getOriginalFileName(file);
//					out.print("<br> 업로드된 파일명 : " + file_name);
//					out.print("<br> 원본 파일명 : " + ori_file_name);
//					
//					out.println("<hr>");
//				}
				System.out.println("before multi getparameter");
				data1 = multi.getParameter("roomId");
				String data2 = multi.getParameter("roomType");
				int data3 = Integer.parseInt(multi.getParameter("roomCost"));
				int data4 = Integer.parseInt(multi.getParameter("roomCap"));
				String data5 = multi.getFilesystemName("room1");
				String data6 = multi.getFilesystemName("room2");
				String data7 = multi.getFilesystemName("room3");
				String data8 = multi.getFilesystemName("room4");
				String data9 = multi.getParameter("roomInfo1");
				String data10 = multi.getParameter("roomInfo2");
				String data11 = multi.getParameter("roomInfo3");
				System.out.println("data1:" + data1 + "data2= : " + data2);
				System.out.println("room1:" + data5 + "room2= : " + data6);
				System.out.println("room3:" + data7 + "data4= : " + data8);
				
				rvo.setRoomID(data1);
				System.out.println("data1");
				rvo.setRoomType(data2);
				System.out.println("data2");
				rvo.setRoomCost(data3);
				System.out.println("data3");
				rvo.setRoomCap(data4);
				System.out.println("data4");
				rvo.setRoom1(data5);
				rvo.setRoom2(data6);
				rvo.setRoom3(data7);
				rvo.setRoom4(data8);
				rvo.setRoomInfo1(data9);
				rvo.setRoomInfo2(data10);
				rvo.setRoomInfo3(data11);
				System.out.println("2��=="+rvo.toString());
				int ok = rdao.updateRoom(rvo);
				request.setAttribute("ok", ok);
				response.sendRedirect("updateselect.do");
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		

	}// end doPost

}// end class
