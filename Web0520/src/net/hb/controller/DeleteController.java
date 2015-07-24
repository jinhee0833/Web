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
				System.out.println("DeleteController.java ȭ���� 11:36");		
				ModelAndView  mav = new ModelAndView();
				
				 //guestDetail.jsp���� ������ưŬ���ؼ� ��������Ÿ����
				 int data = Integer.parseInt( request.getParameter("idx"));
				 System.out.println("������ ��� sabun=" + data);
				
				dao.dbDelete(data); //DAO�ܿ� �����Ŵ 
				mav.setViewName("redirect:/list.do"); //guest����/guestList.jsp
				return mav;
		}//end

}//class END








