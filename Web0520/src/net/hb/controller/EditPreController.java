package net.hb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;
import java.util.List;

public class EditPreController  implements Controller {
		private  GuestDAO  dao ; 
		public   GuestDAO getDao() {		return dao;		}
		public   void setDao(GuestDAO dao) {		this.dao = dao;			}
		
		public ModelAndView handleRequest(HttpServletRequest request,			HttpServletResponse response) throws Exception {
				System.out.println("EditPreController.java ȭ����11:48");		
				ModelAndView  mav = new ModelAndView();
				
				 //guestDetail.jsp���� <a href=editPre.do?idx=${bean.sabun}>[����] </a>
				 int data = Integer.parseInt( request.getParameter("idx"));
				 System.out.println("�Ѿ��sabun=" + data);
				
			 GuestDTO  dto = dao.dbDetail(data); //����
				mav.addObject("bean", dto); //����
				mav.setViewName("guestEdit"); //guest����/guestEdit.jsp
				return mav;
		}//end

}//class END








