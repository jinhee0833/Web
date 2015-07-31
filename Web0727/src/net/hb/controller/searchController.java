package net.hb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;

public class searchController extends AbstractCommandController {
	private GuestDAO dao;
	
	public GuestDAO getDao() {return dao;}
	public void setDao(GuestDAO dao) {this.dao = dao;}

	protected ModelAndView handle(HttpServletRequest request,HttpServletResponse response, Object ob, BindException be) throws Exception {
		ModelAndView mav = new ModelAndView();
		try{
			GuestDTO dto = new GuestDTO();
			String sel = request.getParameter("sel");
			
			if(sel.equals("sabun")){
				String search = request.getParameter("search");
				dto.setSabun(search);
			}else if(sel.equals("name")){
				String search = request.getParameter("search");
				dto.setName(search);
			}else if(sel.equals("title")){
				String search = request.getParameter("search");
				dto.setTitle(search);	
			}
			
			List<GuestDTO> list = dao.dbSearch(dto);
			mav.addObject("list", list);
			mav.setViewName("guestlist");
		}catch(Exception ex){}
		return mav;
	}

	
	
}
