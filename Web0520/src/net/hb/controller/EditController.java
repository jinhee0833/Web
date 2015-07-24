package net.hb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;


public class  EditController extends AbstractCommandController {
			private  GuestDAO  dao ; 
	  public   GuestDAO getDao() {		return dao;		}
			public   void setDao(GuestDAO dao) {		this.dao = dao;			}

	protected ModelAndView handle(HttpServletRequest request,		HttpServletResponse response, Object ob, BindException be) throws Exception {
			ModelAndView mav = new ModelAndView( );	
			System.out.println("EditController.java 화요일 11: 50 ");
			GuestDTO  dto = (GuestDTO)ob ; 			
			//dao.dbInsert(dto); 신규저장처리하는 DAO단
			System.out.println("수정할사번: " + dto.getSabun());
			System.out.println("수정할이름: " + dto.getName());
			System.out.println("수정할제목: " + dto.getTitle());
			System.out.println("수정할급여: " + dto.getPay());
			
			dao.dbEdit(dto); 
			mav.setViewName("redirect:list.do"); 
			return mav;
	} //end

}//class END
