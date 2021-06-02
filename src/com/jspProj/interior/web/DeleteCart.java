package com.jspProj.interior.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;

public class DeleteCart implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String id = null;
		String itemCode = null;
		String path = "";
		InteriorServiceImpl service = new InteriorServiceImpl();

		if (request.getMethod().equals("POST")) { // Post 방식일때 전체삭제
			id = request.getParameter("memberId");
			int n = service.deleteAllCart(id);
			if (n != 0) {
				path = "/cartPage.do";
			} else {
				path = "/index.do";
			}
		} else { // Get이면 선택
			id = request.getParameter("memberId");
			itemCode = request.getParameter("itemCode");
			int n = service.deleteCart(id, itemCode);
			if (n != 0) {
				path = "/cartPage.do";
			} else {
				path = "/index.do";
			}
		}

		return path;
	}

}
