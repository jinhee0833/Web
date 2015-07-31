package net.hb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ListContoller implements Controller {
	private GuestDAO dao;

	public GuestDAO getDao() {
		return dao;
	}

	public void setDao(GuestDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println("ListContoller.java");
			
			String sel = request.getParameter("sel");
			String search = request.getParameter("search");
			int pagenum = 1;
			int pagesize =10;
			int limit = 10;
			pagenum = Integer.parseInt(request.getParameter("pageNUM"));
			
			int start = 1;
			int end = 10;
			int startpage=1;
			int endpage=7;
			int maxpage=1;
			
			String page = "&sel="+sel+"&search="+search;
			
			
			
			
			
			List<GuestDTO> list = dao.dbSelect();
			int cnt = dao.dbCount();
			System.out.println("갯수:" + cnt);
			
			mav.addObject("start",start);
			mav.addObject("end",end);
			mav.addObject("startpage",startpage);
			mav.addObject("endpage",endpage);
			mav.addObject("maxpage",maxpage);
			mav.addObject("list", list);
			mav.addObject("cnt", cnt);
			mav.setViewName("guestlist");
		} catch (Exception ex) {
		}
		return mav;
	}

}
