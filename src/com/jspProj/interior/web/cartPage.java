package com.jspProj.interior.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;
import com.jspProj.interior.vo.InteriorVO;

public class cartPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		InteriorServiceImpl service = new InteriorServiceImpl();
		List<InteriorVO> list = service.cartList(id);
		
		request.setAttribute("list", list);
		
		return "cart/cartPage.tiles";
	}

}
