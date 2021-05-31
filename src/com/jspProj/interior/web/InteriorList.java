package com.jspProj.interior.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.service.InteriorService;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;
import com.jspProj.interior.vo.InteriorVO;

public class InteriorList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		InteriorService service = new InteriorServiceImpl();
		
		List<InteriorVO> list = service.interiorList();
		
		request.setAttribute("interior", list);
		
		return "interior/interiorList.tiles";
	}

}
