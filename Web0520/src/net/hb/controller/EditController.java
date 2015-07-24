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
			System.out.println("EditController.java ȭ���� 11: 50 ");
			GuestDTO  dto = (GuestDTO)ob ; 			
			//dao.dbInsert(dto); �ű�����ó���ϴ� DAO��
			System.out.println("�����һ��: " + dto.getSabun());
			System.out.println("�������̸�: " + dto.getName());
			System.out.println("����������: " + dto.getTitle());
			System.out.println("�����ұ޿�: " + dto.getPay());
			
			dao.dbEdit(dto); 
			mav.setViewName("redirect:list.do"); 
			return mav;
	} //end

}//class END
