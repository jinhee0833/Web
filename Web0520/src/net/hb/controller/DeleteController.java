package net.hb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;
import java.util.List;

public class DeleteController  implements Controller {
	  private  GuestDAO  dao ; 
	  public   GuestDAO getDao() {		return dao;		}
	  public   void setDao(GuestDAO dao) {		this.dao = dao;			}
		
		public ModelAndView handleRequest(HttpServletRequest request,			HttpServletResponse response) throws Exception {
				System.out.println("DeleteController.java 화요일 11:36");		
				ModelAndView  mav = new ModelAndView();
				
				 //guestDetail.jsp문서 삭제버튼클릭해서 삭제데이타받음
				 int data = Integer.parseInt( request.getParameter("idx"));
				 System.out.println("삭제할 사번 sabun=" + data);
				
				dao.dbDelete(data); //DAO단에 연결시킴 
				mav.setViewName("redirect:/list.do"); //guest폴더/guestList.jsp
				return mav;
		}//end

}//class END








