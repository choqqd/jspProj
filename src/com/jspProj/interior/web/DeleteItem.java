package com.jspProj.interior.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.service.InteriorService;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;
import com.jspProj.interior.vo.InteriorVO;

public class DeleteItem implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemCode = request.getParameter("itemCode");
		
		InteriorVO vo = new InteriorVO();
		vo.setItemCode(Integer.parseInt(itemCode));
		InteriorService service= new InteriorServiceImpl();
		service.deleteInterior(vo);
		
		return "/interiorList.do";
	}

}
