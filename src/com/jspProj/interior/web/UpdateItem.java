package com.jspProj.interior.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;
import com.jspProj.interior.vo.InteriorVO;

public class UpdateItem implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemCode = request.getParameter("itemCode");
		
		request.setAttribute("itemCode", itemCode);
		return "interior/itemUpdate.tiles";
	}

}
