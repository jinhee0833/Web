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
				System.out.println("EditPreController.java 화요일11:48");		
				ModelAndView  mav = new ModelAndView();
				
				 //guestDetail.jsp문서 <a href=editPre.do?idx=${bean.sabun}>[수정] </a>
				 int data = Integer.parseInt( request.getParameter("idx"));
				 System.out.println("넘어온sabun=" + data);
				
			 GuestDTO  dto = dao.dbDetail(data); //재사용
				mav.addObject("bean", dto); //재사용
				mav.setViewName("guestEdit"); //guest폴더/guestEdit.jsp
				return mav;
		}//end

}//class END








