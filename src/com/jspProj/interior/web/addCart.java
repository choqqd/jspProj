package com.jspProj.interior.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;

public class addCart implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String itemCode = request.getParameter("itemCode1");
		String amount1= request.getParameter("amount");
		
		int amount = Integer.parseInt(amount1);
		System.out.println(id + itemCode + amount);
		InteriorServiceImpl service = new InteriorServiceImpl();
		
		service.addCart(id, itemCode, amount);
		
		return "/cartPage.do";
	}

}
