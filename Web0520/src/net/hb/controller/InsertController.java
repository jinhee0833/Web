package net.hb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;


public class InsertController extends AbstractCommandController {
	  private  GuestDAO  dao ; 
	  public   GuestDAO getDao() {		return dao;		}
	  public   void setDao(GuestDAO dao) {		this.dao = dao;			}

	  protected ModelAndView handle(HttpServletRequest request,	HttpServletResponse response, Object ob, BindException be) throws Exception {
			ModelAndView mav = new ModelAndView( );	
			GuestDTO  dto = (GuestDTO)ob ; 			
			//dao.dbInsert(dto); 
			//mav.setViewName("redirect:list.do");
			System.out.println("넘어온사번: " + dto.getSabun());
			System.out.println("넘어온이름: " + dto.getName());
			System.out.println("넘어온제목: " + dto.getTitle());
			System.out.println("넘어온급여: " + dto.getPay());
			dao.dbInsert(dto);
			//mav.setViewName("three");  //guest폴더/three.jsp
			mav.setViewName("redirect:list.do");  //guest폴더/guestList.jsp
			return mav;
	} //end

}//class END
