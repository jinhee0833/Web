package net.hb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;
import java.util.List;

public class ListController  implements Controller {
	private  GuestDAO  dao ; 
	public   GuestDAO getDao() {		return dao;		}
	public   void setDao(GuestDAO dao) {		this.dao = dao;			}
			
	public ModelAndView handleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {
					System.out.println("ListController.java 목요일 11:35");		
					ModelAndView  mav = new ModelAndView();
					List<GuestDTO> data = dao.dbSelect(); //data지역개체이름
					mav.addObject("hb", data);
					mav.setViewName("guestList"); //guest폴더/guestList.jsp
					return mav;
			}//end

}//class END













