package net.hb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;

public class InsertController extends AbstractCommandController {
	private GuestDAO dao;
	
	public GuestDAO getDao() {return dao;}
	public void setDao(GuestDAO dao) {this.dao = dao;}

	protected ModelAndView handle(HttpServletRequest request,HttpServletResponse response, Object ob, BindException be) throws Exception {
		ModelAndView mav = new ModelAndView();
		try{
			
			
			System.out.println("InsertContoller.java");
			GuestDTO dto = (GuestDTO)ob;
			dao.dbInsert(dto);
			
			mav.setViewName("redirect:select.do");		
		}catch(Exception ex){}
		return mav;
	}

	
	
}
