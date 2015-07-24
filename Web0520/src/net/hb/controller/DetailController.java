package net.hb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;
import java.util.List;

public class DetailController  implements Controller {
		private  GuestDAO  dao ; 
		public   GuestDAO getDao() {		return dao;		}
		public   void setDao(GuestDAO dao) {		this.dao = dao;			}
		
		public ModelAndView handleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {
				System.out.println("DetailController.java 수요일 09:20");		
				ModelAndView  mav = new ModelAndView();
				
				int data = Integer.parseInt( request.getParameter("idx"));
				System.out.println("넘어온idx=" + data);
				
				GuestDTO  dto = dao.dbDetail(data); //dao=data access object
				mav.addObject("bean", dto);
				mav.setViewName("guestDetail"); //guest폴더/guestDetail.jsp
				return mav;
		}//end

}//class END








